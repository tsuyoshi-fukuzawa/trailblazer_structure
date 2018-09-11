# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debug::Cell, type: :cell do
  describe 'ViewModel List' do
    # showをテストする場合、Controllerを指定しないとhelperが使えずにエラーになる
    controller DebugController

    before :each do
      @debug = Debug.new(col_string: 1)
      @debug.save!
    end

    it 'ViewModel内のメソッドチェック' do
      result = concept('debug/cell/list', @debug).(:status).to_s
      expect(result.include?('有効')).to eq(true)
    end

    # it 'ViewModelのShow' do
    #   result = concept('debug/cell/list', @debug).(:show).to_s
    #   p result
    # end
  end
end
