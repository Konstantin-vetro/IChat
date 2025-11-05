//
//  ListViewController.swift
//  IChat
//
//  Created by Гость on 25.10.2025.
//

import UIKit
import SwiftUI

final class ListViewController: UIViewController {

    // MARK: - Properties
    private let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    private let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")

    enum Section: Int, CaseIterable {
        case waitingChats, activeChats

        func description() -> String {
            switch self {

            case .waitingChats:
                return "Waiting chats"
            case .activeChats:
                return "Active chats"
            }
        }
    }

    private var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?

    // MARK: - Subviews
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: createCompositionaLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseID)
        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseID)
        return collectionView
    }()

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchResultsUpdater = self
        searchController.definesPresentationContext = true
        return searchController
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupView()
        createDataSource()
        reloadData()
    }

    // MARK: - Setup Search Bar
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func setupView() {
        view.addSubview(collectionView)
    }
}

// MARK: - Data Source
extension ListViewController {

    private func configure<T: SelfConfigureCell>(
        cellType: T.Type,
        with model: MChat,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.reuseID, for: indexPath
        ) as? T else { fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: model)
        return cell
    }

    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, chat in
                guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section kind")}
                switch section {
                case .waitingChats:
                    return self.configure(cellType: WaitingChatCell.self, with: chat, for: indexPath)
                case .activeChats:
                    return self.configure(cellType: ActiveChatCell.self, with: chat, for: indexPath)

                }
            }
        )

        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeader.reuseId,
                for: indexPath
            ) as? SectionHeader else { fatalError("Can not create new section header") }
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section kind") }
            sectionHeader.configurateSectionHeader(text: section.description(), font: .laoSangamMN20(), textColor: .gray)
            return sectionHeader
        }
    }

    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - CompositionalLayout
extension ListViewController {
    private func createCompositionaLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("Unknown section kind")}

            switch section {
            case .activeChats:
                return self.createActiveChats()
            case .waitingChats:
                return self.createWaitingChats()
            }
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config

        return layout
    }

    private func createWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous

        let sectionHeader = setupSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }

    private func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)

        let sectionHeader = setupSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }

    private func setupSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionLayoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionLayoutSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return sectionHeader
    }
}

// MARK: - UISearchResultsUpdating
extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        print("Поиск: \(searchText)")
    }
}

// MARK: - SwiftUI Preview
struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabbarController = MainTabbarController()

        func makeUIViewController(context: Context) -> MainTabbarController {
            return tabbarController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
