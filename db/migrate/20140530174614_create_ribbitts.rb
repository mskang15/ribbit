class CreateRibbitts < ActiveRecord::Migration
  def change
    create_table :ribbitts do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
