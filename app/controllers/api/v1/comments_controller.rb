module Api
  module V1
    class CommentsController < Controller
      def show
        respond_with Comment.find(params[:id])
      end
    end
  end
end
