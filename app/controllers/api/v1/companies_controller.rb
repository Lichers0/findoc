# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < BaseController
      def index
        @companies = ::CompanySerialize.new(Company.all)
        render json: @companies
      end
    end
  end
end
