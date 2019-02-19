//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Bumseok Lee on 20190219.
//  Copyright © 2019  口月本心 Computer Club. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    @IBOutlet var textLabel: NSTextField!

    let quotes = Quote.all

    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuoteIndex = 0
    }

    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
}

extension QuotesViewController {
    // MARK: Storyboard instantiation

    static func freshController() -> QuotesViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("QuotesViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why can't I find QuotesViewController? - Check Main.storyboard")
        }

        return viewController
    }
}

extension QuotesViewController {
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }

    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }

    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }
}
