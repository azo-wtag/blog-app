class User < ApplicationRecord
  has_many_attached :avatar
  has_many :blog_posts, dependent: :destroy
end
