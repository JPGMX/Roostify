class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.float :annual_income
      t.float :tax

      t.timestamps
    end
  end
end
