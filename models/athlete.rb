require('pry-byebug')
require_relative('../db/sql_runner')


class Athlete
  attr_accessor :id, :name, :sport_id, :country_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @sport_id = options['sport_id'].to_i
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (name, sport_id, country_id) VALUES ('#{ @name }', #{ @sport_id }, #{ @country_id }) RETURNING *"
    athlete = SqlRunner.run( sql ).first
    @id = athlete['id']
  end

  def self.all()
    sql = "SELECT * FROM athletes"

    athletes = SqlRunner.run( sql )
    result = athletes.map {  |a| Athlete.new( a )}
    return result
  end

  def update(options)
    sql = "UPDATE athletes SET name = '#{options['name']}',sport_id = #{options['sport_id']}, country_id = #{options['country_id']} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "delete from athletes where id = #{id}"
    SqlRunner.run(sql)
    puts "Athlete #: #{id} was destroyed"
    
  end

  def self.find(id)
    sql = "select * from athletes where id = #{id}"
    athlete = SqlRunner.run(sql).first
    result = Athlete.new(athlete)
    return result
  end

  def sport
    sport = Sport.find(self.sport_id)
    return sport
  end

  def country
      country = Country.find(self.country_id)
      return country
  end


end



