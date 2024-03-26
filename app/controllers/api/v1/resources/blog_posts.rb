module API
  module V1
    module Resources
      class BlogPosts < Grape::API
        helpers Helpers::PrepareFileData

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
          helpers do 
            def blog_params
              blog_image = permitted_params[:blog_img]
              blog_file = file_data(:blog_img, blog_image)
              permitted_params.merge!(blog_file)
            end
          end

          desc 'create a blog'
          params do
            requires :title, type: String 
            requires :body, type: String 
            requires :blog_img, type: Rack::Multipart::UploadedFile
          end

          post do 
            blog = BlogPost.new(**blog_params, user: User.first)
            
            blog.save
            present blog, with: Entities::BlogPost
          end
        end
      end
    end
  end
end
