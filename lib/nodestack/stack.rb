module Nodestack
  class Stack
    def initialize(services={})
      @services = services
    end

    def start
      @services.each do |name, service|
        service.start
      end
    end

    def stop
      @services.each do |name, service|
        service.stop
      end
    end

    def method_missing *args, &block
      @services[args.first]
    end
  end
end

