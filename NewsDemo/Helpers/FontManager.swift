


import UIKit
enum FontManager:String {
    case APPRegular
    case APPMedium
    case APPSemiBold
    case APPLight
    
    
   private var fontName:String {
        return  self.englishFontName
    }
   
    private var englishFontName:String {
        switch self {
            case .APPRegular: return "AvenirNext-Regular"
            case .APPMedium: return "Avenir-Medium"
            case .APPLight: return "Avenir-Light"
            case .APPSemiBold: return "AvenirLTStd-Heavy"
        }
    }
    
   public func fontWith(size: CGFloat) -> UIFont {
    if let font = UIFont(name:self.fontName,size:size){
        return font
    }
    return UIFont.systemFont(ofSize:size)
    }
    
}


