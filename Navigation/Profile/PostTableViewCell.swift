import UIKit

class PostTableViewCell: UITableViewCell {
    
   
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let postDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private func setupViews() {
        contentView.addSubview(postImageView)
        contentView.addSubview(postTitleLabel)
        contentView.addSubview(postDescriptionLabel)
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            postImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: 60),
            postImageView.heightAnchor.constraint(equalToConstant: 60),
            
            postTitleLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
            postTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 10),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            postDescriptionLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: 5),
            postDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
}
