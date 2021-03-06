//
//  ApiCalls.swift
//  Bookscanner
//
//  Created by Luciano Nooijen on 14/05/2021.
//

import Foundation

class ApiCalls {
    
    private let server = "http://192.168.2.5:8000"
    
    private func generateEndpointUrl(endpoint: String) -> URL {
        let url = "\(server)/\(endpoint)"
        return URL(string: url)!
    }
    
    func saveNewBook(book: NewBook) {
        let url = generateEndpointUrl(endpoint: "book")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let newBookData: NewBookData = book.toNewBookData()
            request.httpBody = try JSONEncoder().encode(newBookData)

            URLSession.shared.getAllTasks { (openTasks: [URLSessionTask]) in
               NSLog("open tasks: \(openTasks)")
            }

            // TODO: Show alert with success or error message
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (responseData: Data?, response: URLResponse?, error: Error?) in
                print("\(String(describing: response))")
            })
            task.resume()
        } catch let err {
            print(err)
        }
    }
}
