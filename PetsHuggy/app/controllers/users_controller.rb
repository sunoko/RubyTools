class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @kanji = "Chozetu Kanji"
  end
end
