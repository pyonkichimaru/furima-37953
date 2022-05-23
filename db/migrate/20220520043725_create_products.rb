class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string     :product_name,         null: false, default: ""
      t.text       :explanation,          null: false
      t.integer    :price,                null: false
      t.integer    :category_id,          null: false
      t.integer    :product_condition_id, null: false
      t.integer    :delivery_charge_id,   null: false
      t.integer    :area_id,              null: false
      t.integer    :send_day_id,          null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
