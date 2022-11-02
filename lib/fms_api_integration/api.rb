require "httparty"
require "fms_api_integration/endpoints/submit_instructions"

module FmsApiIntegration
  class Api
    include Endpoints::SubmitInstructions

    def initialize(api_key, production = false)
      @api_key = api_key
      @base_url = base_url()
      @production = production
    end

  private

    def base_url
      url = "https://api-test.firstms.com/v1"

      if @production
        url = "https://api.firstms.com/v1"
      end

      return url
    end
  end
end