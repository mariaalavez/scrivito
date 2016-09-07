class Image < Obj
  attribute :blob, :binary
  attribute :features, :multienum, values: ['paid', 'free']

  # activate image resizing and optimization
  def apply_image_transformation?
    true
  end
end
