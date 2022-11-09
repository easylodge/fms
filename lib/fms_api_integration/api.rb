require "httparty"
require "fms_api_integration/endpoints/submit_instructions"

module FmsApiIntegration
  class Api
    include Endpoints::SubmitInstructions

    def initialize(username, password, production = false)
      @username = username
      @password = password
      @production = production
      @base_url = base_url()
    end

  private

    def base_url
      url = "https://api-test.firstms.com/v1"

      if @production
        url = "https://api.firstms.com/v1"
      end

      return url
    end

    def post(endpoint, body)
      HTTParty.post("#{@base_url}/#{endpoint}", body: body, basic_auth: { username: @username, password: @password })
    end
  end
end