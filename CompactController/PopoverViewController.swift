//
//  PopoverViewController.swift
//  CompactController
//
//  Created by Mikhail Andreev on 13.07.2023.
//

import UIKit

class PopoverViewController: UIViewController
{
	private lazy var segmentedControl = makeSegmentedControl()
	private lazy var closeButton = makeCloseButton()

    override func viewDidLoad()
	{
        super.viewDidLoad()
		view.addSubview(segmentedControl)
		segmentedControl.selectedSegmentIndex = 0
		updatePrefferedSize(height: 280)
		view.addSubview(closeButton)
    }

	override func viewDidLayoutSubviews()
	{
		super.viewDidLayoutSubviews()
		segmentedControl.center.x = view.center.x
		segmentedControl.frame.origin.y = view.layoutMargins.top + 8
		closeButton.center.y = segmentedControl.center.y
		closeButton.frame.origin.x = view.frame.maxX - view.layoutMargins.right - closeButton.frame.width
	}
}

private extension PopoverViewController
{
	func makeSegmentedControl() -> UISegmentedControl
	{
		let firstItem = UIAction(title: "280pt") { [weak self] _ in
			self?.updatePrefferedSize(height: 280)
		}
		let secondItem = UIAction(title: "150pt") { [weak self] _ in
			self?.updatePrefferedSize(height: 150)
		}
		let segmentedControl = UISegmentedControl(items: [firstItem, secondItem])
		return segmentedControl
	}

	func makeCloseButton() -> UIButton
	{
		let action = UIAction() { [weak self] _ in
			self?.dismiss(animated: true)
		}
		let button = UIButton(primaryAction: action)
		button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
		button.tintColor = .systemGray
		button.sizeToFit()
		return button
	}

	func updatePrefferedSize(height: CGFloat)
	{
		preferredContentSize = .init(width: 300, height: height)
	}
}
