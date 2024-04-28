//
//  CountryCell.swift
//  lecture22
//
//  Created by MacBook Pro on 26.04.24.
//

import UIKit

class CountryCell: UITableViewCell {
    
    static let identifier = "CountryCell"
    private var country: Country?
    
    private let countryFlag: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let contryName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private let actoinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "greaterthan")
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Functions
    
    private func setupUI() {
        addSubview(countryFlag)
        addSubview(contryName)
        addSubview(actoinImage)
        
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        contryName.translatesAutoresizingMaskIntoConstraints = false
        actoinImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryFlag.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            countryFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            countryFlag.heightAnchor.constraint(equalToConstant: 60),
            countryFlag.widthAnchor.constraint(equalToConstant: 100),
            
            contryName.centerYAnchor.constraint(equalTo: centerYAnchor),
            contryName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            contryName.widthAnchor.constraint(equalToConstant: 200),
            
            actoinImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            actoinImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            actoinImage.heightAnchor.constraint(equalToConstant: 20),
            actoinImage.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func updateCell(with item: CountryTableViewCellViewModel) {
        contryName.text = item.countryName
        guard let url = item.flagUrl   else {
            return
        }
        countryFlag.fetchImage(url: url)
    }
}
