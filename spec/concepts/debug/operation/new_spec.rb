# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::New, type: :feature do
  describe 'Operation 新規作成のフォームオブジェクト生成' do
    before :each do
    end

    it '正常: フォーム生成' do
      result = Debug::New.call
      expect(result.success?).to eq(true)
      expect(result['model'].col_string).to eq(nil)
    end
  end
end
