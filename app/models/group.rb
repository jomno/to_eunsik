class Group < ApplicationRecord
  has_many :users, through: :groups_user
end
