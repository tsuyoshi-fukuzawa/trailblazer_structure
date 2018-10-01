class Debug::Create < Trailblazer::Operation

  # option["model"]を生成する
  step Model(Debug, :new)

  # formオブジェクトの生成
  step Contract::Build(constant: Debug::Contract::Create)

  # keyでモデル名を明示する。params = { debug: { col_string: 'a', col_text: 'b' }}
  # Validateで同時にパラメータがセットされる
  step Contract::Validate(key: :debug)
  # Validateが通らなかった場合は、ここまで通過せず、Controllerにエラーで戻る

  # # 独自メソッドを実行する場合
  step :some_method

  step Wrap( MyTransaction ) {
    # Saveを発行する
    step Contract::Persist()
    step :rollback_check
  }

  def some_method(options)
    # メソッド内でnil or falseを返すと、Controllerにエラーで戻せる
    if options["model"].present?
      true
    else
      false
    end
  end

  def rollback_check(options, params:, **)
    if params[:raise].present?
      raise
    else
      true
    end
  end

end
