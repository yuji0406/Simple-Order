class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:top]
end