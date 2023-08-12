class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.string :name, null: false
      t.integer :percentage
      t.string :start_at, null: false
      t.string :end_at, null: false

      t.timestamps
    end
  end
end
