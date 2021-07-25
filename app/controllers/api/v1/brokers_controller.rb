# frozen_string_literal: true

class Api::V1::BrokersController < Api::V1::BaseController
  def index
    respond_with ::BrokerSerializer.new(Counterparty.all)
  end
end
