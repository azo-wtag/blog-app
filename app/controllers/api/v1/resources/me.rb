module API
    module V1
      module Resources
        class Me < Grape::API
         desc "user signup"
         route_setting :authentication, optional: true
         params do 
            requires :name, type: String
         end

         post :signup do 
         end
        end
      end
    end
  end
