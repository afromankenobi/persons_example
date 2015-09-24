# i create a module to automate the generation of countries

module Countries
  LIST_BY_CONTINENT = {
    america: [
      :chile,
      :argentina
      ],
    europa: [
      :finlandia,
      :belgica
      ],
    africa: [
      :congo
      ]
  }
  
  LIST = LIST_BY_CONTINENT.values.flatten
  
  CONTINENT_LIST = LIST_BY_CONTINENT.keys
  
  def sort_country_and_continent
    # First, extract a random continent
    random_continent = CONTINENT_LIST.sample
    
    # Then, with random continent
    # choose a random country of the continent
    
    random_country = LIST_BY_CONTINENT[random_continent].sample
    
    # and return the continent and the country in array
    [random_continent, random_country]
  end 
end