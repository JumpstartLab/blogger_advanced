class Article < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true

  belongs_to :author
  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings

  #default_scope :include => [:comments, :tags]

  def cached_comment_count
    Rails.cache.fetch("article-#{id}-comments-count") do
      comments.count
    end
  end

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

  def self.most_popular
    all.sort_by{|a| a.comments.count }.last
  end

  def self.random
    order('RANDOM()').limit(1).first
  end

  def self.valid_ids
    Article.select(:id).collect{|a| a.id}
  end

  def self.search_by_tag_name(tag_name, page = 1)
    if tag_name.blank?
      [Article.includes(:comments, :tags).paginate(page: page, per_page: 20), nil]
    else
      tag = Tag.find_by_name(tag_name)
      tag ? [tag.articles.includes(:comments, :tags).paginate(page: page, per_page: 20), tag] : [[], nil]
    end
  end

  def self.for_dashboard
    order('created_at DESC').limit(5)
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    Rails.cache.fetch("article-total-word-count") do
      all.inject(0) {|total, a| total += a.word_count }
    end
  end

  def self.generate_samples(quantity = 1000)
    tags = Tag.all
    quantity.times do |i|
      puts "generating article #{i}"
      article = Fabricate(:article, created_at: (Time.now - (rand(600).hours)))
      5.times do
        begin
          article.tags << tags.sample
        rescue ActiveRecord::RecordInvalid
          #tried to make a dup tag, dont care
        end
      end
      rand(2..8).times do
        Fabricate(:comment, :article => article, :created_at => article.created_at + rand(100).hours)
      end
      yield if block_given?
    end
  end
end
