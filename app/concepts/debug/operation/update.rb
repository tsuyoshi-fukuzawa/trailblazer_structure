class Debug::Update < Trailblazer::Operation
  # findして、Buildして、Validateで、モデルに変更が入る
  step Model(Debug, :find_by)
  step Contract::Build(constant: Debug::Contract::Update)
  step Contract::Validate(key: :debug)
  step Contract::Persist()

  # 例えば、validation用のOperationなど、save!を発行しない場合は、
  # step Contract::Persist( method: :sync )
  # を用いて、modelへの反映をする必要がある。
end
