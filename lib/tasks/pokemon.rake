namespace :pokemon do
  desc "TODO"
  task import: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "pokemon.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      pokemon = Pokemon.new
      pokemon.number = row["#"]
      pokemon.name = row["Name"]
      pokemon.type1 = row["Type 1"]
      pokemon.type2 = row["Type 2"]
      pokemon.total = row["Total"]
      pokemon.hp = row["HP"]
      pokemon.attack = row["Attack"]
      pokemon.defense = row["Defense"]
      pokemon.sp_atk = row["Sp. Atk"]
      pokemon.sp_def = row["Sp. Def"]
      pokemon.speed = row["Speed"]
      pokemon.generation = row["Generation"]
      pokemon.legendary = row["Legendary"]
      pokemon.save
      puts "#{pokemon.number}, #{pokemon.name} saved"
    end
    puts "There are now #{Pokemon.count} pokemon in the database"
  end

end
