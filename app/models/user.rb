class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  has_many :groups_users
  has_many :groups, through: :groups_users
end
