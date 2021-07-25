# frozen_string_literal: true

class Api::V1::CompaniesController < Api::V1::BaseController
  def index
    respond_with ::CompanySerializer.new(Company.all)
  end
end
