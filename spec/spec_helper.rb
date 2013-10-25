require 'simplecov'
SimpleCov.start
require "nodestack"

require 'pry'

class MongoEnabled < Nodestack::NodeService
  include Nodestack::MongoService

  def database
    'my-database'
  end
end

class MongoDisabled < Nodestack::NodeService
end
