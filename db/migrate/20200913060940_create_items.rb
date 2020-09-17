# class CreateItems < ActiveRecord::Migration[6.0]
#   def change
#     create_table :items do |t|
#       t.string :name,           null: false
#       t.integer :price,         null: false
#       # t.integer :status,        null: false
#       # t.integer :delivery_fee,  null: false
#       # t.integer :area,          null: false
#       # t.integer :day,           null: false

#       t.integer :category_id,       null: false
#       t.integer :status_id,         null: false
#       t.integer :prefecture_id,     null: false
#       t.integer :delivery_fee_id,   null: false
#       t.integer :day_id,            null: false
#       t.text    :info,              null: false
#       t.references :user, foreign_key: true
#       t.boolean :set
#       t.timestamps
#     end
#   end
# end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
     # t.integer :status,        null: false
      # t.integer :delivery_fee,  null: false
      # t.integer :area,          null: false
      # t.integer :day,           null: false

      t.integer :category_id
      t.integer :status_id
      t.integer :prefecture_id
      t.integer :delivery_fee_id
      t.integer :day_id
      t.text    :info
      t.references :user, foreign_key: true
      t.boolean :set
      t.timestamps
    end
  end
end