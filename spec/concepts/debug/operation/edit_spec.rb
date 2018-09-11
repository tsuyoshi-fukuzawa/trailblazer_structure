# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::Edit, type: :feature do
  describe 'Operation 編集のフォームオブジェクト生成' do
    before :each do
      @debug = Debug.new(col_string: 'a')
      @debug.save!
    end

    it '正常: フォーム生成' do
      params = ActionController::Parameters.new(
        id: @debug.id
      )
      result = Debug::Edit.call(params)
      expect(result.success?).to eq(true)
      expect(result['model'].col_string).to eq('a')
    end
  end
end
