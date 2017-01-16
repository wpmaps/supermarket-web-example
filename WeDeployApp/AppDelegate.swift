//
//  AppDelegate.swift
//  WeDeployApp
//
//  Created by Victor Galán on 05/01/2017.
//  Copyright © 2017 liferay. All rights reserved.
//

import UIKit
import WeDeploy

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	let mainColors = [
		UIColor(8, 223, 133, 1),
		UIColor(0, 164, 255, 1),
		UIColor(149, 82, 239, 1),
		UIColor(255, 64, 64, 1),
		UIColor(255, 11, 110, 1),
		UIColor(255, 183, 0, 1)
	]

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		let selectedColor = UserDefaults.standard.integer(forKey: "selectedColor")

		let currentColor = selectedColor

		UIColor.mainColor = mainColors[currentColor]

		var nextColor = 0
		if selectedColor != mainColors.count - 1 {
			nextColor = currentColor + 1
		}

		UserDefaults.standard.set(nextColor, forKey: "selectedColor")


		return true
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
		WeDeploy.auth().handle(url: url)
		return true
	}

}

