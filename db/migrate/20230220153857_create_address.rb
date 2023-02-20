class CreateAddress < ActiveRecord::Migration[6.1]
  def change
    create_table :address do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
       
      t.timestamps
    end
  end
end
