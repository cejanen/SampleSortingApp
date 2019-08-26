//
//  ViewController.swift
//  SortingSampleApp
//
//  Created by Tomas Cejka on 8/26/19.
//  Copyright © 2019 STRV. All rights reserved.
//

import UIKit

// MARK: - App view controller
final class ViewController: UIViewController {

    private let messageCellIdentifier = "MessageTableViewCell"

    @IBOutlet private weak var messagesTableView: UITableView! {
        didSet {
            messagesTableView.register(UITableViewCell.self, forCellReuseIdentifier: messageCellIdentifier)
        }
    }
    let messages = Message.randomMessages()
    var sortedMessages: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        printTimeElapsedWhenRunningCode(title: "Sorting...") { [weak self] in
            self?.sortMessages()
        }
    }
}

// MARK: UITableView datasource, delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedMessages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = sortedMessages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier)!
        cell.textLabel?.text = "\(message.date) \(message.user.name)"
        cell.detailTextLabel?.text = message.message

        return cell
    }
}

// MARK: Banchmark helper methods
private extension ViewController {
    func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for \(title): \(timeElapsed) s.")
    }

    func timeElapsedInSecondsWhenRunningCode(operation: ()->()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        return Double(timeElapsed)
    }
}

// MARK: Sorting implementation
private extension ViewController {
    func sortMessages() {
        // TODO: implement here your solution

        // sorted by newest, compare to swift implementation
        sortedMessages = messages.sorted { $0.date > $1.date}
    }
}
