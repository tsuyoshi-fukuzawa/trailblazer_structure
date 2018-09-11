class Debug::Update < Trailblazer::Operation
  # findして、Buildして、Validateで、モデルに変更が入る
  step Model(Debug, :find_by)
  step Contract::Build(constant: Debug::Contract::Update)
  step Contract::Validate(key: :debug)
  step Contract::Persist()
end
