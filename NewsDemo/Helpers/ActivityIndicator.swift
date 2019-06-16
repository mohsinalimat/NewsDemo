import Foundation
import UIKit


/// add Activity Indicator View on navigationItem titleView
class ActivityIndicator {
    private init() {}
    
    static let shared = ActivityIndicator()
    
    private let activityLabel = UILabel(frame: CGRect(x: 24, y: 0, width: 0, height: 0))
    private let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private let activityView = UIView()
    
    func animateActivity(title: String, navigationItem: UINavigationItem) {
        guard navigationItem.titleView == nil else { return }
        
        activityIndicator.style = .white
        activityLabel.text = title
        activityLabel.textColor  = Colors.brandwhite
        activityLabel.font = FontManager.APPRegular.fontWith(size: 18)

        activityLabel.sizeToFit()
        
        let xPoint = navigationItem.accessibilityFrame.midX
        let yPoint = navigationItem.accessibilityFrame.midY
        let widthForActivityView = activityLabel.frame.width + activityIndicator.frame.width
        activityView.frame = CGRect(x: xPoint, y: yPoint, width: widthForActivityView, height: 30)
        
        activityLabel.center.y = activityView.center.y
        activityIndicator.center.y = activityView.center.y
        
        activityView.addSubview(activityIndicator)
        activityView.addSubview(activityLabel)
        
        navigationItem.titleView = activityView
        activityIndicator.startAnimating()
    }
    
    
    func stopAnimating(navigationItem: UINavigationItem) {
        activityIndicator.stopAnimating()
        navigationItem.titleView = nil
    }
}


