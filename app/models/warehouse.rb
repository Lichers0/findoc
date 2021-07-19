# frozen_string_literal: true

# == Schema Information
#
# Table name: warehouses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Warehouse < ApplicationRecord
  has_many :goods_receipts, dependent: :destroy
end
