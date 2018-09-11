class IndexController < ApplicationController
  def index
    redirect_to debug_index_path
  end
end
