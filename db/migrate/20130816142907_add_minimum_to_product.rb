class AddMinimumToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :minimum, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :products, :minimum
  end
end
