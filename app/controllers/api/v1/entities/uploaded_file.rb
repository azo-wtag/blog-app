module API
  module V1
    module Entities
      class UploadedFile < Grape::Entity
        expose :id
        expose :filename
        expose :url
        expose :size_in_byte

        def url          
          ::Rails.application.routes.url_helpers.rails_blob_url(object)
        end

        def filename
          object.filename&.to_s
        end

        def size_in_byte
          object.byte_size
        end
      end
    end
  end
end
