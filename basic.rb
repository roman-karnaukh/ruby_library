require 'csv'

module Basic

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

  def get_v
    @@arry = []
    $vallue = self.class.name.downcase
    @@take_values = instance_variables
    @@take_values.each {|var| @@arry << instance_variable_get(:"#{var}")}

    return @@arry
  end

  def add(arr)
    @@for_save = instance_variable_get(:"@#{$vallue}s")
    @@for_save << arr
    instance_variable_set(:"@#{$vallue}s",  @@for_save)
    puts "#{$vallue.capitalize} #{arr} added"
  end

  def delete(arr)
    @@for_save = instance_variable_get(:"@#{$vallue}s")
    @@for_save.delete arr
    instance_variable_set(:"@#{$vallue}s",  @@for_save)
    puts "#{$vallue.capitalize} #{arr} deleted"
  end

  def save(object)
    object.each do |name|
      @@for_saving = instance_variable_get(:"@#{name}")
        CSV.open("./data/#{name}.csv", 'w') do |csv|
        @@for_saving.each { |a| csv << a}
      end
      puts "#{name.capitalize} saved to the file #{name}.csv"
    end
  end
end
