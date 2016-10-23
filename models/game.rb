
require_relative('country')
class Game
  attr_accessor :name, :year, :athletes, :countries
  
  def initialize(options)
    @id = nil
    @name = options[:name]
    @year = options[:year]
    @athletes = []
    @countries = []
  end

  def country_ranking
    @countries.each{|country| country.update_points()}
    ranking = @countries.sort_by{ |country| country.points  }
    
    
  end

end

