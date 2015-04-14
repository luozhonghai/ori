class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      t.string :task

      t.timestamps
    end
    create_sequence_for :test_models
  end
end
