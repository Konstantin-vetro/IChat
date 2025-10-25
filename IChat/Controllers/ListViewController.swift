//
//  ListViewController.swift
//  IChat
//
//  Created by Гость on 25.10.2025.
//

import UIKit
import SwiftUI

final class ListViewController: UIViewController {

    // MARK: - Subviews
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }


}

// MARK: - SwiftUI Preview
struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = ListViewController()

        func makeUIViewController(context: Context) -> ListViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
