require 'httparty'
class ExampleJob < ApplicationJob
  queue_as :default

  def perform(i)
    HTTParty.post(ENV['WEBSITE_URL'] + '/api/v1/messages', :body => {message: {text: "AJ is working!!!", conversation_id: i}})
  end
end
