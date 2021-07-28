# frozen_string_literal: true

class Api::V1::CompaniesController < ApiApplicationController
  def index
    respond_with ::CompanySerializer.new(Company.all)
  end
end
