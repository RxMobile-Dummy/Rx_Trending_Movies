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

  ///MARK: - ViewCont
  @IBOutlet weak var treandingMovieCl: UICollectionView!
  
  ///Object of HomeView.
  var objHomeView = HomeView()
  
  var objHomeViewModel = HomeViewModel()

  var  isFavListener : ListenerRegistration!
  
  ///Object of MovieListModel
  var arrTrendingMovieList : [MovieListModel] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    treandingMovieCl.delegate = self
    treandingMovieCl.dataSource = self
    objHomeView.intiallyLoadView(vc: self)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if(arrTrendingMovieList.count > 0) {
      isFavListener =  HomeView.objHomeViewModel.getFavouriteData { favMovieData, error in
        if((favMovieData?.count ?? 0 ) > 0) {
          favMovieData?.forEach({ element in
            let index = self.arrTrendingMovieList.firstIndex(where: {$0.id == element.id})
            if(element.isFavourite == false) {
              self.arrTrendingMovieList[index ?? 0].isFavourite = false
            } else {
              self.arrTrendingMovieList[index ?? 0].isFavourite = true
            }
            self.treandingMovieCl.reloadItems(at: [IndexPath(item: index ?? 0, section: 0)])
          })
        }
      }
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrTrendingMovieList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "treandingMoviesClCellIdentifier", for: indexPath as IndexPath) as! treandingMoviesClCell
    cell.setUpTrendingMovieMethod(index: indexPath.row, vc: self, movieModel: arrTrendingMovieList[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.size.width / 2) , height: (collectionView.frame.size.width / 2))
  }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let objMovieDetail = Utility.getStoryboard()?.instantiateViewController(withIdentifier: kVIEWCONTROLLER_IDENTIFIER.movieDetailsVC) as! MovieDetailsVC
        objMovieDetail.dictTrendingMovie = arrTrendingMovieList[indexPath.row]
        tabBarController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(objMovieDetail, animated: true)
    }
  
  //MARK: - Button Action Method
  @IBAction func btnActionLogout(_ sender: Any) {
    kUSERDEFAULT.removeObject(forKey: "CurrentUser")
    kUSERDEFAULT.synchronize()
    Utility.navigateToLoginVC(window: sceneDelegate.window!, isPush: true)
  }
  
  @objc func btnActionBookMark(sender : UIButton)
  {
    objHomeView.saveBookMarkDataIntoFirebase(vc: self, index: sender.tag)
  }
  
}
