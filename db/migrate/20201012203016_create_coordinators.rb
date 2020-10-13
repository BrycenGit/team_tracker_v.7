class CreateCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinators do |t|
      t.column(:name, :string)
      t.column(:team_id, :integer)
      t.column(:phone, :string)
      t.column(:email, :string)

      t.timestamps
    end
  end
end
