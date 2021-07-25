# frozen_string_literal: true

class Api::V1::WarehousesController < Api::V1::BaseController
  def index
    respond_with ::WarehouseSerializer.new(Warehouse.all)
  end
end
