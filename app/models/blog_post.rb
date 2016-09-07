class BlogPost < Obj

  attribute :author_name, :string
  attribute :body, :widgetlist
  attribute :page_title, :string, default: "[New Blog Post]"
  attribute :published_at, :date
  attribute :title, :string
  attribute :related_link, :linklist
  attribute :img_obj, :reference, only: Image

  default_for :title do |attributes|
    if attributes[:_path].starts_with?('/en')
      '[New Blog Post]'
    else
      '[Neuer Blog Post]'
    end
  end

  def menu_title
    self[:page_title] || self[:title]
  end

  def valid_widget_classes_for(field_name)
    case field_name
    when "body"
      [
        TextWidget,
        HeadlineWidget,
        ImageWidget,
        TeaserWidget,
        PersonWidget
      ]
    else []
    end
  end
end
