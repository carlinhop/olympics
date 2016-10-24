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


end



