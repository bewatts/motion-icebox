#Icebox

Fed up with only using puts statements to debug your rubymotion programs?

Wish you could see what your objects' state are at any given time? 

**Enter Icebox!**

Icebox presents a simple key/value store for your rubymotion debugging needs. 

Freeze an object!  Extract it later!  Examine what your objects are doing at a given time! 

Icebox Deep duplicates your objects if possible. If not, it makes a clone.


##API

```
    Icebox.freeze(object, :tag) # => freezes your object in memory at it's given state
    Icebox.unfreeze(:tag)       # => unfreezes the object you saved.     
```

##Does Icebox have any Dependencies? 
no

##Can I See an example? 
yes.  
```
class Human

  attr_reader :name
  def initialize(name)
    @name = name
    @heartbeats_left = 1_000
  end

  def heartbeat
    @heartbeats_left -= 1
  end

  def status
    if dead?
      "#{name} is dead."
    else
      "#{name} still has crazy wizard eyes."
    end
  end

  def dead?
    @heartbeats_left <= 0
  end

end

simon = Human.new('Simon Petrikov')

Icebox.freeze(simon, :ice_king)

1_000.times do
  simon.heartbeat
end

puts simon.status
puts simon.object_id

ice_king = Icebox.unfreeze(:ice_king)
puts ice_king.status
puts ice_king.object_id
```

##Future Development ideas
1. Passing in an option the method by which you want to save your object. 
2. Meta-data about how the object was saved, and when.

##Does Icebox have a mascot? 
yes 


![Gunter](http://img2.wikia.nocookie.net/__cb20121016040602/adventuretimewithfinnandjake/images/6/68/Gunter.png)