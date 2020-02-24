class HomeController < ApplicationController
    def index
      @npos = Npo.page(params[:page])
    end
  end
  