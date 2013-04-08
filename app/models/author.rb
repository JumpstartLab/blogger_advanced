class Author < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :twitter, :website

  def self.generate_samples(count)
    count.times { Fabricate(:author) }
  end

  def self.random
    order('RANDOM()').limit(1).first
  end
end
