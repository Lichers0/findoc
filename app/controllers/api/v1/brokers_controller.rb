# frozen_string_literal: true

module Api
  module V1
    class BrokersController < BaseController
      def index
        respond_with ::BrokerSerializer.new(Counterparty.all)
      end
    end
  end
end
