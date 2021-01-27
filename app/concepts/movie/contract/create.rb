module Movie::Contract
  class Create < Reform::Form
    property :title
    property :year
    property :rank

    validates :title, presence: true
    validates :year, numericality: { only_integer: true, greater_than: 1900,
                                     less_than: 2030 }
    validates :rank, numericality: { only_integer: true, greater_than: 0,
                                     less_than: 21 }
  end
end
