class AddNameToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :name, :string
  end
end
