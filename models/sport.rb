require_relative('../db/sql_runner')

class Sport
  attr_accessor :id, :name
  
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO sports (name) VALUES ('#{ @name }') RETURNING *"
    sport = SqlRunner.run( sql ).first
    @id = sport['id']
  end

  def self.all()
    sql = "SELECT * FROM sports"
    sports = SqlRunner.run( sql )
    result = sports.map { |s| Sport.new( s ) }
    return result
  end


end

