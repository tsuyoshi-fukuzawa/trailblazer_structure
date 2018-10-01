# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::Create, type: :feature do
  describe 'Operation Test' do
    before :each do
    end

    it '正常: Debugモデルの作成を行う' do
      params = ActionController::Parameters.new(
        debug: {
          col_string: 'a',
          col_text: 'b'
        }
      )
      result = Debug::Create.call(params)

      # Operationの実行結果
      expect(result.success?).to eq(true)

      # エラー文章
      errors = result['contract.default'].errors.full_messages
      expect(errors).to eq([])

      # モデル
      debug = result['model']
      expect(debug.col_string).to eq('a')
      expect(debug.col_text).to eq('b')

      # こちら側でもmodelにアクセスできる
      debug_alt = result['contract.default'].model
      expect(debug.col_string).to eq('a')
      expect(debug.col_text).to eq('b')
    end

    it 'rollbackテスト' do

      params = ActionController::Parameters.new(
        debug: {
          col_string: 'a',
          col_text: 'b'
        },
        raise: true
      )
      begin
        result = Debug::Create.call(params)
      rescue
      end
      # モデル
      expect(Debug.all.size).to eq(0)
    end

    it '異常: col_stringが必須パラメータ' do
      params = ActionController::Parameters.new(
        debug: {
          col_string: nil,
          col_text: 'b'
        }
      )
      result = Debug::Create.call(params)

      expect(result.success?).to eq(false)
      expect(result['contract.default'].errors.full_messages).to eq(['Col string can\'t be blank'])
      debug = result['model']
      expect(debug.col_string).to eq(nil)
      expect(debug.col_text).to eq(nil)
    end
  end
end
