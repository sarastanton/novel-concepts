class CreateNamesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
    end
  end
end
