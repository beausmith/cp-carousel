//
//  IntroViewController.swift
//  Carousel
//
//  Created by Beau Smith on 2/13/16.
//  Copyright © 2016 Beau Smith. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [CGFloat] =  [-285, -240, -415, -408, -480, -500]
    var xOffsets : [CGFloat] =  [ -30, 75, -66, 10, -200, -15]
    var scales : [CGFloat] =    [   1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [ -10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = introImageView.image!.size
        
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transformImage(image: UIImageView, offset: CGFloat, tx: CGFloat, ty: CGFloat, scale: CGFloat, rotation: CGFloat) {
        let tx = convertValue(offset, r1Min: 0, r1Max: 568,       r2Min:  tx, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568,       r2Min: ty, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568,    r2Min:    scale, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min:  rotation, r2Max: 1)
        
        image.transform = CGAffineTransformMakeTranslation(tx, ty)
        image.transform = CGAffineTransformScale(image.transform, CGFloat(scale), CGFloat(scale))
        image.transform = CGAffineTransformRotate(image.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat(scrollView.contentOffset.y)

        var tiles : [UIImageView] = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]

        for i in 0...5 {
            transformImage(tiles[i], offset: offset, tx: xOffsets[i], ty: yOffsets[i], scale: scales[i], rotation: rotations[i])

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
