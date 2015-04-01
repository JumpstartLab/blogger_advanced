require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe "GET show" do
    let(:author) { Fabricate(:author) }
    let(:article) { Fabricate(:article, author: author) }

    it "renders an article as json" do
      get :show, id: article.id
      expect(response).to have_http_status(:success)
      data = JSON.parse(response.body)["article"]

      expect(data["id"]).to eq(article.id)
      expect(data["title"]).to eq(article.title)
      expect(data["author_name"]).to eq(author.name)
      expect(data["body"]).to eq(article.body)
    end
  end

  describe "GET index" do
    before do
      tags = 3.times.map { Fabricate(:tag) }
      authors = 3.times.map { Fabricate(:author) }
      3.times { Fabricate(:article, author: authors.sample) }

      Article.all.each do |a|
        a.tags << tags.sample
        Fabricate(:comment, article: a)
      end
    end

    it "gets index with specific attributes for articles" do
      get :index
      data = JSON.parse(response.body)["articles"]
      expect(data.count).to eq(3)

      data.each do |d|
        article = Article.find(d["id"])
        expect(d["id"]).to eq(article.id)
        expect(d["title"]).to eq(article.title)
        expect(d["tag_names"]).to eq(article.tags.pluck(:name))
        expect(d["comments_count"]).to eq(article.comments.count)
      end
    end
  end
end
