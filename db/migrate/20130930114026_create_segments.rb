class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|

      t.timestamps
    end
  end
end
