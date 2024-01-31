import SwiftUI

struct SideMenuView: View {
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool

    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 3)
                VStack(alignment: .leading, spacing: 0) {
                    profileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
                    ForEach(SideMenuRowType.allCases, id: \.self) { row in
                        rowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(
                    Color.white
                )
            }
            Spacer()
        }
        .background(.clear)
    }

    @ViewBuilder
    private func profileImageView() -> some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Image("<#好きな画像#>")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.blue.opacity(0.3), lineWidth: 10)
                    )
                    .cornerRadius(50)
                Spacer()
            }

            Text("<#好きなテキスト#>")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)

            Text("<#好きなテキスト#>")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black.opacity(0.5))
        }
    }

    @ViewBuilder
    private func rowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (() -> Void)) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(isSelected ? .blue.opacity(0.3) : .white)
                        .frame(width: 5)
                    ZStack {
                        Image(systemName: imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .blue.opacity(0.3) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }

}


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: .constant(false))
    }
}
