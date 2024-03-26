module API
  module V1
    module Resources
      class Me < Grape::API
        
        helpers do
          def sign_in(user)
            session['current_user_id'] = user.id
          end
        end

        desc 'user signup'
        route_setting :authentication, optional: true
        params do
          requires :name, type: String
        end

        post :signup do
          user = User.build(**params)
          user.save

          present user, with: Entities::User
        end

        desc 'user login'
        params do
          requires :name, type: String
        end

        post :login do
          sign_in(User.first)
        end
      end
    end
  end
end
