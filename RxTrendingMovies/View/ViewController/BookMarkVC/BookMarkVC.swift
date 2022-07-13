//
//  BookMarkVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 07/07/22.
//

import UIKit

class BookMarkVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

  @IBOutlet weak var bookMarkCL: UICollectionView!
    
  ///Object of Book Mark View Model.
    var objBookMarkView = BookMarkView()
    
  override func viewDidLoad() {
      super.viewDidLoad()
      objBookMarkView.intiallyLoadView(vc: self)
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookMarkMovieClCellIdentifier", for: indexPath as IndexPath) as! bookMarkMovieClCell
    cell.setUpTrendingMovieMethod(index: indexPath.row, vc: self)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.size.width / 2) , height: (collectionView.frame.size.width / 2))
  }

}
