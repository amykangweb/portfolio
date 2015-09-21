class WelcomeController < ApplicationController
  def index
    @projects = Project.all
  end
end
