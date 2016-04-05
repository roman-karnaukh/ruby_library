require 'csv'

class Basic
	def read(file)
		CSV.read(file, headers:true)
	end

	def save(file, variable)
		@readed = read(file)
		if @readed.to_a.include? variable
			puts "#{self.class.name} you try to add already exists"
		else
			CSV.open(file, 'a+') do |file|
				file << variable
			end
			puts "Entered #{self.class.name.downcase}: #{variable} saved"
		end
	end

	def delete(file, variable)
		@variable_to_delete = variable
		@readed_file = read(file)

		if @readed_file.to_a.include? @variable_to_delete
			#index = @readed_file.to_a.index{|e,v| [e,v] == @variable_to_delete}
			#@readed_file.delete(index)

			CSV.open(file, 'w') do |csv|
			    @readed_file.to_a.each do |a|
			    	next if a == @variable_to_delete
			        csv << a
			    end
			end

			puts "#{self.class.name} #{@variable_to_delete} deleted"
		else
			puts "There is no #{self.class.name.downcase}: #{@variable_to_delete} you want to delete"
		end
	end

end