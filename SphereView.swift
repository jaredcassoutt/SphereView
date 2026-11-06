import UIKit

class SphereView: UIView {
    
    let mainColor: UIColor
    
    init(frame: CGRect, mainColor: UIColor) {
        self.mainColor = mainColor
        super.init(frame: frame)
        let l = CAGradientLayer()
        l.type = .radial
        l.colors = [SphereView.adjust(mainColor, by: 0.3).cgColor, SphereView.adjust(mainColor, by: -0.3).cgColor]
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
    
    /// Returns `color` with `amount` added to each RGB component, clamped to 0...1.
    /// A positive amount lightens the color and a negative amount darkens it.
    /// A color that can't be converted to RGB is returned unchanged.
    private static func adjust(_ color: UIColor, by amount: CGFloat) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        guard color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return color }
        func shift(_ value: CGFloat) -> CGFloat { min(max(value + amount, 0), 1) }
        return UIColor(red: shift(red), green: shift(green), blue: shift(blue), alpha: alpha)
    }
}
    
