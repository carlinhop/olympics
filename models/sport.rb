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

  def update(options)
    sql = "UPDATE sports SET name = '#{options['name']}' WHERE id = #{@id}"
    SqlRunner.run(sql)

  end

  def self.destroy(id)
    sql = "delete from sports where id = #{id}"
    SqlRunner.run(sql)
    puts "Sport #: #{id} was destroyed"
  end

  def self.find(id)
    sql = "select * from sports where id = #{id}"
    sport = SqlRunner.run(sql).first
    result = Sport.new(sport)
    return result
  end


end

