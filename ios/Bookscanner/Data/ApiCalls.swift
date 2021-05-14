//
//  ApiCalls.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 14/05/2021.
//

import Foundation

class ApiCalls {
    private let server = "http://localhost:5000"
    
    private func generateEndpointUrl(endpoint: String) -> URL {
        let url = "\(server)/\(endpoint)"
        return URL(string: url)!
    }
    
    func saveNewBook(book: NewBook) {
        let url = generateEndpointUrl(endpoint: "addbook")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
//        do {
//            request.httpBody = try JSONEncoder().encode(book)
//
//            URLSession.shared.getAllTasks { (openTasks: [URLSessionTask]) in
//               NSLog("open tasks: \(openTasks)")
//            }
//
//            let task = URLSession.shared.dataTask(with: request, completionHandler: { (responseData: Data?, response: URLResponse?, error: Error?) in
//               NSLog("\(response)")
//            })
//            task.resume()
//        } catch let err {
//            print(err)
//        }
    }
}
