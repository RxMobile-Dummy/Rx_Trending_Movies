//
//  BookMarkVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 07/07/22.
//

import UIKit
import Firebase

class FavouriteVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

  //MARK: - ViewController Outlet
  /// favouriteCL object of UICollectionView
  @IBOutlet weak var favouriteCL: UICollectionView!
  /// lblEmpty object of UILabel
  @IBOutlet weak var lblEmpty: UILabel!

  //MARK: - ViewController Objects
  /// favListener object of ListenerRegistration
  var  favListener : ListenerRegistration!
  /// arrFavouriteData object of List of MovieListModel
  var arrFavouriteData : [MovieListModel] = []
  /// objFavView Object of FavouriteView
  var objFavView = FavouriteView()

  //MARK: - ViewController Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    /// IntiallyLoad View Method
    objFavView.intiallyLoadView(vc: self)
  }

  //MARK: - CollectionView DataSource Method
  /**
   Call this method for number of Item in Section
   */
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrFavouriteData.count
  }

  /**
   Call this method for cell design functionality
   */
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCOLLECTIONVIEW_CELL_IDENTIFIER.favouriteMovieClCellIdentifier, for: indexPath as IndexPath) as! favouriteMovieClCell
    cell.setUpFavouriteMovieMethod(index: indexPath.row, vc: self, movieModel: arrFavouriteData[indexPath.row])
    return cell
  }

  //MARK: - Collection View Layout Method
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.size.width / 2) , height: (collectionView.frame.size.width / 2))
  }

  //MARK: - Collection View Delegate Method
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let objMovieDetail = Utility.getStoryboard()?.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.movieDetailsVC) as! MovieDetailsVC
    objMovieDetail.dictTrendingMovie = arrFavouriteData[indexPath.row]
    tabBarController?.tabBar.isHidden = true
    self.navigationController?.pushViewController(objMovieDetail, animated: true)
  }

  //MARK: - Button Action Method
  /**
   Call this method for favourite button action
   */
  @objc func btnActionFavourite(sender : UIButton)
  {
    objFavView.deleteFavouriteData(vc: self, movieId: arrFavouriteData[sender.tag].id, id: sender.tag)
  }
}
