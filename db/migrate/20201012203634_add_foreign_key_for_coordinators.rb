class AddForeignKeyForCoordinators < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :coordinators, :teams
  end
end
