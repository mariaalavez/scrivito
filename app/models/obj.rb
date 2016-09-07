class Obj < Scrivito::BasicObj
  attribute :title, :string

  def self.valid_page_classes_beneath(parent_path)
    [Page, Blog]
  end
end
