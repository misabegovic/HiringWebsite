class PublicPagesController < ApplicationController
  def index
    @companies = Company.last(50)
  end
end