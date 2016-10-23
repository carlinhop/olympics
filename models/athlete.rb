class Athlete
  attr_accessor :name, :sport, :country

  def initialize(options)
    @id = nil
    @name = options[:name]
    @sport = options[:sport]
    @country = options[:country]
  end
end