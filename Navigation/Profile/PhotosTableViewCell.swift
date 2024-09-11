//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Oksana Anglaeva on 09.09.2024.
//
import UIKit

class PhotosTabelViewCell: UITableViewCell {
    
    private let photoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = . white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private var horizontalImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.sizeToFit()
        view.clipsToBounds = true
        view.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return view
    }()
    
    private var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 8
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.lightGray.cgColor
        return $0
    }(UIStackView())
    
    private var firstImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "18")
        image.backgroundColor = .systemBackground
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    private var secondImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "20")
        image.backgroundColor = .systemBackground
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    private var thirdImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "23")
        image.backgroundColor = .systemBackground
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    private var fourtImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "30")
        image.backgroundColor = .systemBackground
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError("inir(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    private func setupLayout() {
        
        [firstImageView, secondImageView, thirdImageView, fourtImageView].forEach {stackView.addArrangedSubview($0) }
        
        [photoView, titleLabel, horizontalImage, stackView].forEach {contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: photoView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: -12),
            
            horizontalImage.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 12),
            horizontalImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            horizontalImage.trailingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (12 * 3 + 8 * 3)) / 4),
            stackView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: -12)
        ])
    }
}
