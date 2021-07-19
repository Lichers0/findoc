# frozen_string_literal: true

class CreateCounterparties < ActiveRecord::Migration[6.1]
  def change
    create_table :counterparties do |t|
      t.string :name

      t.timestamps
    end
  end
end
