module API
  class Base < Grape::API
    use Middleware::Authentication
    format :json

    mount API::V1::Base

    helpers do
      def permitted_params
        declared(params, include_missing: false)
      end
    end

  end
end
