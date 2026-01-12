class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end
end
