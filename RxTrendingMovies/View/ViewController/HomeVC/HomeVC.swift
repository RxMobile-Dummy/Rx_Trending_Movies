//
//  HomeVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 07/07/22.
//

import UIKit
import Kingfisher
import Firebase

class HomeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

  ///MARK: - ViewController Outlet
  // treandingMovieCl object of UICollectionView
  @IBOutlet weak var treandingMovieCl: UICollectionView!
  // lblEmptyMovie object of CustomLabel
  @IBOutlet weak var lblEmptyMovie: CustomLabel!

  ///MARK: - ViewController Objects
  /// objHomeView object of HomeView
  var objHomeView = HomeView()
  /// objHomeViewModel object of HomeViewModel
  var objHomeViewModel = HomeViewModel()
  /// isFavListener object of ListenerRegistration
  var  isFavListener : ListenerRegistration!
  ///arrTrendingMovieList Object of List Of MovieListModel
  var arrTrendingMovieList : [MovieListModel] = []

  //MARK: - ViewContorller Life Cycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    treandingMovieCl.delegate = self
    treandingMovieCl.dataSource = self
    ///IntiallyLoad View method
    objHomeView.intiallyLoadView(vc: self)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    /// get FavouriteData From Firebase
    objHomeView.getFavouriteDataFromFirebase(vc: self)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  //MARK: - Collectionview Data Source Method
  /**
   Call this method for number of Items in Section
   */
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrTrendingMovieList.count
  }

  /**
   Call this method for display all movie list design
   */
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCOLLECTIONVIEW_CELL_IDENTIFIER.treandingMoviesClCellIdentifier, for: indexPath as IndexPath) as! treandingMoviesClCell
    cell.setUpTrendingMovieMethod(index: indexPath.row, vc: self, movieModel: arrTrendingMovieList[indexPath.row])
    return cell
  }

  //MARK: - CollectionView Delegate Method
  /**
   Call this method for cell selection item
   */
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let objMovieDetail = Utility.getStoryboard()?.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.movieDetailsVC) as! MovieDetailsVC
    objMovieDetail.dictTrendingMovie = arrTrendingMovieList[indexPath.row]
    tabBarController?.tabBar.isHidden = true
    self.navigationController?.pushViewController(objMovieDetail, animated: true)
  }

  //MARK: - CollectionView Layout Method
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.size.width / 2) , height: (collectionView.frame.size.width / 2))
  }


  //MARK: - Button Action Method
  /**
   Call this action for logout
   */
  @IBAction func btnActionLogout(_ sender: Any) {
    kUSERDEFAULT.removeObject(forKey: kCurrentUser)
    kUSERDEFAULT.synchronize()
    Utility.navigateToLoginVC(window: sceneDelegate.window!, isPush: true)
  }

  /**
   Call this action favourite Method
   */
  @objc func btnActionFavouriteMethod(sender : UIButton)
  {
    objHomeView.saveFavouriteDataIntoFirebase(vc: self, index: sender.tag)
  }
  
}
