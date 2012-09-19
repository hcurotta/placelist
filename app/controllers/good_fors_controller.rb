class GoodForsController < ApplicationController
  def index
    @good_for = GoodFor.where("what like ?", "#{params[:term]}")
    # @good_fors = GoodFor.all
    render json: @good_for.map(&:what)
  end
end
