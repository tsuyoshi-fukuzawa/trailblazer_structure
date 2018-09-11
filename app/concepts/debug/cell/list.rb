module Debug::Cell
  class List < Trailblazer::Cell
    def show
      render
    end

    def status
      # modelは「model」でアクセスできる
      if model.col_string.present?
        '有効'
      else
        '無効'
      end
    end
  end
end
