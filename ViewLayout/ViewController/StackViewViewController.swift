//
//  StackViewViewController.swift
//  ViewLayout
//
//  Created by xxxpangbo on 2019/4/30.
//  Copyright © 2019 xxxpangbo. All rights reserved.
//

import UIKit

class StackViewViewController: UIViewController {
    
    let topStackView: UIStackView = {
        let sv = UIStackView.init()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = NSLayoutConstraint.Axis.horizontal
        sv.distribution = UIStackView.Distribution.equalCentering
        sv.alignment = UIStackView.Alignment.center
        
        return sv
    }()
    
    let mapsImageView: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "Maps"))
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.red.cgColor
        return iv
    }()
    let photosImageView: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "Photos"))
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.red.cgColor
        return iv
    }()
    
    let weatherImageView: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "Weather"))
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.red.cgColor
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
        setupTopStackView()
        
        setupOperationPanel()
    }
    
    func setupTopStackView() {
        view.addSubview(topStackView)
        topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        topStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        let bgView = UIView.init()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.borderWidth = 0.5
        bgView.layer.borderColor = UIColor.black.cgColor
        topStackView.addSubview(bgView)
        topStackView.bringSubviewToFront(bgView)
        bgView.topAnchor.constraint(equalTo: topStackView.topAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: topStackView.bottomAnchor).isActive = true
        
        topStackView.addArrangedSubview(mapsImageView)
        topStackView.addArrangedSubview(photosImageView)
        topStackView.addArrangedSubview(weatherImageView)
    }
    
    func setupOperationPanel() {
        // spacing
        let spacingLabel = UILabel.init()
        spacingLabel.text = "Spacing"
        spacingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let spacingSilder = UISlider.init()
        spacingSilder.translatesAutoresizingMaskIntoConstraints = false
        spacingSilder.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        let spacingStackView = UIStackView.init()
        spacingStackView.axis = .horizontal
        spacingStackView.distribution = .fill
        spacingStackView.alignment = .center
        spacingStackView.spacing = 10
        spacingStackView.addArrangedSubview(spacingLabel)
        spacingStackView.addArrangedSubview(spacingSilder)
        
        // axis
        let hButton = UIButton.init()
        hButton.setTitle("Horizontal", for: .normal)
        hButton.setTitleColor(UIColor.blue, for: .normal)
        hButton.tag = 0
        hButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        hButton.translatesAutoresizingMaskIntoConstraints = false
        
        let vButton = UIButton.init()
        vButton.setTitle("Vertical", for: .normal)
        vButton.setTitleColor(UIColor.blue, for: .normal)
        vButton.tag = 1
        vButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        vButton.translatesAutoresizingMaskIntoConstraints = false
        
        let axisStackView = UIStackView.init()
        axisStackView.axis = .horizontal
        axisStackView.distribution = .fillEqually
        axisStackView.alignment = .fill
        axisStackView.spacing = 10
        axisStackView.addArrangedSubview(hButton)
        axisStackView.addArrangedSubview(vButton)
        
        // distribution
        let distributionLabel = UILabel.init()
        distributionLabel.text = "distribution"
        distributionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let fillButton = UIButton.init()
        fillButton.setTitle("fill", for: .normal)
        fillButton.setTitleColor(UIColor.blue, for: .normal)
        fillButton.tag = 2
        fillButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        fillButton.translatesAutoresizingMaskIntoConstraints = false
        
        let fillEquallyButton = UIButton.init()
        fillEquallyButton.setTitle("fillEqually", for: .normal)
        fillEquallyButton.setTitleColor(UIColor.blue, for: .normal)
        fillEquallyButton.tag = 3
        fillEquallyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        fillEquallyButton.translatesAutoresizingMaskIntoConstraints = false
        
        let fillProportionallyButton = UIButton.init()
        fillProportionallyButton.setTitle("fillProportionally", for: .normal)
        fillProportionallyButton.setTitleColor(UIColor.blue, for: .normal)
        fillProportionallyButton.tag = 4
        fillProportionallyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        fillProportionallyButton.translatesAutoresizingMaskIntoConstraints = false
        
        let equalSpacingButton = UIButton.init()
        equalSpacingButton.setTitle("equalSpacing", for: .normal)
        equalSpacingButton.setTitleColor(UIColor.blue, for: .normal)
        equalSpacingButton.tag = 5
        equalSpacingButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        equalSpacingButton.translatesAutoresizingMaskIntoConstraints = false
        
        let equalCenteringButton = UIButton.init()
        equalCenteringButton.setTitle("equalCentering", for: .normal)
        equalCenteringButton.setTitleColor(UIColor.blue, for: .normal)
        equalCenteringButton.tag = 6
        equalCenteringButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        equalCenteringButton.translatesAutoresizingMaskIntoConstraints = false
        
        let distributionStackView = UIStackView.init()
        distributionStackView.axis = .vertical
        distributionStackView.distribution = .fill
        distributionStackView.alignment = .leading
        distributionStackView.addArrangedSubview(distributionLabel)
        distributionStackView.addArrangedSubview(fillButton)
        distributionStackView.addArrangedSubview(fillEquallyButton)
        distributionStackView.addArrangedSubview(fillProportionallyButton)
        distributionStackView.addArrangedSubview(equalSpacingButton)
        distributionStackView.addArrangedSubview(equalCenteringButton)
        
        // alignment
        let alignmentLabel = UILabel.init()
        alignmentLabel.text = "alignment"
        alignmentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let fillAButton = UIButton.init()
        fillAButton.setTitle("fill", for: .normal)
        fillAButton.setTitleColor(UIColor.blue, for: .normal)
        fillAButton.tag = 8
        fillAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        fillAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingAButton = UIButton.init()
        leadingAButton.setTitle("leading", for: .normal)
        leadingAButton.setTitleColor(UIColor.blue, for: .normal)
        leadingAButton.tag = 9
        leadingAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        leadingAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let topAButton = UIButton.init()
        topAButton.setTitle("top", for: .normal)
        topAButton.setTitleColor(UIColor.blue, for: .normal)
        topAButton.tag = 10
        topAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        topAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let centerAButton = UIButton.init()
        centerAButton.setTitle("center", for: .normal)
        centerAButton.setTitleColor(UIColor.blue, for: .normal)
        centerAButton.tag = 11
        centerAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        centerAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingAButton = UIButton.init()
        trailingAButton.setTitle("trailing", for: .normal)
        trailingAButton.setTitleColor(UIColor.blue, for: .normal)
        trailingAButton.tag = 12
        trailingAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        trailingAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomAButton = UIButton.init()
        bottomAButton.setTitle("bottom", for: .normal)
        bottomAButton.setTitleColor(UIColor.blue, for: .normal)
        bottomAButton.tag = 13
        bottomAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        bottomAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let firstBaselineAButton = UIButton.init()
        firstBaselineAButton.setTitle("firstBaseline(horizontal only)", for: .normal)
        firstBaselineAButton.setTitleColor(UIColor.blue, for: .normal)
        firstBaselineAButton.tag = 14
        firstBaselineAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        firstBaselineAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let lastBaselineAButton = UIButton.init()
        lastBaselineAButton.setTitle("lastBaseline(horizontal only)", for: .normal)
        lastBaselineAButton.setTitleColor(UIColor.blue, for: .normal)
        lastBaselineAButton.tag = 15
        lastBaselineAButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        lastBaselineAButton.translatesAutoresizingMaskIntoConstraints = false
        
        let alignmentStackView = UIStackView.init()
        alignmentStackView.axis = .vertical
        alignmentStackView.distribution = .fill
        alignmentStackView.alignment = .trailing
        alignmentStackView.addArrangedSubview(alignmentLabel)
        alignmentStackView.addArrangedSubview(fillAButton)
        alignmentStackView.addArrangedSubview(leadingAButton)
        alignmentStackView.addArrangedSubview(topAButton)
        alignmentStackView.addArrangedSubview(centerAButton)
        alignmentStackView.addArrangedSubview(trailingAButton)
        alignmentStackView.addArrangedSubview(bottomAButton)
        alignmentStackView.addArrangedSubview(firstBaselineAButton)
        alignmentStackView.addArrangedSubview(lastBaselineAButton)
        
        
        // spacing and axis stackView
        let spacingAndAxisStackView = UIStackView.init()
        spacingAndAxisStackView.axis = .vertical
        spacingAndAxisStackView.distribution = .fill
        spacingAndAxisStackView.alignment = .fill
        spacingAndAxisStackView.spacing = 20
        spacingAndAxisStackView.translatesAutoresizingMaskIntoConstraints = false
        spacingAndAxisStackView.addArrangedSubview(spacingStackView)
        spacingAndAxisStackView.addArrangedSubview(axisStackView)
        
        // distribution and alignment stackView
        let distributionAndAlignmentStackView = UIStackView.init()
        distributionAndAlignmentStackView.axis = .horizontal
        distributionAndAlignmentStackView.distribution = .fillEqually
        distributionAndAlignmentStackView.alignment = .top
        distributionAndAlignmentStackView.translatesAutoresizingMaskIntoConstraints = false
        distributionAndAlignmentStackView.addArrangedSubview(distributionStackView)
        distributionAndAlignmentStackView.addArrangedSubview(alignmentStackView)
        
        // operationStackView
        let operationStackView = UIStackView.init()
        operationStackView.axis = .vertical
        operationStackView.distribution = .fill
        operationStackView.alignment = .fill
        operationStackView.spacing = 20
        
        view.addSubview(operationStackView)
        operationStackView.translatesAutoresizingMaskIntoConstraints = false
        operationStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 30).isActive = true
        operationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        operationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        operationStackView.addArrangedSubview(spacingAndAxisStackView)
        operationStackView.addArrangedSubview(distributionAndAlignmentStackView)
        
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let value = CGFloat(sender.value) * 1000
        topStackView.spacing = value
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.axis = .horizontal
            }
        case 1:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.axis = .vertical
            }
        case 2:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.distribution = .fill
            }
        case 3:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.distribution = .fillEqually
            }
        case 4:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.distribution = .fillProportionally
            }
        case 5:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.distribution = .equalSpacing
            }
        case 6:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.distribution = .equalCentering
            }
        case 8:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .fill
            }
        case 9:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .leading
            }
        case 10:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .top
            }
        case 11:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .center
            }
        case 12:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .trailing
            }
        case 13:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .bottom
            }
        case 14:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .firstBaseline
            }
        case 15:
            UIView.animate(withDuration: 0.6) {
                self.topStackView.alignment = .lastBaseline
            }
        default:
            return
        }
    }

}
