# frozen_string_literal: true

class Api::V1::CounterpartiesController < Api::V1::BaseController
  def index
    respond_with ::CounterpartySerializer.new(Counterparty.all)
  end
end
