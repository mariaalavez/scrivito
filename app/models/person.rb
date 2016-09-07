class Person < Obj
  attribute :name, :string
  attribute :image, :reference, only: Image
  attribute :body, :html
end
