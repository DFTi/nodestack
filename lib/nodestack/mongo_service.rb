require 'mongo'

module Nodestack
  module MongoService
    include Mongo

    def db
      self.client.db(self.database)
    end

    def client
      @client ||= MongoClient.new('127.0.0.1', 27017)
    end

    def drop_database
      self.client.drop_database(self.database)
    end

  end
end

