import UIKit

public class UISlideLabel: UIView {
    public private(set) var text = "Hello, World!"

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
