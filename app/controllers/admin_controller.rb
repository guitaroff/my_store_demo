class AdminController < ApplicationController

  def users_count
    @users_count = User.count
    render layout: 'admin'
  end
end
