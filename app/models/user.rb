class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # ユーザーとフォロー"する"人の結び付け(follower_idにuser_idを納める)
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # ユーザーとフォロー"される"人の結び付け(followed_idにuser_idを納める)
  has_many :following_user, through: :follower, source: :followed
  # 自分"が"フォローしている人
  has_many :follower_user, through: :followed, source: :follower
  # 自分"を"フォローしている人

  def followed_by?(user)
    followed.find_by(follower_id: user.id).present?
  end

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction,length: { maximum: 50}
end
