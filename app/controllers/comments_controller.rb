class CommentsController < ApplicationController
  before_filter :attending_user
  before_filter :load_commentable

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        # format.html { render :text => 'Posted!' }
        format.html { redirect_to link_path(@comment, anchor: "comment_#{@comment.id}") }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def load_commentable
      klass = [Event].detect { |c| params["#{c.name.underscore}_id"]}
      @commentable = klass.find(params["#{klass.name.underscore}_id"])
    end

    def attending_user
      @event = Event.find(params[:event_id])
      redirect_to(root_url) unless current_user.attending?(@event)
    end

end
