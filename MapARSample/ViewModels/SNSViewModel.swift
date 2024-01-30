import SwiftUI

class SNSViewModel: ObservableObject {
    func postUserData(uid: String, userId: String, nickname: String) {
        guard var urlComponents = URLComponents(string: "http://localhost:31577/userdata") else {
            print("Invalid server URL")
            return
        }

        // Append additional query parameters if needed
        urlComponents.queryItems = [
            URLQueryItem(name: "uid", value: uid),
            URLQueryItem(name: "userId", value: userId),
            URLQueryItem(name: "NickName", value: nickname)
        ]

        guard let url = urlComponents.url else {
            print("Invalid URL after appending query parameters")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

      let userData: [String: Any] = [
        "uid" : uid,
        "userId": userId,
        "NickName" : nickname
      ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: userData)  // Provide your actual data here if needed
            request.httpBody = jsonData
        } catch {
            print("Error creating JSON data: \(error.localizedDescription)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending user data to server: \(error.localizedDescription)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Server response: \(responseString)")
                }
            }
        }

        // Don't forget to resume the task to initiate the request
        task.resume()
    }
}

