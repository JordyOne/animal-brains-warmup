require 'csv'

class AnimalSeeder

  def initialize(file)
    seed_writing(file)
  end

  private

  def seed_writing(file)
    csv_file = CSV.parse(File.read(file))
    output_file = File.new('db/seeds.rb', "w")
    animal = ''
    body = ''
    brain = ''
    csv_file.each do |line|
      line.each_with_index do |word, index|
        if index == 0
          animal = word
        elsif index == 1
          body = word
        elsif index == 2
          brain = word
        end
      end
      output_file.puts("Brain.create(animal: '#{animal}', body: '#{body}', brain: '#{brain}')")
    end
  end
end

