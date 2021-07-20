# frozen_string_literal: true

module Api
  module V1
    class BrokersController < BaseController
      def index
        @broker = ::BrokerSerialize.new(Counterparty.all)
        render json: @broker
      end
    end
  end
end
