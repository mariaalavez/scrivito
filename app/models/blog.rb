class Blog < Obj
  #Obj is an object inherited from scrivito

  attribute :page_title, :string # attribute name and type
  attribute :title, :string

  def latest_posts(page = 0, count = 10)
    BlogPost.all
      .offset(page * count)
      .batch_size(count)
      .order(:published_at)
      .reverse_order
      .take(count)
  end

  def info_for_content_browser
    "title: #{self[:page_title]}"
  end


end
