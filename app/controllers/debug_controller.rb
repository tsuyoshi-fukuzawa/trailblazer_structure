class DebugController < ApplicationController

  def all
    @debug = Debug.new(col_string: 1, col_text: 2)
    p @debug
    return render json: DebugRepresenter.new(@debug).to_json
  end
end
