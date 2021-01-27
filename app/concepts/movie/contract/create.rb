module Movie::Contract
  class Create < Reform::Form
    property :title
    property :year
    property :rank

    #TODO4: Add back validations
    #validates :title, presence: true
    #validates :year, inclusion: 1900..2030
  end
end
