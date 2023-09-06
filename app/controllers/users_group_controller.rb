class UsersGroupController < ApplicationController
  before_action :authenticate_user!
  layout 'users_group'  
end
