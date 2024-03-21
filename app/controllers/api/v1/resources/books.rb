module API
  module V1
    module Resources
      class Books < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        resource :books do
          desc 'Return all Books'
          get do
            present BlogPost.all, with: Entities::Book
          end
        end
      end
    end
  end
end
