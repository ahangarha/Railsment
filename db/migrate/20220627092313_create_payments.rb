class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :author_id, foreign_key: { to_table: :users }, null: false
      t.string :name, null: false
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
