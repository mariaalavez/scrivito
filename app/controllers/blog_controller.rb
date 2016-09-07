class BlogController < CmsController
  def index
    @blog_posts = @obj.latest_posts
  end
end
