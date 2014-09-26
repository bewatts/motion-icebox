module IB
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
  end
end


