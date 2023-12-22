//
//  Color.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//

import UIKit

enum Color: Int64 {
    case red    = 1
    case yellow = 2
    case green  = 3
    case blue   = 4
    
    var lightColor: UIColor {
        switch self {
        case .red: return UIColor(hexString: "#FBDCDA")
        case .yellow: return UIColor(hexString: "#FDFCD8")
        case .green: return UIColor(hexString: "#C2FCFF")
        case .blue: return UIColor(hexString: "#ADECFF")
        }
    }
    
    var darkColor: UIColor {
        switch self {
        case .red: return UIColor(hexString: "#F07167")
        case .yellow: return UIColor(hexString: "#FFB703")
        case .green: return UIColor(hexString: "#00AFB9")
        case .blue: return UIColor(hexString: "#0081A7")
        }
    }
}
