import UIKit


class PostTableViewCell: UITableViewCell {
    
    private let titleVKLabel = UILabel()
    private let contentLabel = UILabel()
    private let likesLabel = UILabel()
    private let viewsLabel = UILabel()
    private let postImage = UIImageView()
    
    
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        let titleVKLabel: UILabel = {
            let titleVKLabel = UILabel()
            titleVKLabel.font = .systemFont(ofSize: 20, weight: .bold)
            titleVKLabel.textColor = .black
            titleVKLabel.numberOfLines = 2
            titleVKLabel.textAlignment = .center
            return titleVKLabel
        }()
        
        
        var contentLabel: UILabel = {
            let contentLabel = UILabel()
            contentLabel.font = .systemFont(ofSize: 14, weight: .regular)
            contentLabel.textColor = .systemGray
            contentLabel.numberOfLines = 0
            contentLabel.textAlignment = .center
            return contentLabel
        }()
        
        let likesLabel: UILabel = {
            let likesLabel = UILabel()
            likesLabel.font = .systemFont(ofSize: 14, weight: .regular)
            likesLabel.textColor = .black
            return likesLabel
        }()
        
        let viewsLabel: UILabel = {
            let viewsLabel = UILabel()
            viewsLabel.font = .systemFont(ofSize: 14, weight: .regular)
            viewsLabel.textColor = .black
            return viewsLabel
        }()
        
        let postImage: UIImageView = {
            let postImage = UIImageView ()
            postImage.contentMode = .scaleAspectFit
            postImage.backgroundColor = .black
            return postImage
        }()
        
        
        
        let stackView = UIStackView(arrangedSubviews: [titleVKLabel, contentLabel, likesLabel, viewsLabel, postImage])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with post: VKPost) {
        //            titleVKLabel.text = post.title
        //            contentLabel.text = post.content
    }
    
}

