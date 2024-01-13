import SwiftUI
import ReplayKit
import ARKit

struct ARWirapper: UIViewRepresentable{
  @Binding var SubmittedExportRequest: Bool
  @Binding var exportedURL: URL?
  let arView = ARView(frame: .zero)
  func makeUIView(context: Context)->ARView{
    return arView
  }

  func updateUIView(_ uiView:ARView, context: Context){
    let vm = ExportViewModel()
    setARViewOptions(arView)
    let configuration = buildConfigure()
    arView.session.run(configuration)
    if SubmittedExportRequest{
      guard let camera = arView.session.currentFrame?.camera else {return}
      if let meshAnchors = arView.session.currentFrame.anchors.compactMap( {$0 as? ARMeshAnchor} ),
         let asset = vm.convertToAsset(meshAnchor: meshAnchors, camera: camera){
        do {
          let url = try vm.export(asset: asset)
        }catch{
          print("Export failure")
        }
      }
    }
  }

  private func buildConfigure() -> ARWorldTrackingConfiguration {
    let configuration = ARWorldTrackingConfiguration()

    configuration.environmentTexturing = .automatic
    configuration.sceneReconstruction = .meshWithClassification

    arView.automaticallyConfigureSession = false

    if type(of: configuration).supportsFrameSemantics(.sceneDepth){
      configuration.frameSemantics = .sceneDepth
    }
    return configuration
  }

  private func setARViewOptions(_ arView: ARView){
    arView.debugOptions.insert(.showSceneUnderstanding)
  }
}

class ExportViewModel: NSObject, ObservableObject, ARSessionDelegate{
  func convertToAsset(meshAnchor: [ARMeshAnchor], camera: ARCamera) -> MDLAsset?{
    guard let device = MTLCreateSystemDefaultDevice() else { return nil}

    let asset = MDLAsset()

    for anchor in meshAnchor {
      let mdlMesh = anchor.geometry.toMDLMes(device: device, camera: camera, modelMtrix: anchor.transform)
    }
    return asset
  }

  func export(asset: MDLAsset) throws -> URL {
    guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
      throw NSError(domain: "com.original.CreatingLiderModel", code: 153)
    }
    let folderName = "OBJ_FILES"
    let folderURL = directory.appendingPathComponent(folderName)

    try? FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
    let url = folderURL.appendingPathComponent("\(UUID().uuidString).obj")

    do{
      try asset.export(to: url)
      print("Object saved successfully at", url)
      return url
    } catch {
      print(error)
    }
    return url
  }
}
