class Debug::Edit < Trailblazer::Operation
  # Modelをparams[:id]をベースに取得する
  step Model(Debug, :find_by)

  # formオブジェクトを生成して、さらにModelから値をセットする
  step Contract::Build(constant: Debug::Contract::Update)
end
