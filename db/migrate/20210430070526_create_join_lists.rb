class CreateJoinLists < ActiveRecord::Migration[6.0]
  def change
    create_table :join_lists do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
