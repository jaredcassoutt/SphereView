import UIKit

class SphereView: UIView {
    
    let mainColor: UIColor
    
    init(frame: CGRect, mainColor: UIColor) {
        self.mainColor = mainColor
        super.init(frame: frame)
        let l = CAGradientLayer()
        l.type = .radial
        l.colors = [mainColor.lighter()?.cgColor ?? mainColor.cgColor, mainColor.darker()?.cgColor ?? mainColor.cgColor]
        l.locations = [0,1]
        l.startPoint = CGPoint(x: 0.3, y: 0.3)
        l.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.addSublayer(l)
        l.frame = bounds
        l.cornerRadius = bounds.width / 2.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
