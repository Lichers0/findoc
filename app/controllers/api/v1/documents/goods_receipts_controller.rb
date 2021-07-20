# frozen_string_literal: true

module Api
  module V1
    module Documents
      class GoodsReceiptsController < BaseController
        def new
          render json: ::Documents::GoodsReceiptSerializeNew.new
        end
      end
    end
  end
end
