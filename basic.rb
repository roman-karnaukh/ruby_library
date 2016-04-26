require 'csv'

module Basic

  def class_name
	  self.class.name
  end

  def load_to_array(array, file)
	  CSV.foreach("./data/#{file}") do |line|
    next if array.include? line
		 array.push line
	  end
  end

  def i_want_to_open(file_name)
  	puts file_name[/[a-z]+/].capitalize
    read(file_name).each {|row| p row }
  end

  def variable
    instance_variable_get(instance_variables.inspect[/@[a-z]+/])
  end

  def file
	  "#{class_name.downcase}s.csv"
  end

  def read(file, headers = true)
	  CSV.read("./data/#{file}", headers:headers)
  end


  def save
  	@readed_file = read(file)
    if @readed_file.to_a.include? variable
      puts "#{class_name} #{variable} already exists"
    else
      CSV.open("./data/#{file}", 'a+') { |file| file << variable }
      puts "Entered #{class_name.downcase}: #{variable} saved"
    end
  end

  def delete
    @readed_file = read(file)
    if @readed_file.to_a.include? variable
      CSV.open("./data/#{file}", 'w') do |csv|
      @readed_file.to_a.each { |a| next if a == variable; csv << a}
    end
      puts "#{class_name} #{variable} deleted"
    else
      puts "There is no #{class_name.downcase}: #{variable} you want to delete"
    end
  end
end
