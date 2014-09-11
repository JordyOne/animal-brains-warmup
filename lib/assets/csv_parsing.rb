require 'csv'

class TableSeeder

  def initialize(file)
    seed_writing(file)
  end

  private

  def seed_writing(file)
    output_file = File.new('db/seeds.rb', 'w')
    CSV.foreach(file, :headers => true) do |row|
      output_file.puts("Brain.create(animal: '#{row['animal']}', body: #{row['body']}, brain: #{row['brain']})")
    end
  end
end
