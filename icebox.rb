# Names: Icebox CRYRO
#
# Freeze an object!  Extract it later!
#
# It sucks that we have to use puts statments to examine objects at a given time.  

# future goal: have client specify the storage mechanism.  
# future goal: be able to tag

class Icebox

  def self.save(obj)
    instance.save(obj)
  end
  
  def instance
    @instance ||= new
  end
  
  def initialize
    @storage = Hash.new {|class_hash, key_hash|  hash[key] = [] }
  end
  
  def objects
    
  end
  
  def save(obj)
    key(obj) << val(obj)
  end
  
  def key(obj)     
    @storage[obj.class]
  end
  
  def val(obj)
    Marshal.dump(obj)
  end
  
  def clone(obj)
    obj.clone
  end
  
  def make_storage_key
    
  end
  
  
end

class Human 
  def initialize
    @closeness_to_death = 1_000_000_000
  end

  def heartbeat
    @closeness_to_death -= 1
  end
  
  def should_die? 
    
  end
end



Icebox.save(you)