
require_relative('country')
class Game
  attr_accessor :id, :name, :year
  
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @year = options['year']

  end

  def save()
    sql = "INSERT INTO games (name, year) VALUES ('#{ @name }', #{ @year }) RETURNING *"
    game = SqlRunner.run( sql ).first
    @id = game['id']
  end

  def country_ranking
    @countries.each{|country| country.update_points()}
    ranking = @countries.sort_by{ |country| country.points  }
    
    
  end

end

