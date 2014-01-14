module Api
  module V1
    class ArticlesController < Controller
      def index
        respond_with Article.limit(5).order("created_at DESC").as_json(:except => :body)
      end

      def show
        article = Article.find(params[:id])
        respond_with({:article => article,
                      :comments => article.comments})
      end

      def create
        article = Article.new(params[:article])
        if article.save?
          render :status => 201
        else
          render :status => 406
        end
      end
    end
  end
end
