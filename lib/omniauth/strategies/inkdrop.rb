require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Inkdrop < OmniAuth::Strategies::OAuth

      args [:consumer_key, :consumer_secret]

      option :client_options, {
        :access_token_path  => '/accessToken',
        :authorize_path     => '/authorization',
        :request_token_path => '/requestToken',
        :site               => 'http://localhost:8080/rest'
      } 

      info do
        {
          :first_name   => raw_info["firstName"],
          :last_name    => raw_info["lastName"],
          :email        => raw_info["email"],
          :name         => raw_info["name"],
          :alias        => raw_info["alias"],
          :urls         => {
            'public_profile' => raw_info["permalink"]
          }
        }
      end

      uid { access_token.params[:email] }

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode( access_token.get('/users').body )[0]
      end

    end
  end
end
