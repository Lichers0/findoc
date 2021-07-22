# frozen_string_literal: true

module Api
  module V1
    class WarehousesController < BaseController
      def index
        respond_with ::WarehouseSerializer.new(Warehouse.all)
      end
    end
  end
end
