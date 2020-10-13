class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.column(:name, :string)
      t.column(:coordinator_id, :integer)
      t.column(:email, :string)
      t.column(:phone, :string)

      t.timestamps
    end
  end
end
