import Foundation
import UIKit

protocol BaseView: class {
    func startProgress()
    func stopProgress()
    
    func showMessage(title: String?, body: String?)
    func handleError(_ title: String?, _ message: String?, _ actionTitle: String?, _ action: @escaping (() -> Void))
    
    func openUrl(_ url: URL)
}

class BaseViewController: UIViewController, BaseView {
    
    func startProgress() {
        startActivityIndicator()
    }
    
    func stopProgress() {
        stopActivityIndicator()
    }
    
    func showMessage(title: String?, body: String?) {
        showAlert(title: title, message: body, cancel: "OK", actions: nil, cancelHandler: nil)
    }
    
    func openUrl(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func showAlert(title: String?, message: String?, cancel: String? = "OK", actions: [UIAlertAction]?, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelBTN = UIAlertAction(title: cancel, style: .cancel, handler: cancelHandler)
        
        alertController.addAction(cancelBTN)
        
        if let actions = actions {
            for action in actions {
                alertController.addAction(action)
            }
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func handleError(_ title: String?, _ message: String?, _ actionTitle: String?, _ errorAction: @escaping (() -> Void)) {
        let action = UIAlertAction(title: actionTitle, style: .default) { (_) in errorAction() }
        showAlert(title: title, message: message, actions: [action], cancelHandler: nil)
    }
    
    
}

extension UIViewController {
    
    var activityIndicatorTag: Int { return 999999 }
    
    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = .large,
        location: CGPoint? = nil) {

        let loc = location ?? self.view.center
        DispatchQueue.main.async(execute: {
            let activityIndicator = UIActivityIndicatorView(style: style)
            
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true

            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        })
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async(execute: {
            guard let activityIndicator = self.view.subviews.filter(
                    { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView else { return }
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        })
    }
}
