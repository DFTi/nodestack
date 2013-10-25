require 'simplecov'
SimpleCov.start
require "nodestack"

class MongoEnabled < Nodestack::MongoService
  def database
    'my-database'
  end
end

class MongoDisabled < Nodestack::NodeService
end
