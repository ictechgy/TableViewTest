//
//  NetworkManager.swift
//  TableViewTest
//
//  Created by JINHONG AN on 2021/08/12.
//

import UIKit

struct NetworkManager {
    func receiveImage(of urlAddress: String, completionHandler: @escaping (UIImage?)->Void) {
        let rangeOfSccessState = 200...299
        guard let url = URL(string: urlAddress) else {
            completionHandler(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse, rangeOfSccessState.contains(response.statusCode), let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completionHandler(image)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }.resume()
    }
}
