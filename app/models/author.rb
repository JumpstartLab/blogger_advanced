class Author < ActiveRecord::Base
  has_secure_password

  has_many :articles
  has_many :api_keys

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
