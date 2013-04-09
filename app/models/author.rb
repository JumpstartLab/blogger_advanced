class Author < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :name, :username, :phone_number, :twitter, :website

  validates_confirmation_of :password, message: "should match confirmation", if: :password

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