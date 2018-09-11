# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::Destroy, type: :feature do
  describe 'Operation 削除' do
    before :each do
      @debug = Debug.new(col_string: 1)
      @debug.save!
    end

    it '正常: 削除を行う' do
      params = ActionController::Parameters.new(
        id: @debug.id
      )
      result = Debug::Destroy.call(params)
      expect(result.success?).to eq(true)
      expect(Debug.all.size).to eq(0)
    end
  end
end
