namespace :samples do
  desc "Generate a thousand sample articles"
  task :generate_many => :environment do
    puts "Generating 1000 sample articles..."
    Article.generate_samples(1000){ printf "." }
    puts ""
  end

  desc "Generate ten thousand comments"
  task :generate_more_comments => :environment do
    puts "Generating 10000 sample comments..."
    10_000.times do
      article = Article.random
      Fabricate(:comment, :article => article, :created_at => article.created_at + rand(100).hours)
      printf '.'
    end
    puts ""
  end

end
