require_relative('../db/sql_runner')
class Helper

  def save(table)
    sql = "insert into table(xxx) values(yyy) returning *"
    sql.sub!("table",table)
    fields_string = ""
    valid_instance_variables = self.instance_variables
    valid_instance_variables.shift
    valid_instance_variables.each{|variable| fields_string << variable.to_s + ","}
    fields_string =fields_string.chomp(",").gsub('@','') 
    values_string = ""
    valid_instance_variables.each{ |variable| values_string << (if 

      (self.instance_variable_get(variable).class == String) then ("'" + self.instance_variable_get(variable) + "'" + ",") else (self.instance_variable_get(variable).to_s + ",") end)}
    values_string = values_string.chomp(",")
    sql.sub!("xxx",fields_string)
    sql.sub!("yyy",values_string)
    data = SqlRunner.run(sql).first
    self.instance_variable_set(:@id,data['id'])
  end

  

end