//
//  StringExtensions.swift
//  Harry Potter App
//
//  Created by user240559 on 23/12/23.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, bundle: .main, comment: "")
    }
}
