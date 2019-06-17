class DebugRepresenter < Representable::Decorator
  include Representable::JSON
  property :col_string
  # property :col_text
end