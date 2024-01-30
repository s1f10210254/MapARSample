import RealityKit
import SwiftUI


class Coordinator{
  var arVIew = ARView()
  var startAnchor: AnchorEntity?
  var endAnchor: AnchorEntity?

  var measurementLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var resultButton: UIButton = {
    let primaryAction = UIAction(handler: { _ in
      self.startAnchor = nil
      self.endAnchor = nil
      self.arVIew.scene.anchors.removeAll()
      self.measurementLabel.text = ""
    })

    let button = UIButton(configuration: .gray(), primaryAction: primaryAction)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Reset", for: .normal)

    return button
  }()

  @objc func handleTap(recognizer: UITapGestureRecognizer){
    let mesh = MeshResource.generateSphere(radius: 0.005)
    let material = SimpleMaterial(color: .yellow, isMetallic: false)
    let sphere = ModelEntity(mesh: mesh, materials: [material])

    let tappedLocation = recognizer.location(in: arVIew)
    let results = arVIew.raycast(from: tappedLocation, allowing: .estimatedPlane, alignment: .horizontal)
    let resultsFirst = results.first

    guard let result = resultsFirst else{
      return
    }
    if startAnchor == nil{
      startAnchor = AnchorEntity(world: result.worldTransform)
      startAnchor?.addChild(sphere)

      guard let startAnchor = startAnchor else{
        return
      }

      arVIew.scene.addAnchor(startAnchor)
    } else if endAnchor == nil{
      endAnchor = AnchorEntity(world: result.worldTransform)
      endAnchor?.addChild(sphere)

      guard let endAnchor = endAnchor,
            let startAnchor = startAnchor
      else{
        return
      }

      arVIew.scene.addAnchor(endAnchor)

      let distance = simd_distance(startAnchor.position(relativeTo: nil), endAnchor.position(relativeTo: nil))
      let distanceIntCentimeters = Int(distance * 100)
      let distanceText = "\(distanceIntCentimeters) cm"

      measurementLabel.text = distanceText
    }
  }

  func setupUi(){
    let stackView = UIStackView(arrangedSubviews: [measurementLabel, resultButton])
    stackView.axis = .horizontal
    stackView.spacing = 20
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false

    arVIew.addSubview(stackView)

    stackView.centerXAnchor.constraint(equalTo: arVIew.centerXAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: arVIew.bottomAnchor, constant: -65).isActive = true
    stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
}
