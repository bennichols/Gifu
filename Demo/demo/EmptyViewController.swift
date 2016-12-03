import UIKit
import Gifu

class EmptyViewController: UIViewController {
    let imageView = GIFImageView(image: UIImage(named: "mugen.gif"))

    lazy var customImageView: CustomAnimatedView = {
        return CustomAnimatedView(frame: CGRect(x: 0, y: self.view.frame.height - 200, width: 360, height: 200))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(customImageView)
    }

    override func viewDidAppear(animated: Bool) {
        imageView.animate(withGIFNamed: "mugen", loopCount: 1)
        customImageView.animate(withGIFNamed: "earth")
    }
}

class CustomAnimatedView: UIView, GIFAnimatable {
    internal lazy var animator: Animator? = {
        return Animator(withDelegate: self)
    }()

    override internal func displayLayer(layer: CALayer) {
        updateImageIfNeeded()
    }
}
