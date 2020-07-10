//
//  PhotoAssetsViewController.swift
//  PhotoKitSample
//
//  Created by cskim on 2020/07/09.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit
import Photos

class PhotosViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  private let manager = PHImageManager()
  var assets = PHFetchResult<PHAsset>()
  private var requestIDs = [PHImageRequestID]()
  
  private let scale: CGFloat = UIScreen.main.scale
  private let spacing: CGFloat = 4
  private let itemsInRow: CGFloat = 3
  private var imageWidth: CGFloat {
    let width = UIScreen.main.bounds.width - (self.spacing * (self.itemsInRow - 1))
    return width / self.itemsInRow
  }
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configLayout()
  }
  
  private func configLayout() {
    let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.minimumLineSpacing = self.spacing
    layout?.minimumInteritemSpacing = self.spacing
    layout?.itemSize = CGSize(width: self.imageWidth, height: self.imageWidth)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.requestIDs.forEach { self.manager.cancelImageRequest($0) }
  }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.assets.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell
    
    let asset = self.assets.object(at: indexPath.item)
    let size = CGSize(width: self.imageWidth * self.scale, height: self.imageWidth * self.scale)

    let requestID = manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: nil) { [weak self] (image, _) in
      item?.imageView.image = image
      
      if let index = self?.requestIDs.firstIndex(of: Int32(indexPath.item)) {
        self?.requestIDs.remove(at: index)
      }
    }
    self.requestIDs.append(requestID)
    
    return item ?? UICollectionViewCell()
  }
  
}
