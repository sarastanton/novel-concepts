class CreatePlotTable < ActiveRecord::Migration[5.2]
  def change
    create_table :plots do |t|
      t.string :noun
      t.string :verb
      t.string :setting
    end
  end
end
