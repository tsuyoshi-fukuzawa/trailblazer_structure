class Debug::Index < Trailblazer::Operation

  # model!という名前である必要はないが、model!の事例があったため、この名前としている
  step :model!
  def model!(options)
    options['model'] = Debug.all
  end
end
