class HomeController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def results
    eigen_vector = params["eigenVector"]
    city_initials = params["cityInitials"]
    results = AhpCalculator.sort_decisions(city_initials, eigen_vector)

    render json: results.collect(&:first)
  end
end
