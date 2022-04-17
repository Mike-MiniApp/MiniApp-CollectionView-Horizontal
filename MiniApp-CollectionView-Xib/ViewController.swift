//
//  ViewController.swift
//  MiniApp-CollectionView-Xib
//
//  Created by 近藤米功 on 2022/04/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var horizontalCollectionView: UICollectionView!
    var photoArray: [String] = ["coffee","cooking","imac","manran"]
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: .main)
        horizontalCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12 // セルを角丸にする
        cell.layer.shadowOpacity = 0.4 // セルの影の濃さを調整する
        cell.layer.shadowRadius = 12 // セルの影のぼかし量を調整する
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 10, height: 10) // 影の方向
        cell.layer.masksToBounds = false
        cell.backgroundImageView.image = UIImage(named: photoArray[indexPath.row])
        return cell
    }
    // セル同士の間隔を決めるデリゲートメソッド
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    // セルのサイズを決めるデリゲートメソッド
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellWidth = viewWidth - 75
        cellHeight = viewHeight - 300
        cellOffset = viewWidth - cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }

    // 余白の調整
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -navHeight,left: cellOffset / 2,bottom: 0,right: cellOffset / 2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NextVCSegue", sender: nil)
    }


}

