class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.float :watt

      t.timestamps
    end
  end
end
