//
//  ViewController.swift
//  CompactController
//
//  Created by Mikhail Andreev on 13.07.2023.
//

import UIKit

class ViewController: UIViewController
{
	private lazy var button = makeButton()

	override func viewDidLoad()
	{
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(button)
	}

	override func viewDidLayoutSubviews()
	{
		super.viewDidLayoutSubviews()
		button.center.x = view.center.x
		button.frame.origin.y = view.layoutMargins.top + 20
	}
}

extension ViewController: UIPopoverPresentationControllerDelegate
{
	func adaptivePresentationStyle(
		for controller: UIPresentationController
	) -> UIModalPresentationStyle
	{
		return .none
	}
}

private extension ViewController
{
	func makeButton() -> UIButton
	{
		let action = UIAction(title: "Present") { [weak self] _ in
			let popoverViewController = PopoverViewController()
			popoverViewController.modalPresentationStyle = .popover
			let popover = popoverViewController.popoverPresentationController
			popover?.delegate = self
			popover?.sourceView = self?.button
			self?.present(popoverViewController, animated: true)
		}
		let button = UIButton(type: .system, primaryAction: action)
		button.sizeToFit()
		return button
	}
}
