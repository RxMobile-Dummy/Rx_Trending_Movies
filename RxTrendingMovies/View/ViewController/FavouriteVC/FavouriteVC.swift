//
//  BookMarkVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 07/07/22.
//

import UIKit
import Firebase

class FavouriteVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

  @IBOutlet weak var favouriteCL: UICollectionView!

  @IBOutlet weak var lblEmpty: UILabel!

  var  favListener : ListenerRegistration!

  var arrFavouriteData : [MovieListModel] = []


  ///Object of Book Mark View Model.
  var objFavView = FavouriteView()

  override func viewDidLoad() {
    super.viewDidLoad()
    objFavView.intiallyLoadView(vc: self)
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrFavouriteData.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favouriteMovieClCellIdentifier", for: indexPath as IndexPath) as! favouriteMovieClCell
    cell.setUpFavouriteMovieMethod(index: indexPath.row, vc: self, movieModel: arrFavouriteData[indexPath.row])
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.size.width / 2) , height: (collectionView.frame.size.width / 2))
  }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objMovieDetail = Utility.getStoryboard()?.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.movieDetailsVC) as! MovieDetailsVC
        objMovieDetail.dictTrendingMovie = arrFavouriteData[indexPath.row]
        tabBarController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(objMovieDetail, animated: true)
    }

  @objc func btnActionFavourite(sender : UIButton)
  {
     objFavView.deleteFavouriteData(vc: self, movieId: arrFavouriteData[sender.tag].id, id: sender.tag)
  }
}
