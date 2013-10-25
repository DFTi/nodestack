module Nodestack
  class NodeService
    class DatabaseError < StandardError; end
    attr_reader :port, :pid

    def initialize node_require, port
      @node_require = node_require
      @port = port
    end

    def database
      raise DatabaseError, "Define #{self.class.to_s}#database to enable mongodb on this service."
    end

    ##
    # Spawns a node subprocess that will require() what
    # is expected to return something that responds to listen()
    def start
      js = %{require('#{@node_require}').listen(#{@port})} 
      @pid = spawn(%{node -e \"#{js}\"})
    end

    def stop
      Process.kill "TERM", @pid
      Process.wait @pid
    end

  end
end

