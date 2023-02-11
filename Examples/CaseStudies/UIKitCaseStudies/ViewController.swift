import UIKit
import UICelebrateView

class ViewController: UIViewController {

    private let celebrateView = UICelebrateView()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        celebrateView.translatesAutoresizingMaskIntoConstraints = false
        
        celebrateView.cannons = [
            .init(
                position: .init(x: 0, y: view.frame.height / 2),
                shootAngle: 20
            ),
            .init(
                position: .init(x: view.frame.width, y: view.frame.height / 2),
                shootAngle: -20
            )
        ]
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SHOOT", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
        view.addSubview(celebrateView)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            celebrateView.topAnchor.constraint(equalTo: view.topAnchor),
            celebrateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            celebrateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            celebrateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func handleButtonTap() {
        celebrateView.shoot()
    }

}

