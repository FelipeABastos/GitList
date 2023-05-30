//
//  Extensions.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit

//-----------------------------------------------------------------------
//  MARK: - UIApplication -
//-----------------------------------------------------------------------

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        return controller
    }
}

//-----------------------------------------------------------------------
//  MARK: - UIColor -
//-----------------------------------------------------------------------

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

//-----------------------------------------------------------------------
//  MARK: - UINavigationBar -
//-----------------------------------------------------------------------

extension UINavigationBar {
    
    func fix(largeTitle: Bool = false) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        
        self.tintColor = UIColor.white
        self.standardAppearance = navBarAppearance
        self.scrollEdgeAppearance = navBarAppearance
        self.compactAppearance = navBarAppearance
        self.prefersLargeTitles = largeTitle
    }
}

//-----------------------------------------------------------------------
//  MARK: - UISearchBar -
//-----------------------------------------------------------------------

public extension UISearchBar {
    func setNewcolor(color: UIColor) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.textColor = color
    }
}

//-----------------------------------------------------------------------
//    MARK: - Dictionary -
//-----------------------------------------------------------------------

extension Dictionary {
    func buildQueryString() -> String {
        var urlVars:[String] = []
        for (key, value) in self {
            if value is Array<Any> {
                for v in value as! Array<Any> {
                    if let encodedValue = "\(v)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "[]=" + encodedValue)
                    }
                }
            }else{
                if let val = value as? String {
                    if let encodedValue = val.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "=" + encodedValue)
                    }
                }else{
                    urlVars.append((key as! String) + "=\(value)")
                }
            }
        }
        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}

//-----------------------------------------------------------------------
//  MARK: - URLResponse -
//-----------------------------------------------------------------------

extension URLResponse {
    
    func getStatusCode() -> Int {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return 0
    }
}
