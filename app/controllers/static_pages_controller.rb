class StaticPagesController < ApplicationController
  def home
  	@id = params[:id]
  end
end
