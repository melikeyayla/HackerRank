//
//  OnboardingCollectionViewCell.swift
//  TicketProject
//
//  Created by Melike Yayla on 8.04.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    
    func setup (_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
