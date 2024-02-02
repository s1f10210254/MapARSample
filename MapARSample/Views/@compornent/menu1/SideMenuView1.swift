import SwiftUI

struct SideMenuView1: View {
    @Binding var isOpen: Bool
    @Binding var text: String
    let width: CGFloat = 270

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .opacity(1.0)
//            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.isOpen = false
            }

            HStack {
                VStack() {
                    SideMenuContentView1(topPadding: 100, systemName: "person", text: "Profile", bindText: $text, isOpen: $isOpen)
                    SideMenuContentView1(systemName: "bookmark", text: "Bookmark", bindText: $text, isOpen: $isOpen)
                    SideMenuContentView1(systemName: "gear", text: "Setting", bindText: $text, isOpen: $isOpen)
                    Spacer()
                }
                .frame(width: width)
                .background(Color(UIColor.systemGray6))
                .offset(x: self.isOpen ? 0 : -self.width)
//                .animation(.easeIn(duration: 0.25))
                Spacer()
            }
        }
    }
}

// セルのビュー
struct SideMenuContentView1: View {
    let topPadding: CGFloat
    let systemName: String
    let text: String
    @Binding var bindText: String
    @Binding var isOpen: Bool

    init(topPadding: CGFloat = 30, systemName: String, text: String, bindText: Binding<String>, isOpen: Binding<Bool>) {
        self.topPadding = topPadding
        self.systemName = systemName
        self._bindText = bindText
        self._isOpen = isOpen
        self.text = text
    }

    var body: some View {
        HStack {
            Image(systemName: systemName)
                .foregroundColor(.gray)
                .imageScale(.large)
                .frame(width: 32.0)
            Text(text)
                .foregroundColor(.gray)
                .font(.headline)
            Spacer()
        }
        .padding(.top, topPadding)
        .padding(.leading, 32)
        .onTapGesture {
            self.bindText = self.text
            self.isOpen = false
        }
    }
}
