class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    # has_many :posts, through: :comments
    # has_many :posts, through: :likes

    has_many :followers
    has_many :followees, :through => :followers
    has_many :inverse_followers, :class_name => "followers", :foreign_key => "followee"
    has_many :inverse_followees, :through => :inverse_followers, :source => :user

    validates :username, :presence => true#, :message => "There needs to be a username"
    validates :username, :uniqueness => true#, :message => "Username needs to be unique"
    validates :password, :presence => true#, :message => "There needs to be a password"
    validates :password_confirmation, :presence => true#, :message => "Password Confirmation needs to match Password field"
    validates :name, :presence => true#, :message => "There needs to be a name"

    has_secure_password
end
