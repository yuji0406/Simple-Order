# frozen_string_literal: true

class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:top]
end
