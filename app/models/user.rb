class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password, presence: true, confirmation: true
  has_many :followings
  has_many :followers, through: :followings
  has_many :posts

  scope :following, -> (current_user) { joins(:followings).where('follower_id = ?', current_user) }

  def self.create_user_with_messages(user_name, password, messages)
    u = create(name: user_name, password: password)
    messages.each do |message|
      u.posts.create message: message
    end
    u
  end
end
