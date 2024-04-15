class Admin::Orders::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
end
