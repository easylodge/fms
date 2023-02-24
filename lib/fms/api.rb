require "httparty"
require "fms/endpoints/submit_instructions"

module Fms
  class Api
    include Endpoints::SubmitInstructions

    def initialize(username, password, production = false)
      @username = username
      @password = password
      @production = production
    end

  private

    def base_url
      @production ? "https://api.firstms.com/v1" : "https://api-test.firstms.com/v1"
    end

    def post(endpoint, body)
      response = HTTParty.post("#{base_url}/#{endpoint}",
        body: body.to_json,
        basic_auth: {
          username: @username,
          password: @password
        },
        headers: headers
      )

      format_response(response)
    end

    def headers
      { "Content-Type" => "application/json" }
    end

    def format_response(response)
      response.parsed_response.deep_transform_keys { |key| key.to_s.delete("@").underscore.to_sym }
    rescue
      { error: "Something went wrong", message: response }
    end

  end
end