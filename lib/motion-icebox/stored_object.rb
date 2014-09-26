module IB
  class StoredObject

    attr_reader :time_stored
    attr_accessor :storage_type

    def initialize(original_obj)
      @obj = save(original_obj)
      @time_stored = Time.now
    end

    def save(obj)
      begin
        self.storage_type = :marshal
        Marshal.dump obj
      rescue
        self.storage_type = :clone
        obj.clone
      end
    end

    def load
      case storage_type
        when :marshal
          Marshal.load @obj
        when :clone
          @obj
      end
    end

  end
end