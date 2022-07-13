//
//  BookMarkView.swift
//  RxTreandingMovies
//
//  Created by Devangi Prajapati on 08/07/22.
//

import UIKit

class BookMarkView: NSObject {

    //MARK: - intiallyLoadView Method
    /**
     Call this method for set intially load view functions.
     - Parameter vc : It is a object of BookMarkVC
     */
    func intiallyLoadView(vc: BookMarkVC)
    {
      /// set BookMarkVCTitle for BookMarkVC Screen
      setBookMarkVCTitle(vc: vc)
    }

    //MARK:- set BookMarkVCTitle Method
    /**
     Call this method for set BookMarkVC title
     - Parameter vc : It is a object of BookMarkVC
     */
    func setBookMarkVCTitle(vc: BookMarkVC)
    {
      vc.title = "Favourite"
    }
}
