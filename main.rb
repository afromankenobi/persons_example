# Require person class
# and module countries
require_relative 'person.rb'
require_relative 'countries.rb'

include Countries

# 1. Generate 15 person objects and save it in an array

# declare a blank array where
# we will push all instances that we will generate
people = []

15.times do |i|
  # Iterate 15 times to create 15 objects of persons
  # and for each object assign all values
  
  # First, generate random country and their continent from Countries module
  random_continent_country = Countries.sort_country_and_continent
  
  # create an object with a name and
  p = Person.new("name#{i}", "lastname#{i}")
  # assign country and continent generated in module
  p.continent, p.country = random_continent_country
  
  # if i.even? is true (if i % 2 == 0)
  # assign male as gender
  # else assign female
  p.gender = i.even? ? 'male' : 'female' 

  # then push the new object to the array called people
  people << p
end

# 2. Count all the objects from the generated array.
# We can use size, lenght and count
# we save the count value in a variable to show it later
count_people = people.count

# 3. Generate an array with all continents, extracting all the information
# from the collection of persons (called people)
continents = people.map(&:continent)
# Then remove all duplicates, and avoid duplication per capital letters
continents.map!(&:downcase).uniq!

# 4. Construct a hash to collect all countries per continent (extrating 
# the info from the people array)

# Create an empty hash to save the countries per continent
continents_countries = {}

# iterate over the continents
continents.each do |continent|
  # Obtain with map the downcase country of each person.
  # Use of downcase is to 'uniq' the array and avoid
  # duplication
  continents_countries[continent] = people.select{|p| p.continent.downcase == continent }.map(&:country).compact.uniq
end

# 5. Make an array with all people when their name end with 5
# Yeah, i know this is weird but, i interpolate a number to each
# name :c

people_by_name = people.select{|p| p.name[-1] == '5'}

# Remeber, to access to the last element of string
# we can access it as an array.
# And in arrays, we can access to the last element with '-1'

# 6. Make two list, one with males and the other with females
males = people.select{|p| p.gender == 'male'}
females = people.select{|p| p.gender == 'female'}

# Now, show all info in the terminal

puts "Excercise 2"
puts "Total people = #{count_people}"

puts "________________________________________________________"

puts "Excercise 3"
puts "Continents are #{continents.join(', ')}"


puts "________________________________________________________"

puts "Excercise 4"
puts "Countries per continent"

continents_countries.each do |key, value|
  puts "#{key} => #{value.join(', ')}"
end

puts "________________________________________________________"

puts "Excercise 5"
puts "All people with names ended in '5'"

people_by_name.each{ |p| puts p.name }

puts "________________________________________________________"

puts "Excercise 6"
puts "All males: #{males.map(&:name).join(', ')}"
puts "All females: #{females.map(&:name).join(', ')}"

puts "end"
puts "________________________________________________________"
