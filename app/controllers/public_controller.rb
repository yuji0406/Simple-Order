# frozen_string_literal: true

class PublicController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
end
