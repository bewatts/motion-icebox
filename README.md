#Icebox

Fed up with only using puts statements to debug your rubymotion programs?

Wish you could see what your objects' state are at any given time? 

Enter Icebox:  Freeze an object!  Extract it later!  Examine what your objects are doing at a given time! 

Icebox Deep duplicates your objects if possible. If not, it makes a clone.

##Methods

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

Icebox.freeze(simon, name: :simon)

1_000.times do
  simon.heartbeat
end

puts simon.status
puts simon.object_id

ice_king = Icebox.unfreeze(:simon)
puts ice_king.status
puts ice_king.object_id
```

##Does Icebox have a mascot? 
yes 

![Gunter](http://img2.wikia.nocookie.net/__cb20121016040602/adventuretimewithfinnandjake/images/6/68/Gunter.png)