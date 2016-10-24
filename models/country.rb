require_relative('../db/sql_runner')



class Country
  attr_accessor :id,:name, :gold, :silver, :bronze, :points
  
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @gold = options['gold'].to_i
    @silver = options['silver'].to_i
    @bronze = options['bronze'].to_i
    @points = options['points'].to_i
  end

  def save()
    sql = "INSERT INTO countries (name, gold, silver, bronze, points) VALUES ('#{ @name }', #{ @gold }, #{ @silver }, #{ @bronze }, #{ @points }) RETURNING *"
    country = SqlRunner.run( sql ).first
    @id = country['id']
  end

  def self.all()
    sql = "SELECT * FROM countries"
    countries = SqlRunner.run( sql )
    result = countries.map { |c| Country.new( c) }
    return result
  end

  def update()
    sql = "UPDATE countries SET name = '#{@name}',gold = #{@gold}, silver = #{@silver}, bronze = #{@bronze}, points = #{@points} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "delete from countries where id = #{id}"
    SqlRunner.run(sql)
    puts "Country #: #{id} was destroyed"
    
  end

  def self.find(id)
    sql = "select * from countries where id = #{id}"
    countries = SqlRunner.run(sql).first
    result = Country.new(countries)
    return result
  end

  def update_points
    @points = (@gold * 5) + (@silver * 3) + @bronze
    return @points
  end



end


