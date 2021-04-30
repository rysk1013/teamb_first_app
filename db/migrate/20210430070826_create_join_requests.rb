class CreateJoinRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :join_requests do |t|

      t.timestamps
    end
  end
end
