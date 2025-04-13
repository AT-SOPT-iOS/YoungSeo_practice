import UIKit

class WelcomeViewController: UIViewController {
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    var id: String?
    
    private func bindID() {
        if let id = id, !id.isEmpty {
            self.welcomeLabel.text = "\(id)님\n반가워요!"
        } else {
            self.welcomeLabel.text = "???님\n반가워요!"
        }
    }

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "CarrotCharacter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.textColor = UIColor(named: "Black")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .head1
        return label
    }()
    
    private lazy var backTologinButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "Primary_orange")
        button.layer.cornerRadius = 6
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var againloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "Grey200")
        button.layer.cornerRadius = 6
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(named: "Grey400"), for: .normal)
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    private func setLayout() {
        [imageView, welcomeLabel, backTologinButton, againloginButton].forEach {
            self.view.addSubview($0)
        }
    }
}
