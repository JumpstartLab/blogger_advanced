class Tenant < ActiveRecord::Base
  has_many :authors
  has_many :articles, through: :authors

  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
