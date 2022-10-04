namespace :pokemon do
  desc "TODO"
  task import: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "pokemon.csv"))
    csv = CSV.parse(csv_text, :headers => true, , :encoding => "ISO-8859-1")
    csv.each do |row|
      pokemon = Pokemon.new
      pokemon.number = 
      puts row.to_hash
    end
    # puts csv
  end

end
