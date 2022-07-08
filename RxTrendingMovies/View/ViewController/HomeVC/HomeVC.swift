//
//  HomeVC.swift
//  RxManagement
//
//  Created by Devangi Prajapati on 07/07/22.
//

import UIKit

class HomeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var treandingMovieCl: UICollectionView!

  var objHomeView = HomeView()

  override func viewDidLoad() {
    super.viewDidLoad()
    objHomeView.intiallyLoadView(vc: self)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }


  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "treandingMoviesClCellIdentifier", for: indexPath as IndexPath) as! treandingMoviesClCell
    cell.setUpTrendingMovieMethod(index: indexPath.row, vc: self)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: (collectionView.frame.size.width / 2) , height: (collectionView.frame.size.width / 2))
  }

}
