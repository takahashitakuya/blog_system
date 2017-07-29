class PostsController < ApplicationController
  before_action:set_post,only:[:show,:edit,:update,:destroy]
  def index
    # 下記の2行に修正
    @q = Post.order(created_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(2)
    # @posts = @q.result(distinct: true)
 
    # 最新記事を５つ取得
    @new_posts = Post.find_newest_article
  end

  def show
    
  end

  def edit
  end

  def update
    @post = Post.update(post_params)
    redirect_to post_path(@post)   
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post.id)
  end  
  
  def destroy
    @post.destroy
    redirect_to "/posts"
  end  
  
  private
    def post_params
    params.require(:post).permit(:title,:body,:category_id)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
