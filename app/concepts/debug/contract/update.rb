module Debug::Contract
  class Update < Reform::Form
    property :col_string
    property :col_text
    property :col_boolean
    validates :col_string, presence: true, length: { maximum: 50 }
  end
end
