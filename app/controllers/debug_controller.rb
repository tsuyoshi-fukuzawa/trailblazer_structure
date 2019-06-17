class DebugController < ApplicationController

  def all
    @debug = Debug.all.first
    p @debugs
    return render json: DebugRepresenter.new(@debug).to_json
  end

  def index
    # Debug::IndexのOperationの中でmodelをセットする。
    # result["model"]でも、@modelでもこの値は利用できる。
    run Debug::Index
    # p result["model"]
    # p @model
  end

  def new
    run Debug::New
    # @formが使えるようになる
    # @formは、trailblazer v2からはrunで取得する。v1はformで取得していた。
    # result = Debug::Newとやっても@formは生成されず、runしたときのみ生成される。
    # p @form
  end

  def create
    run Debug::Create do |_result|
      # 成功した場合の処理
      # resultを引数で受けることができる
      return redirect_to debug_index_path, notice: '作成しました'
    end
    # 失敗した場合
    # 自動的に、resultと@formが変数でセットされている。
    # そのため、@form.errors.full_messagesに値が格納されている状態
    render :new

    # result = Debug::Create.callでブロック構文でなくとも書けるが、
    # この書き方だと、@formがセットされず、viewのformでfield_with_errorsがセットされないのでうまくいかない
  end

  def edit
    run Debug::Edit
  end

  def update
    run Debug::Update do |_result|
      return redirect_to debug_index_path, notice: '保存しました'
    end
    render :edit
  end

  def destroy
    run Debug::Destroy do |_result|
      return redirect_to debug_index_path, notice: '削除しました'
    end
    redirect_to debug_index_path, alert: '削除できませんでした'
  end
end
