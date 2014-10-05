class Author < ActiveRecord::Base
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
  
  private
  
  def person_params
    params.require(:person).permit(:email, :name, :phone_number, :twitter, :website)
  end
end
