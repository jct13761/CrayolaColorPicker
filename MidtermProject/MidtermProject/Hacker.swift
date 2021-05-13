////
////  Hacker.swift
////  MidtermProject
////
////  Created by Jorrin Thacker on 3/10/21.
////
//
// THIS FILE IS NOT BEING USED AND WAS USED FOR TESTING IDEAS
//
//import SwiftUI
//
//struct Hacker: View {
//    
//    @ObservedObject var hackerInfo = GetHackerData()
//    @State var currentColor : Color = Color.white
//    @State var currentName = "White"
//    
//     var ipAdd = getIFAddresses()
//    
//    var body: some View {
//        
//        
//        
//        //        public var id: String
//        //        public var cou: String
//        //        public var state: String
//        //        public var city: String
//        //        public var zip: String
//        //        public var lat: String
//        //        public var long: String
//        //        public var isp: String
//        //        public var org: String
//        //        public var ip: String
//        
//        VStack {
////            List {
////                ForEach(hackerInfo.hackdata) { data in
//////                ForEach(0 ..< ipAdd.count ) { data in
////                    Text("Status = " )
////                }
////            }
//            Text("Hello")
//
//        }
//        
//
//        
//    }
//}
//
//struct Hacker_Previews: PreviewProvider {
//    static var previews: some View {
//        Hacker()
//    }
//}
//
//public class GetHackerData: ObservableObject {
//    @Published var hackdata = [hackerDataLayout]()
//    //    @Published var cou = [hackerDataLayout]()
//    //    @Published var state = [hackerDataLayout]()
//    //    @Published var city = [hackerDataLayout]()
//    //    @Published var zip = [hackerDataLayout]()
////    @Published var lat = [hackerDataLayout]()
////    @Published var long = [hackerDataLayout]()
//    //    @Published var isp = [hackerDataLayout]()
//    //    @Published var org = [hackerDataLayout]()
//    //    @Published var ip = [hackerDataLayout]()
//    
//    var ipAdd = getIFAddresses()
//
//    
//    
//    init() {
//        load()
//    }
//    
//    func load() {
//        let dataUrl = URL(string: "http://ip-api.com/json/" + ipAdd)!
//        let decoder = JSONDecoder()
//        URLSession.shared.dataTask(with: dataUrl) { (data, response, error) in
//            do {
//                if let d = data {
//                    let decodedLists = try decoder.decode([hackerDataLayout].self, from: d)
//                    DispatchQueue.main.async {
//                        self.hackdata = decodedLists
//                        //                        self.name = decodedLists
//                        //                        self.rgb = decodedLists
//                    }
//                } else {
//                    print("No Data")
//                } // if-else
//            } catch {
//                print("Error")
//            } // do-catch
//        }.resume()
//    }
//}
//
//struct hackerDataLayout: Codable, Identifiable {
//    public var id: String
//    public var cou: String
//    public var state: String
//    public var city: String
//    public var zip: String
//    public var lat: String
//    public var long: String
//    public var isp: String
//    public var org: String
//    public var ip: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "status"
//        case cou = "country"
//        case state = "regionName"
//        case city = "city"
//        case zip = "zip"
//        case lat = "lat"
//        case long = "lon"
//        case isp = "isp"
//        case org = "org"
//        case ip = "query"
//    }
//}
//
//
//func getIFAddresses() -> String {
//    var addresses = [String]()
//
//    // Get list of all interfaces on the local machine:
//    var ifaddr : UnsafeMutablePointer<ifaddrs>?
//    guard getifaddrs(&ifaddr) == 0 else { return "" }
//    guard let firstAddr = ifaddr else { return "" }
//
//    // For each interface ...
//    for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
//        let flags = Int32(ptr.pointee.ifa_flags)
//        let addr = ptr.pointee.ifa_addr.pointee
//
//        // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
//        if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
//            if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
//
//                // Convert interface address to a human readable string:
//                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//                if (getnameinfo(ptr.pointee.ifa_addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),
//                                nil, socklen_t(0), NI_NUMERICHOST) == 0) {
//                    let address = String(cString: hostname)
//                    addresses.append(address)
//                }
//            }
//        }
//    }
//
//    freeifaddrs(ifaddr)
//    return addresses[0]
//}
