//
//  ViewController.swift
//  scrcollView
//
//  Created by jiang on 2018/11/20.
//  Copyright © 2018年 2016110433. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var pagControll: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...5
        {
            let imageView=UIImageView(image: UIImage(named: "\(i)"))
            imageView.frame=CGRect(x: CGFloat (i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled=true
        }
        
        
        scrollView.contentSize=CGSize(width: scrollView.bounds.width*5, height: scrollView.bounds.height)
        pagControll.numberOfPages=5
        pagControll.currentPage=0
        pagControll.isUserInteractionEnabled=true
//        scrollView.minimumZoomScale=0.2
//        scrollView.maximumZoomScale=5
        scrollView.delegate=self
        scrollView.showsHorizontalScrollIndicator=false
    }
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return scrollView.subviews.first
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         pagControll.currentPage=Int(scrollView.contentOffset.x/scrollView.bounds.width)
    }
   

    @IBAction func pageControlAction(_ sender: UIPageControl) {
        let rec=CGRect(x: CGFloat(pagControll.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rec, animated: true)
    }
}

