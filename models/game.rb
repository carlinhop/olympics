
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

  def self.all()
    sql = "SELECT * FROM games"
    games = SqlRunner.run( sql )
    results = games.map { |g| Game.new( g) }
    return results
  end

  def update()
    sql = "UPDATE games SET name = '#{@name}', year = #{@year} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "delete from games where id = #{id}"
    SqlRunner.run(sql)
    puts "Game #: #{id} was destroyed"
    
  end

  def country_ranking
    @countries.each{|country| country.update_points()}
    ranking = @countries.sort_by{ |country| country.points  }
    
    
  end

end

