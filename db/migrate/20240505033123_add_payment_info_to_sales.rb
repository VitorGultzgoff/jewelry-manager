# frozen_string_literal: true

class AddPaymentInfoToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :payment_method, :string
    add_column :sales, :payment_status, :string
    add_column :sales, :schedule_payment_date, :date
  end
end
