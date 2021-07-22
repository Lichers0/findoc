# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < BaseController
      def index
        respond_with ::CompanySerializer.new(Company.all)
      end
    end
  end
end
