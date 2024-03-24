module API
  module V1
    module Resources
      class BlogPosts < Grape::API
        resources :blogs do
          helpers do
            def blog
              @blog = BlogPost.first
            end
          end

          desc 'get all blogs'
          get do
            blogs = BlogPost.all
            present blogs, with: Entities::BlogPost
          end
        end
      end
    end
  end
end
