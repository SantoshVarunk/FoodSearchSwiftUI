//
//  Image+Extension.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import Foundation
import SwiftUI

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}