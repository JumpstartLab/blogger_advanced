namespace :samples do
  task :generate_many => :environment do
    puts "Generating 1000 sample articles..."
    Article.generate_samples(1000){ printf "." }
    puts ""
  end
end