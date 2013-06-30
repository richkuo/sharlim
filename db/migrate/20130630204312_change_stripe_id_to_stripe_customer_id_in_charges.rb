class ChangeStripeIdToStripeCustomerIdInCharges < ActiveRecord::Migration
  def change
    change_table :charges do |t|
      t.rename :stripe_id, :stripe_customer_id
    end
  end
end
