ENV["GOORU_URL"] ||= "http://concept.goorulearning.org/"

require "stringio"
require "weary"

require "gooru/client"
require "gooru/client/resources"
require "gooru/client/sign_in"
require "gooru/request"
require "gooru/resources"
require "gooru/response"
require "gooru/sign_in"
require "gooru/version"

module Gooru
end