class Page < Obj
  attribute :title, :string
  attribute :body, :widgetlist
  attribute :child_order, :referencelist

  def valid_widget_classes_for(field_name)
    case field_name
    when "body"
      [
        TextWidget,
        HeadlineWidget,
        ImageWidget
      ]
    else []
    end
  end
end
