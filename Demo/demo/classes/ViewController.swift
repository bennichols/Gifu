import UIKit
import Gifu

class ViewController: UIViewController {
    @IBOutlet weak var imageView: GIFImageView!
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) { }

    var currentGIFName: String = "mugen" {
        didSet {
            imageView.animate(withGIFNamed: currentGIFName)
        }
    }

    @IBAction func toggleAnimation(sender: AnyObject) {
        if imageView.isAnimatingGIF {
            imageView.stopAnimatingGIF()
        } else {
            imageView.startAnimatingGIF()
        }
    }

    @IBAction func swapImage(sender: AnyObject) {
        switch currentGIFName {
        case "mugen":
            currentGIFName = "earth"
        default:
            currentGIFName = "mugen"
        }
    }

    override func viewWillDisappear(animated: Bool) {
        imageView.prepareForReuse()
    }

    override func viewDidAppear(animated: Bool) {
        imageView.animate(withGIFNamed: currentGIFName)
    }
}
