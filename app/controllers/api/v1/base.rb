module API
  module V1
    class Base < Grape::API
      version %w(v1), using: :path, strict: true
      format :json
      prefix :api

      mount API::V1::Resources::Books
      mount API::V1::Resources::BlogPosts
    end
  end
end
