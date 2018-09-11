# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::Update, type: :feature do
  describe 'Operation Update' do
    before :each do
      @debug = Debug.new(col_string: 'a')
      @debug.save!
    end

    it '正常: Debugモデルの作成を行う' do
      params = ActionController::Parameters.new(
        id: @debug.id,
        debug: {
          col_string: 'c',
          col_text: 'b'
        }
      )
      result = Debug::Update.call(params)

      # Operationの実行結果
      expect(result.success?).to eq(true)

      # エラー文章
      errors = result['contract.default'].errors.full_messages
      expect(errors).to eq([])

      # モデル
      debug = result['model']
      expect(debug.col_string).to eq('c')
      expect(debug.col_text).to eq('b')
      expect(Debug.all.size).to eq(1)
    end

    it '異常: col_stringが必須パラメータ' do
      params = ActionController::Parameters.new(
        id: @debug.id,
        debug: {
          col_string: nil,
          col_text: 'b'
        }
      )
      result = Debug::Update.call(params)

      expect(result.success?).to eq(false)
      expect(result['contract.default'].errors.full_messages).to eq(['Col string can\'t be blank'])
    end
  end
end
