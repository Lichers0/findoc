# frozen_string_literal: true

module Api
  module V1
    class WarehousesController < BaseController
      def index
        @warehouse = ::WarehouseSerialize.new(Warehouse.all)
        render json: @warehouse
      end
    end
  end
end
