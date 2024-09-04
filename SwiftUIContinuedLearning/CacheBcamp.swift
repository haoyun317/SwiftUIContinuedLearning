//
//  CacheBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/4.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager() //singleton
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 10
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to Cache"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from Cache"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "SteveJobs"
    let manager = CacheManager.instance
     
    init() {
        getImageFromAssestsFolder()
    }
    func getImageFromAssestsFolder() {
         startingImage = UIImage(named: imageName)
    }
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got image from Cache"
        } else {
            infoMessage = "Image not found in Cache"
        }
    }
}

struct CacheBcamp: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                Text(vm.infoMessage)
                    .font(.headline)
                    .foregroundStyle(.purple)
                
                HStack {
                    Button(action: {
                        vm.saveToCache()
                    }, label: {
                        Text("Save to Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        vm.removeFromCache()
                    }, label: {
                        Text("Delete from Cache")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                Button(action: {
                    vm.getFromCache()
                }, label: {
                    Text("Get from Cache")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                })
                
                if let image = vm.cachedImage {
                    Image(uiImage: image )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Spacer()
                
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

#Preview {
    CacheBcamp()
}
