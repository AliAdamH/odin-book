class DropProfiles < ActiveRecord::Migration[6.1]
  def up
    drop_table :profiles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
