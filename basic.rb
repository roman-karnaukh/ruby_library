require 'csv'

module Basic

  def class_name
	  self.class.name
  end

  def load(object)
  	object.each do |name|
  		instance_variable_set(:"@#{name}", "") #for cleaning
  	  array = []
  	  CSV.foreach("./data/#{name}.csv") do |line|
        array.push line
	    end
	    instance_variable_set(:"@#{name}", array)
	  end
  end

  def get_variables
    @@inst_var_arr = []
    inst_var = instance_variables
    inst_var.each {|variable| @@inst_var_arr.push instance_variable_get(variable)}
    return @@inst_var_arr
  end

  def file
	  "#{class_name.downcase}s.csv"
  end

  def read(file, headers = true)
    CSV.read("./data/#{file}", headers: headers)
  end

  def save
    variable = get_variables
    @@readed_file = read(file)
    if @@readed_file.to_a.include? variable
      puts "#{class_name} #{variable} already exists"
    else
      CSV.open("./data/#{file}", 'a+') { |file| file << variable }
      puts "Entered #{class_name.downcase}: #{variable} saved"
    end
  end

  def delete
    variable = get_variables
    @@readed_file = read(file)
    if @@readed_file.to_a.include? variable
      CSV.open("./data/#{file}", 'w') do |csv|
      @@readed_file.to_a.each { |a| next if a == variable; csv << a}
    end
      puts "#{class_name} #{variable} deleted"
    else
      puts "There is no #{class_name.downcase}: #{variable} you want to delete"
    end
  end
end
