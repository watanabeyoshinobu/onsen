class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def mypage
  end

end
