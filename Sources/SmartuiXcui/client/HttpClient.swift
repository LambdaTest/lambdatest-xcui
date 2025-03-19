
import Foundation

class HttpClient {
    
    func postScreenshot(screenshotDetails: [String: String]) throws-> String? {
        guard let url = URL(string: Constants.ApiConstants.UPLOAD_API) else {
            print("Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: Constants.KeyConstants.contentType)
        
        var body = Data()
        
        for (key, value) in screenshotDetails {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        }
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let semaphore = DispatchSemaphore(value: 0)
        var responseString: String?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error while posting screenshot: \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode) {
                    print("Screenshot posted successfully: \(httpResponse.statusCode)")
                    responseString = String(httpResponse.statusCode)
                } else {
                    let responseBody = data != nil ? String(data: data!, encoding: .utf8) ?? "Invalid response body" : "No response body"
                    print("Unexpected response code for post Screenshot: \(httpResponse.statusCode) \nResponse Body: \(responseBody)")
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return responseString
    }
    
    func postRealDeviceScreenshot(realDeviceScreenshotDetails: [String: Any]) throws-> String? {
        guard let url = URL(string: Constants.ApiConstants.REAL_DEVICE_UPLOAD_API) else {
            print("Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: Constants.KeyConstants.contentType)
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: realDeviceScreenshotDetails, options: [])
            request.httpBody = jsonData
        } catch {
            print("Failed to serialize JSON: \(error.localizedDescription)")
            return nil
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        var responseString: String?
        
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print("Network error while posting real device screenshot: \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode) {
                    print("Real device screenshot posted successfully: \(httpResponse.statusCode)")
                    responseString = String(httpResponse.statusCode)
                } else {
                    print("Unexpected response code for posting real device screenshot: \(httpResponse.statusCode)")
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return responseString
    }
}
