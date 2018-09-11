# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::Index, type: :feature do
  describe 'Operation Index' do
    before :each do
      @debug1 = Debug.new(col_string: 1)
      @debug1.save!
      @debug2 = Debug.new(col_string: 2)
      @debug2.save!
    end

    it '正常: Indexで必要なモデルを取得する' do
      result = Debug::Index.call
      expect(result.success?).to eq(true)
      expect(result['model'].size).to eq(2)
    end
  end
end
