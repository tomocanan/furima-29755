class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.integer :area,    null:false
      t.string :city,     null:false
      t.string :address1, null: false
      t.string :address2
      t.string :tell,     null: false
      t.string :postal,   null:false
      t.references :order
      t.timestamps
    end
  end
end
