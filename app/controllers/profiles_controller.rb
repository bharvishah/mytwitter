class ProfilesController < ApplicationController
  def show
        @user = User.find_by name: params[:name]

  end
end
