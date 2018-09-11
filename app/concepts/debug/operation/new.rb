class Debug::New < Trailblazer::Operation
  step Model(Debug, :new)
  step Contract::Build(constant: Debug::Contract::Create)
end
