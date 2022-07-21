//
//  MovieDetailsVC.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit
import Kingfisher
import SnapKit

class MovieDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  //MARK: - ViewController Outlet
  // tableView object of UITableView
  @IBOutlet weak var tableView: UITableView!

  //MARK: - ViewController Objects
  // parallaxHeaderView object of UIView
  weak var parallaxHeaderView: UIView?
  // dictTrendingMovie object of MovieListModel
  var dictTrendingMovie : MovieListModel!

  //MARK: - ViewController Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupParallaxHeader()
  }

  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  //MARK: -  setUp Parallax Header view Method
  private func setupParallaxHeader() {

    let imageView = UIImageView()
    let url = URL(string: kGET_IMAGE_PATH + (dictTrendingMovie.posterPath ?? ""))
    imageView.kf.setImage(with: url!)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    parallaxHeaderView = imageView

    //setup bur view
    imageView.blurView.setup(style: UIBlurEffect.Style.dark, alpha: 1).enable()
    imageView.blurView.alpha = 0

    tableView.parallaxHeader.view = imageView
    tableView.parallaxHeader.height = 400
    tableView.parallaxHeader.minimumHeight = 120
    tableView.parallaxHeader.mode = .centerFill
    tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
      //update alpha of blur view on top of image view
      parallaxHeader.view.blurView.alpha = 1 - parallaxHeader.progress
    }

    let roundIcon = UIImageView(
      frame: CGRect(x: 0, y: 0, width: 100, height: 100)
    )
    roundIcon.kf.setImage(with: url!)
    roundIcon.layer.borderColor = UIColor.white.cgColor
    roundIcon.layer.borderWidth = 2
    roundIcon.layer.cornerRadius = roundIcon.frame.width / 2
    roundIcon.clipsToBounds = true

    //add round image view to blur content view
    //do not use vibrancyContentView to prevent vibrant effect
    imageView.blurView.blurContentView?.addSubview(roundIcon)
    
    //add constraints using SnpaKit library
    roundIcon.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.height.equalTo(100)
    }
  }


  //MARK: -  TableView Datasource Method
  /**
    Call this method for number of rows in section
   */
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  /**
    Call this method for set up cell functionality
   */
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: movieDetailsCell = tableView.dequeueReusableCell(withIdentifier: kTABLEVIEW_CELL_IDENTIFIER.movieDetailsCellIdentifier, for: indexPath) as! movieDetailsCell
    cell.setUpCell(dictTrendingMovie)
    return cell
  }

   //MARK: - Button Action Method
  /**
    Call this method for back pressed action method
   */
  @IBAction func backPressed(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    self.tabBarController?.tabBar.isHidden = false
    navigationController?.setNavigationBarHidden(false, animated: false)
  }

}
