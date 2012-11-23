class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.float :wat

      t.timestamps
    end
  end
end
