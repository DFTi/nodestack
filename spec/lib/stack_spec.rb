require 'spec_helper'

describe Nodestack::Stack do
  let(:stack) do
    Nodestack::Stack.new({
      :one => double(:service),
      :two => double(:service),
      :three => double(:service)
    })
  end

  describe "#start" do
    it "calls start method on each service" do
      expect(stack.one).to receive(:start)
      expect(stack.two).to receive(:start)
      expect(stack.three).to receive(:start)
      stack.start
    end
  end

  describe "#stop" do
    it "calls stop method on each service" do
      expect(stack.one).to receive(:stop)
      expect(stack.two).to receive(:stop)
      expect(stack.three).to receive(:stop)
      stack.stop
    end
  end
end
