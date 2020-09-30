class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: {to_table: :users} 
      t.references :item, foreign_key: {to_table: :items} 
      t.timestamps
    end
  end
end
