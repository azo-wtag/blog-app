class TestJob < ApplicationJob
    queue_as :default
  
    def perform()
      binding.pry
    end
end