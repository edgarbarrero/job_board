class CreateCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :candidatures do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :state

      t.timestamps
    end
  end
end
