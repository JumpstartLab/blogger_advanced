class Author < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :twitter, :website
end
