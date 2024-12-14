//
//  ImageService.swift
//  WeatherTracker
//
//  Created by Yuriy Pertsev on 14.12.2024.
//

import SwiftUI
import Combine

protocol ImageServiceProtocol {
    func fetchImage(by link: String?) -> AnyPublisher<UIImage, NetworkError>
}

class ImageService: ImageServiceProtocol, ObservableObject {
    var image: UIImage? = nil
    private var cache = NSCache<NSURL, UIImage>()
    private var cancellable: Set<AnyCancellable> = []

    func loadImage(from url: URL) -> Future<UIImage, NetworkError> {
        return Future<UIImage, NetworkError> { [weak self] promise in
            if let self = self {
                if let cachedImage = self.cache.object(forKey: url as NSURL) {
                    promise(.success(cachedImage))
                }
                URLSession.shared.dataTaskPublisher(for: url)
                    .map { UIImage(data: $0.data) }
                    .replaceError(with: nil)
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] image in
                        guard let self = self, let image = image else { return }
                        self.cache.setObject(image, forKey: url as NSURL)
                        return promise(.success(image))
                    }
                    .store(in: &self.cancellable)
            }
        }
    }

    func fetchImage(by link: String?) -> AnyPublisher<UIImage, NetworkError> {
        if let imageLink = link, let url = URL(string: imageLink) {
            return self.loadImage(from: url).eraseToAnyPublisher()
        } else {
           return Fail<UIImage, NetworkError>(error: NetworkError.urlGeneration)
                .eraseToAnyPublisher()
        }
    }
}
