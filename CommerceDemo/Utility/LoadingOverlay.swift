//
//  LoadingOverlay.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import UIKit
import Foundation


public class LoadingOverlay{
    
    var overlayView : UIView?
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView) {
        
        self.hideOverlayView()
        
        overlayView = UIView(frame: UIScreen.main.bounds)
        
        if let vwCont = overlayView{
            
            vwCont.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.center = vwCont.center
            vwCont.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            view.addSubview(vwCont)
        }
    }
    
    public func hideOverlayView() {
        
        activityIndicator.stopAnimating()
        overlayView?.removeFromSuperview()
    }
}
