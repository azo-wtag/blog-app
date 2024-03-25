module API
  class Base < Grape::API
    mount API::V1::Base

    helpers do
      def permitted_params
        declared(params, include_missing: false)
      end
    end
  end
end
