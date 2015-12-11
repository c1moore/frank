//
//  ArticleCell.swift
//  frank
//
//  Created by Cory Armstrong on 12/11/15.
//  Copyright © 2015 frank. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var articleBlob: UILabel!
    
    let cellHeight: CGFloat = 500;
    let imageTitleMargin: CGFloat = 15;
    let imageBlobMargin: CGFloat = 15;
    let imageSideMargin: CGFloat = 25;

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     * Initialize the cell with the specified fields and positions all elements appropriately.
     *
     * Parameter title: Title of the article.  This text will appear at the top of the cell in large bold text.
     * Parameter image: Featured image for the article.  If the image is too large, it will be resized.
     * Parameter blob: Short description of the article.  This text will appear at the very bottom of the cell.
     */
    func configure(title: String, image: UIImage, blob: String) {
        // Set number of lines for UILabels.
        articleTitle.numberOfLines = 0;
        articleBlob.numberOfLines = 3;
        
        // Add text to labels.
        articleTitle.text = title;
        articleBlob.text = blob;
        
        // Set the appropriate sizes for each element.
        let maxImageWidth = self.frame.width - (2 * imageSideMargin);
        let maxImageHeight = cellHeight - articleTitle.frame.height - articleBlob.frame.height - imageTitleMargin - imageBlobMargin;
        
        var imageSizeRatio: CGFloat = 1;
        if(image.size.width > maxImageWidth) {
            imageSizeRatio = image.size.width / maxImageWidth;
            
            let heightRatio = image.size.height / maxImageHeight;
            imageSizeRatio = (imageSizeRatio < heightRatio) ? imageSizeRatio : heightRatio;
        } else if(image.size.height > maxImageHeight) {
            imageSizeRatio = image.size.height / maxImageHeight;
        }
        
        // Add image to image view.
        featuredImage.image = imageWithImage(image, scaledToSize: CGSize(width: image.size.width * imageSizeRatio, height: image.size.height * imageSizeRatio));
        
        // Position the image view and blob text.
        let halfImageSize = featuredImage.frame.height / 2;
        
        featuredImage.center.x = self.center.x;
        featuredImage.center.y = halfImageSize + articleTitle.frame.height + imageTitleMargin;
        
        articleBlob.center.x = self.center.x;
        articleBlob.center.y = (articleBlob.frame.height / 2) + featuredImage.center.y + halfImageSize;
    }
    
    /**
     * Returns the suggested height for this cell based on the size of all elements in the cell and any spacing between elements.
     *
     * Returns: Suggested height for this cell.
     */
    func getSuggestedHeight() -> CGFloat {
        return articleTitle.frame.height + featuredImage.frame.height + articleBlob.frame.height + imageTitleMargin + imageBlobMargin;
    }
    
    /**
     * Scales an image to the specified size using the current device's pixel scaling factor.  The code for this function was contributed by Paul Lynch on [StackOverflow](http://stackoverflow.com/questions/2658738).
     *
     * Parameter image: Image to scale to the new size.
     * Parameter scaledToSize: The new size to which the image should be scaled.
     *
     * Returns: `image` resized to `scaledToSize`
     */
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height));
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        
        return newImage
    }

}
