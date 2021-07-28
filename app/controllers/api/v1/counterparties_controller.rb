# frozen_string_literal: true

class Api::V1::CounterpartiesController < ApiApplicationController
  def index
    respond_with ::CounterpartySerializer.new(Counterparty.all)
  end
end
