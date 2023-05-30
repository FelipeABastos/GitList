//
//  NotificationBanner.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit
import NotificationBannerSwift

final class NotificationTopBanner {
    
    static func showMessage(message: String? = nil,
                            type: BannerStyle) {
        
        let banner = NotificationBanner(title: "",
                                        subtitle: message,
                                        style: type)
        banner.show()
    }
}
