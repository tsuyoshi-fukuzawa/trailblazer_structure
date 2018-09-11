class Debug::Destroy < Trailblazer::Operation
  step Model(Debug, :find_by)
  step :delete!
  def delete!(options)
    options['model'].destroy
  end
end
