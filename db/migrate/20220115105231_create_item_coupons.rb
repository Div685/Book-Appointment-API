class CreateItemCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :item_coupons do |t|
      t.references :item, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
