# frozen_string_literal: true

module Reports
  class CompanyAssetsController < ApplicationController
    def show
      company_assets
    end

    private

    def company_assets
      @company_assets ||= Reports::CompanyAssets.new
    end
  end
end
