class AddAuthorFkToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :blog_posts, :author, foreign_key: true
  end
end
