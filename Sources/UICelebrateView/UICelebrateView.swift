import UIKit

public struct CelebrateCanon {
    let position: CGPoint
    let shootAngle: CGFloat
    
    public init(position: CGPoint, shootAngle: CGFloat) {
        self.position = position
        self.shootAngle = shootAngle
    }
}

public class UICelebrateView: UIView {
    
    public var cannons: [CelebrateCanon]?
    
    private var emitterLayers: [CAEmitterLayer]?
    
    public func shoot() {
        emitterLayers?.forEach {
            $0.emitterCells?.forEach {
                $0.lifetime = 0
                $0.birthRate = 0
            }

            $0.removeFromSuperlayer()
        }
        
        emitterLayers = cannons?.map {
            createEmitterLayer(
                position: $0.position,
                shootAngle: $0.shootAngle
            )
        }
        
        emitterLayers?.forEach {
            $0.emitterCells?.forEach {
                $0.lifetime = 10
                $0.birthRate = 80
                $0.beginTime = CACurrentMediaTime() + 0.5
            }
            layer.addSublayer($0)
        }
    }
  
    private func createEmitterLayer(position: CGPoint, shootAngle: CGFloat) -> CAEmitterLayer {
        let layer = CAEmitterLayer()
        
        let colors: [UIColor] = [
            .systemRed,
            .systemBlue,
            .systemOrange,
            .systemGreen,
            .systemPink,
            .systemYellow,
            .systemPurple
        ]

        let cells: [CAEmitterCell] = colors.enumerated().compactMap { color in
            let cell = CAEmitterCell()
            cell.scale = 0.8
            cell.name = "\(color.0)"
            cell.emissionRange = .pi / 4
            cell.emissionLongitude = shootAngle * .pi / 180 - .pi / 2
            cell.lifetime = 0
            cell.velocity = 400
            cell.duration = 0.25
            cell.velocityRange = 80
            cell.yAcceleration = 120
            cell.spin = 2
            cell.spinRange = 4
            cell.color = color.1.cgColor
            cell.contents = UIImage(named: "star", in: Bundle.module, with: nil)!.cgImage

            cell.setValue("plane", forKey: "particleType")
            cell.setValue(Double.pi, forKey: "orientationRange")
            cell.setValue(Double.pi / 2, forKey: "orientationLongitude")
            cell.setValue(Double.pi / 2, forKey: "orientationLatitude")
            return cell
        }

        layer.emitterCells = cells
        layer.emitterPosition = position
        layer.emitterSize = CGSize(width: 40, height: 40)
        layer.emitterShape = .sphere
        layer.renderMode = .additive

        let gravityAnimation = CAKeyframeAnimation()
        gravityAnimation.duration = 1
        gravityAnimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        gravityAnimation.values = [0, 800, 2000, 800, 300]

        layer.add(gravityAnimation, forKey: "emitterCells.0.yAcceleration")
        layer.add(gravityAnimation, forKey: "emitterCells.1.yAcceleration")
        layer.add(gravityAnimation, forKey: "emitterCells.2.yAcceleration")
        layer.add(gravityAnimation, forKey: "emitterCells.3.yAcceleration")
        layer.add(gravityAnimation, forKey: "emitterCells.4.yAcceleration")
        layer.add(gravityAnimation, forKey: "emitterCells.5.yAcceleration")
        layer.add(gravityAnimation, forKey: "emitterCells.6.yAcceleration")
        return layer
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
