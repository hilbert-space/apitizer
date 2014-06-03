require 'net/https'
require 'uri'

module Apitizer
  module Connection
    module Adaptor
      class Standard
        def process(method, address, parameters = {}, headers = {})
          klass = Net::HTTP.const_get(method.to_s.capitalize)
          request = klass.new(build_uri(address, parameters))
          headers.each { |k, v| request[k] = v }
          http = Net::HTTP.new(request.uri.host, request.uri.port)
          http.use_ssl = true if address =~ /^https:/
          response = http.request(request)
          [ response.code.to_i, response.to_hash, Array(response.body) ]
        rescue NoMethodError
          raise
        rescue NameError
          raise Error, 'Invalid method'
        rescue SocketError
          raise Error, 'Connection failed'
        end

        private

        def build_uri(address, parameters)
          chunks = [ address ]
          chunks << Helper.build_query(parameters) unless parameters.empty?
          URI(chunks.join('?'))
        end
      end
    end
  end
end
