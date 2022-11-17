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
      url = "https://api.firstms.com/v1" if @production

      return url
    end

    def post(endpoint, body)
      response = HTTParty.post("#{@base_url}/#{endpoint}", body: body.to_json, basic_auth: { username: @username, password: @password }, headers: headers, timeout: 180)

      format_response(response)
    end

    def headers
      { "Content-Type" => "application/json" }
    end

    def format_response(response)
      response.parsed_response.deep_symbolize_keys.deep_transform_keys { |key| key.to_s.delete("@").underscore.to_sym }
    end

  end
end