//
//  File.swift
//  QuickComponents
//
//  Created by Lucas Desouza on 5/29/20.
//

import Foundation
import SwiftUI

public struct QuickColors {
    static var primary: UIColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case
          .unspecified,
          .light: return #colorLiteral(red: 0.07846928388, green: 0.5040031075, blue: 0.8973124623, alpha: 1)
        case .dark: return #colorLiteral(red: 0.5525570512, green: 0.7790964246, blue: 0.9619663358, alpha: 1)
        @unknown default:
            return #colorLiteral(red: 0.07846928388, green: 0.5040031075, blue: 0.8973124623, alpha: 1)
        }
    }
    static var primaryAccent: UIColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case
          .unspecified,
          .light: return #colorLiteral(red: 0.9522330165, green: 0.946572125, blue: 0.9565842748, alpha: 1)
        case .dark: return #colorLiteral(red: 0.07319676131, green: 0.1023326293, blue: 0.1279197633, alpha: 1)
        @unknown default:
            return #colorLiteral(red: 0.9522330165, green: 0.946572125, blue: 0.9565842748, alpha: 1)
        }
    }
    static var disabled: UIColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case
          .unspecified,
          .light: return #colorLiteral(red: 0.8783541918, green: 0.8784809113, blue: 0.8783264756, alpha: 1)
        case .dark: return #colorLiteral(red: 0.8783541918, green: 0.8784809113, blue: 0.8783264756, alpha: 1)
        @unknown default:
            return #colorLiteral(red: 0.8783541918, green: 0.8784809113, blue: 0.8783264756, alpha: 1)
        }
    }
    static var disabledAccent: UIColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case
          .unspecified,
          .light: return #colorLiteral(red: 0.1137114838, green: 0.1137344316, blue: 0.1137065664, alpha: 1)
        case .dark: return #colorLiteral(red: 0.1137114838, green: 0.1137344316, blue: 0.1137065664, alpha: 1)
        @unknown default:
            return #colorLiteral(red: 0.1137114838, green: 0.1137344316, blue: 0.1137065664, alpha: 1)
        }
    }
    static var secondary: UIColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
           switch traitCollection.userInterfaceStyle {
           case
             .unspecified,
             .light: return #colorLiteral(red: 0.9630364776, green: 0.003629619256, blue: 0.357791841, alpha: 1)
           case .dark: return #colorLiteral(red: 0.9584334493, green: 0.5590918064, blue: 0.6929282546, alpha: 1)
           @unknown default:
               return #colorLiteral(red: 0.9630364776, green: 0.003629619256, blue: 0.357791841, alpha: 1)
           }
       }
    static var secondaryAccent: UIColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
              switch traitCollection.userInterfaceStyle {
              case
                .unspecified,
                .light: return #colorLiteral(red: 0.9502020478, green: 0.9445533752, blue: 0.954544127, alpha: 1)
              case .dark: return #colorLiteral(red: 0.1252025068, green: 0.07195176929, blue: 0.09073419124, alpha: 1)
              @unknown default:
                  return #colorLiteral(red: 0.9502020478, green: 0.9445533752, blue: 0.954544127, alpha: 1)
              }
          }
}

extension Color {
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
}

#if DEBUG
struct QuickColors_Previews: PreviewProvider {
    static var previews: some View {
        Color.offWhite
    }
}
#endif
