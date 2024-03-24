module API
  module V1
    module Entities
      class BlogPost < Grape::Entity
        expose :id
        expose :title
        expose :body
        expose :user, as: :owner, with: API::V1::Entities::User
      end
    end
  end
end
