require 'spec_helper'

describe Nodestack::NodeService do
  
  let(:service) do
    Nodestack::NodeService.new('test', 12345)
  end

  let(:command) do
    "node -e \"require('test').listen(12345)\""
  end

  before { service }
  
  describe "#start" do
    it "spawns a nodejs app and tells it to listen on the port" do
      expect(service).to receive(:spawn).with(command)
      service.start
    end
  end

  describe "#stop" do
    it "kills and waits on the pid returned by spawn" do
      expect(Process).to receive(:kill).with("TERM", service.pid)
      expect(Process).to receive(:wait).with(service.pid)
      service.stop
    end
  end


  describe "mongodb support" do

    describe "disabled" do
      let(:service) { MongoDisabled.new('test', 1234) }
      it "raises when attempting to use the database" do
        lambda{service.database}.should raise_error /Define MongoDisabled#database to enable mongodb/
      end
    end

    describe "enabled" do
      let(:service) { MongoEnabled.new('test', 1234) }
      it "returns a defined string without errors" do
        lambda{service.database}.should_not raise_error
        service.database.should be_a String
      end

      describe "#db" do
        it "returns the mongo db" do
          service.db.should be_a Mongo::DB
          service.db.name.should eq service.database
        end
      end
    end
  end
end
