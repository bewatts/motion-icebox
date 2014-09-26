class Icebox

  def self.freeze(obj, name, options = {})
    instance.freeze(obj, name, options)
  end

  def self.unfreeze(name = nil)
    instance.unfreeze(name)
  end
  
  def self.instance
    @instance ||= new
  end

  attr_reader :storage

  def freeze(obj, name, options)
    storage[name] = val(obj)
  end

  def unfreeze(name)
    storage[name].load
  end

  def initialize
    @storage = {}
  end

  def val(obj)
    StoredObject.new(obj)
  end

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