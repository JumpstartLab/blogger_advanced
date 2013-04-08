class Author < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :twitter, :website

  has_many :articles

  def self.generate_samples(count)
    count.times do
      Fabricate(:author)
      yield if block_given?
    end
  end

  def self.random
    order('RANDOM()').limit(1).first
  end
end
