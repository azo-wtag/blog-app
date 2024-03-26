module API
  module Middleware
    class Authentication < Grape::Middleware::Base
      # https://github.com/ruby-grape/grape?tab=readme-ov-file#before-after-and-finally

      #call after api execution
      def after
      end

      #called before api execuion
      def before
        Rails.logger.info "endpoint --> #{route&.settings}"
        auth_optional = route&.settings&.dig(:authentication, :optional)

        if auth_optional
          Rails.logger.info "Authentication is Optional"
        else
          authenticate!
        end
      end

      private

      def authenticate!
        Rails.logger.info "Curretn loggedin User #{session['current_user_id']}"
      end

      def session
        env['rack.session']
      end

      def route
        env['api.endpoint'].route
      end
    end
  end
end
