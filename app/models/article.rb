class Article < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true

  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings

  def to_s
    return title
  end

  def tag_list
     tags.collect{|t| t.name}.join(", ")
  end

  def tag_list=(input)
    #self.tags = []
    names = input.split(",").collect{|text| text.strip.downcase}
    names.each do |name|
      tag = Tag.find_or_create_by_name(name)
      self.tags << tag unless self.tags.include?(tag)
    end
    self.tags = self.tags.select{|tag| names.include?(tag.name)}
  end

  def self.valid_ids
    Article.select(:id).collect{|a| a.id}
  end

  def self.search(params)
    if params[:tag].nil?
      [Article.scoped, nil]
    else
      tag = Tag.find_by_name(params[:tag])
      [tag.articles, tag]
    end
  end
end
