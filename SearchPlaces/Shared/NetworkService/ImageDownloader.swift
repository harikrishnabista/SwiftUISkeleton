//
//  ImageDownloader.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 4/27/22.
//

import UIKit

final public class ImageDownloadHelper {
    public static let shared = ImageDownloadHelper()
    private var cache:[URL: UIImage] = [:]
    
    @discardableResult
    func downloadImage(url: URL,
                       cachingEnabled: Bool = true,
                       completion: @escaping (UIImage?, Error?)-> Void) -> URLSessionDataTask? {
        if let image = self.cache[url] {
            completion(image, nil)
        } else {
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, respose, error) in
                if let data = data, error == nil {
                    let image = UIImage(data: data)
                    if let image = image {
                        self.cache[url] = image
                    }
                    completion(image, nil)
                } else if error != nil {
                    completion(nil, error)
                }
            }
            task.resume()
            return task
        }
        return nil
    }
}
