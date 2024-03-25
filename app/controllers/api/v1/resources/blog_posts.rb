module API
  module V1
    module Resources
      class BlogPosts < Grape::API
        resources :blogs do
          desc 'get all blogs'
          get do
            blogs = BlogPost.all
            present blogs, with: Entities::BlogPost
          end

          route_param :blog_id do
            helpers do
              def blog
                @blog ||= BlogPost.find(params[:blog_id])
              end
            end

            desc 'get blog details'
            get do
              present blog, with: Entities::BlogPost
            end
          end
        end

        resource :blog do 
          desc 'create a blog'
          params do
            requires :title, type: String 
            requires :body, type: String 
          end

          post do 
            blog = BlogPost.new(**params, user: User.first)
            
            blog.save
            present blog, with: Entities::BlogPost
          end
        end
      end
    end
  end
end
