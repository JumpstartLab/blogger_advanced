require 'capybara/poltergeist'

class LoadScript
  include Capybara::DSL
  attr_reader :root
  def initialize(server_url)
    @root = server_url
  end

  def session
    @session ||= Capybara::Session.new(:poltergeist)
  end

  def run
    while true do
      send(actions.sample)
    end
  end

  def actions
    [:category, :article, :article_index, :add_comment, :add_article]
  end

  def category
    puts "viewing a random tag"
    session.visit "#{root}/articles?tag=tag_#{rand(10)}"
  end

  def article
    puts "viewing a random article"
    session.visit "#{root}/articles/#{rand(10) + 1}"
  end

  def article_index
    puts "visiting article index"
    session.visit "#{root}/articles"
  end

  def add_comment
    puts "creating a comment"
    article
    session.fill_in("comment_author_name", with: "Pizza Man")
    session.fill_in("comment_body", with: "sweet article lurv it #{rand(1000)}")
    session.click_button("Save")
  end

  def add_article
    puts "creating an article"
    session.visit "#{root}/articles/new"
    session.fill_in("article_title", with: "my new article #{rand(1000)}")
    session.fill_in("article_body", with: "my article body #{rand(1000)}")
    session.click_button("Save")
  end
end

namespace :load_script do
  desc "Run a simple load script against your server"
  task :run => :environment do
    unless ENV["SERVER_URL"]
      puts "No SERVER_URL provided, using http://localhost:3000 as default. Provide SERVER_URL as an ENV variable to override"
    end
    LoadScript.new(ENV["SERVER_URL"] || "http://localhost:3000").run
  end
end

