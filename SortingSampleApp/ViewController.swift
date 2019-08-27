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

    @IBOutlet private weak var messagesTableView: UITableView!

    let messages = Message.randomMessages()
    var sortedMessages: [Message] = []
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        // sort data
        printTimeElapsedWhenRunningCode(title: "Sorting...") { [weak self] in
            self?.sortMessages()
        }
    }
}

// MARK: Setup methods
private extension ViewController {
    func setup() {
        // set formatter
        dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd/yyyy")
    }
}

// MARK: UITableView datasource, delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedMessages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = sortedMessages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier) as! MessageTableViewCell
        // for simplicity all at once :-D
        cell.set(title: "\(dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(message.date)))) from: \(message.user.name)", message: message.message)
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
}

// MARK: Sorting implementation
private extension ViewController {
    func sortMessages() {
        // TODO: implement here your solution

        // sorted by latest messages, swift sort implementation
        sortedMessages = messages.sorted { $0.date > $1.date}
    }
}
