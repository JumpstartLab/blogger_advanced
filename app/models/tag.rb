class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :articles, :through => :taggings

  def to_s
    name
  end

  def self.generate_samples(quantity = 10)
    quantity.times do |i|
      puts "generating tag #{i}"
      Fabricate(:tag)
    end
  end
end
