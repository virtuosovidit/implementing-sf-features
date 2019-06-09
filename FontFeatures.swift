//
//  FontFeatures.swift
//  LookUp Extension
//
//  Created by Vidit Bhargava on 04/05/19.
//  Copyright © 2019 Squircle Apps. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    enum typeFeature {
        case monospacedNumbers
        case superiors
        case inferiors
        case fractional
        case alt6and9
        case open4
        case verticallyCenteredColon
        case highLegibility
        case oneStorey_a
        case smallCaps_LowerCase
        case smallCaps_UpperCase
    }
    
    func features(_ features: [typeFeature]) -> UIFont {
        
        
        var allFeatures: [[UIFontDescriptor.FeatureKey: Int]] = []
        
        for feature in features {
            
            switch feature {
                
            case .monospacedNumbers:
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]
                )
                
            case .superiors:
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kVerticalPositionType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kSuperiorsSelector])
                
            case .inferiors:
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kVerticalPositionType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kInferiorsSelector])
                
            case .fractional:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kFractionsType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kDiagonalFractionsSelector])
                
            case .alt6and9:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kStylisticAlternativesType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kStylisticAltOneOnSelector])
                
            case .open4:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kStylisticAlternativesType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kStylisticAltTwoOnSelector])
                
            case .verticallyCenteredColon:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kStylisticAlternativesType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kStylisticAltThreeOnSelector])
                
            case .highLegibility:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kStylisticAlternativesType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kStylisticAltSixOnSelector])
                
            case .oneStorey_a:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kStylisticAlternativesType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kStylisticAltSevenOnSelector])
                
                
            case .smallCaps_LowerCase:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kLowerCaseType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kLowerCaseSmallCapsSelector])
                
                
            case .smallCaps_UpperCase:
                
                allFeatures.append(
                    [UIFontDescriptor.FeatureKey.featureIdentifier: kUpperCaseType,
                     UIFontDescriptor.FeatureKey.typeIdentifier: kUpperCaseSmallCapsSelector])
                
                
            }
            
            
        }
        
        let attributes = [UIFontDescriptor.AttributeName.featureSettings: allFeatures]
        let featureDescriptor = fontDescriptor.addingAttributes(attributes)
        
        return UIFont(descriptor: featureDescriptor, size: 0)
        
    }
    
    
    func withTraits(_ traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(.traitBold)
    }
    
    func italic() -> UIFont {
        return withTraits(.traitItalic)
    }
    
    func boldItalic() -> UIFont {
        return withTraits(.traitBold, .traitItalic)
    }
    
    class func with(style: TextStyle, design: UIFontDescriptor.SystemDesign, weight: UIFont.Weight = .regular) -> UIFont {
        
        var fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        
        fontDescriptor = fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : weight]])
        
        let designedFontDescripter = fontDescriptor.withDesign(design)
        let designedFont = UIFont(descriptor: designedFontDescripter ?? fontDescriptor,
                             size: designedFontDescripter?.pointSize ?? 0)
        
        
        return designedFont
    }

}


