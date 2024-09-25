import UIKit
import StorageService


class PostTableViewCell: UITableViewCell {
    
    public let postView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    public let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    public let labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    public let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let labelLike: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    public let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupLayout() {
        [postView, authorLabel, labelDescription, postImage, labelLike, labelView].forEach { contentView.addSubview($0) }
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            postView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            authorLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImage.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImage.widthAnchor.constraint(equalTo: postView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            labelDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: inset),
            labelDescription.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            labelDescription.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            labelLike.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: inset),
            labelLike.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            labelLike.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
            
            labelView.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: inset),
            labelView.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            labelView.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
        ])
    }
    
    public func setupCell(_ post: VKPost) {
        authorLabel.text = post.author
        labelDescription.text = post.description
        labelLike.text = "Like: \(post.like)"
        labelView.text = "Просмотры: \(post.view)"
        postImage.image = UIImage(named: post.image)
      
    }
    
}

