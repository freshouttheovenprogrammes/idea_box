class AddAutoincrementIdValueToCategories < ActiveRecord::Migration[5.1]
  def change
    execute("SELECT setval('categories_id_seq', 99)")
  end
end
