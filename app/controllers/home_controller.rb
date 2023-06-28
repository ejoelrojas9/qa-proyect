class HomeController < ApplicationController
  def index
    @managers = Manager.all
  end
end
