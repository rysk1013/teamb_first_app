class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name,           null: false
      t.text :intro,            null: false
      t.text :content,          null: false
      t.integer :project_lim,   null: false
      t.integer :member_lim,    null: false
      t.timestamps
    end
  end
end
