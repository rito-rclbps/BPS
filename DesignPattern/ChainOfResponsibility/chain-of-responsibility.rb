# -*- encoding : utf-8 -*-

class Trouble
  def initialize(number)
    @number = number
  end
  def get_number
    @number
  end
  def get_name
    "[Trouble #{@number}]"
  end
end

class Support
  def initialize(name)
    @name = name
    @next
  end
  def set_next(next_supporter)
    @next = next_supporter
  end
  def to_string
    '[' + @name + ']'
  end
  def resolved(trouble)
    puts trouble.get_name + ' is resolved by ' + @name + '.'
  end
  def fail(trouble)
    puts trouble.get_name + ' cannot be resolved.'
  end
  def support(trouble)
    if resolve(trouble) then
      resolved(trouble)
    elsif @next != nil then
      @next.support(trouble)
    else
      fail(trouble)
    end
  end
end

class LimitSupport < Support
  def initialize(name,limit)
    @name = name
    @limit = limit
  end
  def resolve(trouble)
    trouble.get_number < @limit ? true : false
  end
end


supporter30 = LimitSupport.new('to_30',30)
supporter50 = LimitSupport.new('to_50',50)
supporter70 = LimitSupport.new('to_70',70)
supporter90 = LimitSupport.new('to_90',90)

supporter30.set_next(supporter50).set_next(supporter70).set_next(supporter90)
# supporter30.set_next(supporter70).set_next(supporter50).set_next(supporter90)

i = 1
while i <= 100
  supporter30.support(Trouble.new(i))
  i += 1
end

