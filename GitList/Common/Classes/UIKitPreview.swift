//
//  UIKitPreview.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit
import SwiftUI

struct UIKitControllerPreview<PreviewController: UIViewController>: UIViewControllerRepresentable {
    var controller: PreviewController
    func makeUIViewController(context: Context) -> PreviewController {
        return controller
    }
    func updateUIViewController(_ uiViewController: PreviewController, context: Context) {}
}
