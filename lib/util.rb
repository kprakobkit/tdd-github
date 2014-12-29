require 'json'
require 'net/http'
require 'uri'

module Util
  TOKEN = "2c627024d6e6bcae6f275f10b3ed8bfff2f8602c"

  def self.get_response(endpoint)
    uri = URI("https://api.github.com/#{endpoint}")
    uri.query = URI.encode_www_form('access_token' => TOKEN)

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == "https") do |http|
      req = Net::HTTP::Get.new uri
      http.request req
    end
    JSON.parse(response.body)
  end

  def self.post_repo(params)
    payload = params.to_json
    uri = URI("https://api.github.com/user/repos")
    uri.query = URI.encode_www_form('access_token' => TOKEN)
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == "https") do |http|
      req = Net::HTTP::Post.new uri
      req.body = payload
      http.request req
    end
    JSON.parse(response.body)
  end
end
