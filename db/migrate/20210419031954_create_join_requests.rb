class CreateJoinRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :join_requests do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
