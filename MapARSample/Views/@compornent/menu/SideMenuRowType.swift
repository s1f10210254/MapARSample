import Foundation

enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case post
    case news
    case setting

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .post:
            return "Post"
        case .news:
            return "News"
        case .setting:
            return "Setting"
        }
    }

    var iconName: String {
        switch self {
        case .home:
            return "homekit"
        case .post:
            return "camera.viewfinder"
        case .news:
            return "newspaper"
        case .setting:
            return "gearshape"
        }
    }
}
