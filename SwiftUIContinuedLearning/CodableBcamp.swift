//
//  CodableBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/18.
//

import SwiftUI

// Codable = Decodable + Encodable

// Model
struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
   // MARK: Codable 已經在幕後處理完以下這些，所以你可以完全不用寫
    /*
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        case isPremium
    }
    
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(isPremium, forKey: .isPremium)
    }
     */
}
// ViewModel
class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let data = getJSONData() else { return }
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
//        do {
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error decoding: \(error)")
//        }
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data),
//            let dictionary = localData as? [String:Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
        /*
        print("JSON DATA:")
        print(data)
        let jsonString = String(data: data, encoding: .utf8)
        print(jsonString)
         */
    }
    
    func getJSONData() -> Data? {
        
        let customer = CustomerModel(id: "666", name: "Emily", points: 13, isPremium: false)
        let josnData = try? JSONEncoder().encode(customer)
//        let dictionary: [String:Any] = [
//            "id" : "885C067",
//            "name" : "Lawrence",
//            "points" : 99,
//            "isPremium" : true
//        ]
//        
//        let josnData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        return josnData
    }
}

struct CodableBcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                     Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBcamp()
}
