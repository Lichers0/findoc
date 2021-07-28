# frozen_string_literal: true

class Api::V1::WarehousesController < ApiApplicationController
  def index
    respond_with ::WarehouseSerializer.new(Warehouse.all)
  end
end
