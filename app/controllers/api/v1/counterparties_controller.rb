# frozen_string_literal: true

module Api
  module V1
    class CounterpartiesController < BaseController
      def index
        respond_with ::CounterpartySerializer.new(Counterparty.all)
      end
    end
  end
end
