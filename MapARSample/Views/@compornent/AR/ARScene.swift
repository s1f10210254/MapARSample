//import Foundation
//import ARKit
//
//class ARScene: NSObject, ARSessionDelegate {
//  private var arSceneView: ARSCNView!
//  func session(_ session: ARSession, didUpdate frame: ARFrame) {
//    // カメラのフレームが更新された時の処理
//    print("ARFrame updated")
//  }
//
//  func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
//    // ARアンカーが追加された時の処理
//    for anchor in anchors {
//      if let node = createNodeForAnchor(anchor) {
//        arSceneView.scene.rootNode.addChildNode(node)
//      }
//    }
//  }
//
//  func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//    // ARアンカーが更新された時の処理
//    for anchor in anchors {
//      updateNodeForAnchor(anchor)
//    }
//  }
//
//  func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
//    // ARアンカーが削除された時の処理
//    for anchor in anchors {
//      removeNodeForAnchor(anchor)
//    }
//  }
//
//  private func createNodeForAnchor(_ anchor: ARAnchor) -> SCNNode? {
//    // ARアンカーに対応するSCNNodeを作成するロジックを追加
//
//    // 例: ボックスのジオメトリを持つノードを作成
//    let boxGeometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.0)
//    let boxNode = SCNNode(geometry: boxGeometry)
//
//    // アンカーの位置にノードを配置
//    boxNode.position = SCNVector3(anchor.transform.columns.3.x,
//                                  anchor.transform.columns.3.y,
//                                  anchor.transform.columns.3.z)
//
//    return boxNode
//  }
//
//  private func updateNodeForAnchor(_ anchor: ARAnchor) {
//    // ARアンカーに対応するSCNNodeを更新するロジックを追加
//
//    guard let existingNode = arSceneView.node(for: anchor) else {
//      // ノードが存在しない場合は何もしないか、新たにノードを作成
//      let newNode = createNodeForAnchor(anchor)
//      arSceneView.scene.rootNode.addChildNode(newNode!)
//      return
//    }
//
//    // ノードが存在する場合は位置を更新
//    existingNode.position = SCNVector3(anchor.transform.columns.3.x,
//                                       anchor.transform.columns.3.y,
//                                       anchor.transform.columns.3.z)
//  }
//
//  private func removeNodeForAnchor(_ anchor: ARAnchor) {
//    // ARアンカーに対応するSCNNodeを削除するロジックを追加
//
//    if let existingNode = arSceneView.node(for: anchor) {
//      existingNode.removeFromParentNode()
//    }
//  }
//
//}
//
