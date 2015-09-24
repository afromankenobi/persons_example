# Class person.
class Person
  attr_accessor :name
  attr_accessor :last_name
  attr_accessor :country
  attr_accessor :continent
  attr_accessor :gender

  def initialize(name = '', last_name = '', country = '', continent = '', gender = '')
    @name = name
    @last_name = last_name
    @country = country
    @continent = continent
    @gender = gender
  end

  def full_name
    [@name, @last_name].join(' ')
  end
end
