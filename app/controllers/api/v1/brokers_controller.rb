# frozen_string_literal: true

class Api::V1::BrokersController < ApiApplicationController
  def index
    respond_with ::BrokerSerializer.new(Counterparty.all)
  end
end
