class CreateSupplies < ActiveRecord::Migration
  def self.up
    create_table :supplies do |t|
      t.integer :product_id
      t.integer :quantity
      t.boolean :buy
      t.date :input_date
      t.timestamps
    end
  end

  def self.down
    drop_table :supplies
  end
end
