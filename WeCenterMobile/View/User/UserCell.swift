//
//  UserCell.swift
//  WeCenterMobile
//
//  Created by Darren Liu on 15/4/10.
//  Copyright (c) 2015年 Beijing Information Science and Technology University. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userAvatarView: MSRRoundedImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userSignatureLabel: UILabel!
    @IBOutlet weak var userButtonA: UIButton!
    @IBOutlet weak var userButtonB: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userFollowImageView: UIImageView!
    @IBOutlet weak var userFollowLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let theme = SettingsManager.defaultManager.currentTheme
        msr_scrollView?.delaysContentTouches = false
        containerView.msr_borderColor = theme.borderColorA
        containerView.backgroundColor = theme.backgroundColorB
        userNameLabel.textColor = theme.titleTextColor
        userSignatureLabel.textColor = theme.subtitleTextColor
        userButtonB.msr_setBackgroundImageWithColor(theme.highlightColor, forState: .Highlighted)
    }

    func update(user user: User) {
        userAvatarView.wc_updateWithUser(user)
        print(user)
        if let following = user.following {
            userFollowImageView.image = following ? UIImage(named: "User-Unfollow") : UIImage(named: "User-Follow")
            userFollowLabel.text = following ? "已关注" : "加关注"
        } else {
            userFollowLabel.text = "加关注"
        }
        userNameLabel.text = user.name
        /// @TODO: [Bug][Back-End] \n!!!
        userSignatureLabel.text = user.signature?.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
        userButtonA.msr_userInfo = user
        userButtonB.msr_userInfo = user
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
