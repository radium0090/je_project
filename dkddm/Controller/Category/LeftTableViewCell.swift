//
//  LeftTableViewCell.swift
//  dkddm
//
//  Created by 皮皮 on 2019/03/28.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    lazy var nameLabel = UILabel()
    private lazy var yellowView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        configureUI()
    }
    
    func configureUI () {
        
        nameLabel.frame = CGRect(x: 10, y: 10, width: 60, height: 40)
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = UIColor(130, 130, 130)
        nameLabel.highlightedTextColor = UIColor(56, 77, 152)
        contentView.addSubview(nameLabel)
        
        yellowView.frame = CGRect(x: 0, y: 5, width: 5, height: 45)
        yellowView.backgroundColor = UIColor(253, 212, 49)
        contentView.addSubview(yellowView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.backgroundColor = selected ? UIColor.white : UIColor(white: 0, alpha: 0.1)
        isHighlighted = selected
        nameLabel.isHighlighted = selected
        yellowView.isHidden = !selected
        
    }
    
}
