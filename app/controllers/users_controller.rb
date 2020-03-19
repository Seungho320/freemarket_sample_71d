class UsersController < ApplicationController
  befor_action :authenticate_user!
  def index
  end

  def show
  end

end
