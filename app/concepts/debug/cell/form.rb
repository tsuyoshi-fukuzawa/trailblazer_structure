module Debug::Cell
  class Form < Trailblazer::Cell
    # renderするメソッド名は一律show
    def show
      # class名のviewが表示される。つまりform.slim
      render
    end
  end
end
