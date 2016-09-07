class PersonWidget < Widget
  attribute :person, :reference, only: Person
end
