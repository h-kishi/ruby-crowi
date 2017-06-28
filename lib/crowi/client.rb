require 'crowi/api_methods'
require 'crowi/version'

module Crowi
  class Client
    include Crowi::ApiMethods

    def initialize(base_url: nil, access_token: nil)
      @base_url = base_url
      @access_token = access_token
    end

    def get(path, params = nil, headers = nil)
      send_request(:get, path, params, headers)
    end

    def post(path, params = nil, headers = nil)
      send_request(:post, path, params, headers)
    end

    def put(path, params = nil, headers = nil)
      send_request(:put, path, params, headers)
    end

    def patch(path, params = nil, headers = nil)
      send_request(:patch, path, params, headers)
    end

    def delete(path, params = nil, headers = nil)
      send_request(:delete, path, params, headers)
    end

    def send_request(method, path, params = {}, headers = nil)
      # TODO Crowi does not support Authorization: Bearer
      params[:access_token] = @access_token
      Crowi::Response.new(connection.send(method, path, params, headers))
    end

    private
      def connection
        @connection ||= Faraday.new(faraday_options) do |connection|
           connection.request :json
           connection.response :json
           connection.adapter Faraday.default_adapter
        end
      end

      def faraday_options
        {
           url: @base_url,
           headers: headers
        }
      end

      def headers
        {
          'Accept' => 'application/json',
          'User-Agent' => "Crowi Ruby Gem #{Crowi::VERSION}"
        }
      end
  end
end
