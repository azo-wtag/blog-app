class BlogPost < ApplicationRecord
  belongs_to :user
  has_one_attached :blog_img

  validates :title, presence: true
  validates :body, presence: true
end
