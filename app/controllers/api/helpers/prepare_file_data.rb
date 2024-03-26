module API
  module Helpers
    module PrepareFileData
      def file_data(field_name, field_data)
        {
          field_name => prepare_file_params(field_data),
        }
      end

      def prepare_file_params(field_data)
        {
          io: field_data[:tempfile],
          filename: field_data[:filename],
          content_type: field_data[:type],
        }
      end
    end
  end
end
