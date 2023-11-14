//
//  TableHeader.swift
//  TableViewHeaderFooter
//
//  Created by Jeann Luiz on 04/10/23.
//

import UIKit

class TableFooter: UITableViewHeaderFooterView {
    static let identifier = "footer"
            
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Tesla Copyright"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks for your business"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(subLabel)
        contentView.backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        subLabel.sizeToFit()
        
        label.frame = CGRect(x: 0,
                                y: 0,
                                width: contentView.frame.size.width,
                                height: contentView.frame.size.height/2)
        
        subLabel.frame = CGRect(x: 0,
                            y: contentView.frame.size.height/2,
                            width: contentView.frame.size.width,
                            height: contentView.frame.size.height/2)
        
    }
}
