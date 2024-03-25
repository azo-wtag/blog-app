module API
  module Middleware
    class Authentication < Grape::Middleware::Base
      # https://github.com/ruby-grape/grape?tab=readme-ov-file#before-after-and-finally

      #call after api execution
      def after
      end

      #called before api execuion
      def before
        Rails.logger.info V1::Base::routes[0]&.settings&.dig(:authentication, :optional)
        auth_optional = V1::Base::routes[0]&.settings&.dig(:authentication, :optional)

        if auth_optional
          Rails.logger.info "Authentication is Optional for this endpoint"
        else
          authenticate!
        end
      end


      private

      def authenticate!
        Rails.logger.info "authentication middleware"
      end
    end
  end
end
