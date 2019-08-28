//
//  WebBrowserViewController.swift
//  DataStructures
//
//  Created by user on 8/27/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

enum MovieTitles: String {
    case episode1 = "Episode 1"
    case episode2 = "Episode 2"
    case episode3 = "Episode 3"
    case episode4 = "Episode 4"
    case episode5 = "Episode 5"
    case episode6 = "Episode 6"
    case episode7 = "Episode 7"
    case episode8 = "Episode 8"
}

enum MovieImages: String {
    case episode1 = "episode-1"
    case episode2 = "episode-2"
    case episode3 = "episode-3"
    case episode4 = "episode-4"
    case episode5 = "episode-5"
    case episode6 = "episode-6"
    case episode7 = "episode-7"
    case episode8 = "episode-8"
}

enum NavigationState {
    case first
    case last
    case next
    case previous
}

enum ButtonUIState {
    case firstMovie
    case lastMovie
    case middleMovie
}

class MovieBrowser: UIViewController {

    @IBOutlet private weak var mainImage: UIImageView!
    private var linkedList = LinkedList()
    private var currentNode: Node?
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var title_Label: UILabel!
    
    private var btnUIState: ButtonUIState {
        didSet {
            switch btnUIState {
            case .firstMovie:
                previousButton.setTitleColor(.clear, for: .normal)
                previousButton.backgroundColor = .clear
                nextButton.setTitleColor(.white, for: .normal)
                nextButton.backgroundColor = .lightGray
            case .middleMovie:
                nextButton.setTitleColor(.white, for: .normal)
                nextButton.backgroundColor = .lightGray
                previousButton.setTitleColor(.white, for: .normal)
                previousButton.backgroundColor = .lightGray

            case .lastMovie:
                nextButton.setTitleColor(.clear, for: .normal)
                nextButton.backgroundColor = .clear
                previousButton.backgroundColor = .lightGray
                previousButton.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    private var navigationState: NavigationState {
        didSet {
            switch navigationState {
            case .first:
                mainImage.image = linkedList.first?.value.image
                title_Label.text = linkedList.first?.value.title
                currentNode = linkedList.first
                btnUIState = .firstMovie
            case .last:
                mainImage.image = linkedList.last?.value.image
                title_Label.text = linkedList.last?.value.title
                currentNode = linkedList.last
                btnUIState = .lastMovie
            case .next:
                if currentNode?.next == nil {
                    return
                }
                mainImage.image = currentNode?.next?.value.image
                title_Label.text = currentNode?.next?.value.title
                currentNode = currentNode?.next
                if currentNode == linkedList.last {
                    btnUIState = .lastMovie
                } else {
                    btnUIState = .middleMovie
                }
            case .previous:
                if currentNode?.previous == nil {
                    return
                }
                mainImage.image = currentNode?.previous?.value.image
                title_Label.text = currentNode?.previous?.value.title
                currentNode = currentNode?.previous
                if currentNode == linkedList.first {
                    btnUIState = .firstMovie
                } else {
                    btnUIState = .middleMovie
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        navigationState = .first
        btnUIState = .firstMovie
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLinkedList()
        navigationState = .first
    }
    
    @IBAction func previousTapped(_ sender: UIButton) {
        navigationState = .previous
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        navigationState = .next
    }
    
    @IBAction func firstTapped(_ sender: UIButton) {
        navigationState = .first
    }
    
    @IBAction func lastTapped(_ sender: Any) {
        navigationState = .last
    }
}

//  ==============================================================================
//  Private Methods
//  ==============================================================================
extension MovieBrowser {
    
    private func setupLinkedList() {
        linkedList = LinkedList()
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode1.rawValue), title: MovieTitles.episode1.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode2.rawValue), title: MovieTitles.episode2.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode3.rawValue), title: MovieTitles.episode3.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode4.rawValue), title: MovieTitles.episode4.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode5.rawValue), title: MovieTitles.episode5.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode6.rawValue), title: MovieTitles.episode6.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode7.rawValue), title: MovieTitles.episode7.rawValue))
        linkedList.append(value: Webpage(image: UIImage(imageLiteralResourceName: MovieImages.episode8.rawValue), title: MovieTitles.episode8.rawValue))
    }
}
