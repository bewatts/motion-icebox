class Icebox
  include IB
  def self.freeze(obj, name)
    instance.freeze(obj, name, options)
  end

  def self.unfreeze(name)
    instance.unfreeze(name)
  end

  def self.instance
    @instance ||= new
  end

  attr_reader :storage

  def freeze(obj, name)
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


