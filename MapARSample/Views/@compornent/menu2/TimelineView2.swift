import SwiftUI

struct Timeline {
    let id: Int
    let name: String
    let image: String
    let post: String
    let post_image: String
}

let timelines: [Timeline] = [
    Timeline(id: 0, name: "Arupaka", image: "animal_arupaka", post: "This is post content", post_image: "ice_1"),
    Timeline(id: 1, name: "Buta", image: "animal_buta", post: "This is post content", post_image: "ice_2"),
    Timeline(id: 2, name: "Hamster", image: "animal_hamster", post: "This is post content", post_image: "flower"),
    Timeline(id: 3, name: "Hiyoko", image: "animal_hiyoko", post: "This is post content", post_image: "moon"),
    Timeline(id: 4, name: "Inu", image: "animal_inu", post: "This is post content", post_image: "animal_inu")
]

struct TimelineView2: View {
    let timelines: [Timeline]

    var body: some View {
        VStack() {
            ForEach(self.timelines, id: \.id) { (timeline) in
                VStack(spacing: 5) {
                    HStack(alignment: .top) {
                        Image(timeline.image)
                            .resizable()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4))
                            .frame(width: 60, height: 60, alignment: .leading)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(timeline.name)
                                    .fontWeight(.bold)
                                Text("@\(timeline.name)")
                                    .foregroundColor(.gray)
                            }
                            Text(timeline.post)
                            Image(timeline.post_image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal, 10)
                    Divider()
                }
            }
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView2(timelines: timelines)
    }
}
