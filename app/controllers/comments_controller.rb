class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])

    @comment = @ticket.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      render json: @comment, status: :created, location: [ @ticket, @comment ]
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
