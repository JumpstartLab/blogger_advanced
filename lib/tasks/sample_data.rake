namespace :sample_data do
  desc "Load pre-generated PG data into Dev db"
  task :load => ["db:drop", "db:create"] do
    load_cmd = "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $(whoami) -d blogger_advanced_development #{Rails.root.join("blogger_large_dataset.dump")}"
    puts "will load Data dump into local PG database with command:"
    puts load_cmd
    system(load_cmd)
  end
end
