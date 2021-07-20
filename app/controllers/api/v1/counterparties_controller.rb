# frozen_string_literal: true

module Api
  module V1
    class CounterpartiesController < BaseController
      def index
        @counterparties = ::CounterpartySerialize.new(Counterparty.all)
        render json: @counterparties
      end
    end
  end
end
