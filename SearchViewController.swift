//
//  SearchViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 13/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var multiItems: [AllStuff] = []
    var menItem: [MenStuff] = []
    var womenItem: [WomenStuff] = []
    var shoeItem: [ShoeStuff] = []
    var electronicItem: [ElectronicStuff] = []
    var toyItem: [ToyStuff] = []
    var carItem: [CarStuff] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
       collectionView.showsVerticalScrollIndicator = false
      
        multiItems = [AllStuff.init(image: #imageLiteral(resourceName: "wingtip-dress-shoes-leather-shoes-full-grain")), AllStuff.init(image: #imageLiteral(resourceName: "d44f58bdca44216f83bc6912d779e98a")), AllStuff.init(image: #imageLiteral(resourceName: "98458ede1efcb37abed2a87ee49e9f4d")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-mnz-1670766")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-web-donut-19090")), AllStuff.init(image: #imageLiteral(resourceName: "609fec70536417f778d406d9af289a44_350x350")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-pixabay-164710")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-pixabay-373638")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-torsten-dettlaff-347700")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-simon-migaj-747470")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-dzenina-lukac-815494")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-marinko-krsmanovic-2651794")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-field-engineer-442161")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-jens-mahnke-844923")), AllStuff.init(image: #imageLiteral(resourceName: "pexels-aman-jakhar-1124468"))]
        
        menItem = [MenStuff.init(image: #imageLiteral(resourceName: "pexels-wendy-wei-1656684")), MenStuff.init(image: #imageLiteral(resourceName: "pexels-marlene-leppänen-1183266")), MenStuff.init(image: #imageLiteral(resourceName: "pexels-frans-van-heerden-1566412")), MenStuff.init(image: #imageLiteral(resourceName: "pexels-jeffrey-reed-769733")), MenStuff.init(image: #imageLiteral(resourceName: "pexels-aman-jakhar-1124468")), MenStuff.init(image: #imageLiteral(resourceName: "pexels-simon-migaj-747470")), MenStuff.init(image: #imageLiteral(resourceName: "pexels-luis-quintero-1599980")), MenStuff.init(image: #imageLiteral(resourceName: "78-787853_mens-jackets")), MenStuff.init(image: #imageLiteral(resourceName: "3d5e2b41-e921-4f0f-9f24-06cbf8e1b547_1.9bf2f6b62da4e1427373c4ee9e5c3316"))]
        
        womenItem = [WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth")), WomenStuff.init(image: #imageLiteral(resourceName: "wcloth"))]
        
        shoeItem = [ShoeStuff.init(image: #imageLiteral(resourceName: "pexels-fotografierende-1159670")), ShoeStuff.init(image: #imageLiteral(resourceName: "609fec70536417f778d406d9af289a44_350x350")), ShoeStuff.init(image: #imageLiteral(resourceName: "pexels-web-donut-19090")), ShoeStuff.init(image: #imageLiteral(resourceName: "photo-1542291026-7eec264c27ff")), ShoeStuff.init(image: #imageLiteral(resourceName: "pexels-melvin-buezo-2529148")), ShoeStuff.init(image: #imageLiteral(resourceName: "Phenkang-mens-formal-shoes-genuine-leather-oxford-shoes-for-men-black-2019-dress-shoes-wedding-shoes")), ShoeStuff.init(image: #imageLiteral(resourceName: "pexels-photo-267320")), ShoeStuff.init(image: #imageLiteral(resourceName: "pexels-mnz-1598508")), ShoeStuff.init(image: #imageLiteral(resourceName: "pexels-mnz-1670766"))]
        
        carItem = [CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo")), CarStuff.init(image: #imageLiteral(resourceName: "carlogo"))]
        
        toyItem = [ToyStuff.init(image: #imageLiteral(resourceName: "kidtoy")), ToyStuff.init(image: #imageLiteral(resourceName: "kidtoy")), ToyStuff.init(image: #imageLiteral(resourceName: "kidtoy")), ToyStuff.init(image: #imageLiteral(resourceName: "kidtoy")), ToyStuff.init(image: #imageLiteral(resourceName: "kidtoy"))]
        
        electronicItem = [ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-tiff-ng-3302537")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-cleyder-duque-3637728")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-marinko-krsmanovic-2651794")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-pixabay-373638")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-kinkate-205926")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-pixabay-164710")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-jens-mahnke-844923")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-field-engineer-442161")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-sound-on-3394666")), ElectronicStuff.init(image: #imageLiteral(resourceName: "pexels-dzenina-lukac-815494"))]
    }
    @IBAction func didTaSegmented(_ sender: UISegmentedControl) {
        self.collectionView.reloadData()
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var value = 0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            value = multiItems.count
            break
        case 1:
            value = menItem.count
            break
        case 2:
            value = womenItem.count
            break
        case 3:
            value = shoeItem.count
            break
        case 4:
            value = carItem.count
            break
        case 5:
            value = electronicItem.count
        case 6:
            value = toyItem.count
        default:
            break
        }
        return value
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCollectionViewCell
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell.image.image = multiItems[indexPath.row].image
            break
        case 1:
        cell.image.image = menItem[indexPath.row].image
        break
        case 2:
        cell.image.image = womenItem[indexPath.row].image
        break
        case 3:
        cell.image.image = shoeItem[indexPath.row].image
        break
        case 4:
        cell.image.image = carItem[indexPath.row].image
        break
        case 5:
        cell.image.image = electronicItem[indexPath.row].image
        break
        case 6:
        cell.image.image = toyItem[indexPath.row].image
        break
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let imageInfo = GSImageInfo(image: multiItems[indexPath.row].image!, imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        imageViewer.dismissCompletion = {
            print("dismiss called")
        }
        present(imageViewer, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
          let Coloumns: CGFloat = 2
          let width = collectionView.frame.size.width
          let xInsets: CGFloat = 1
          let cellSpacing: CGFloat = 1
          
          return CGSize(width: (width / Coloumns) - (xInsets + cellSpacing), height: (width / Coloumns) - (xInsets + cellSpacing))
          }
     
}


