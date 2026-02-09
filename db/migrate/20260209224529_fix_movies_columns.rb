class FixMoviesColumns < ActiveRecord::Migration[8.1]
  def up
    remove_column :movies, :r, :string if column_exists?(:movies, :r)
    add_column :movies, :rated, :string unless column_exists?(:movies, :rated)
    add_column :movies, :studio_id, :integer unless column_exists?(:movies, :studio_id)
  end

  def down
    # Roll back safely even if the DB never had a foreign key constraint
    remove_column :movies, :studio_id, :integer if column_exists?(:movies, :studio_id)
    remove_column :movies, :rated, :string if column_exists?(:movies, :rated)
    add_column :movies, :r, :string unless column_exists?(:movies, :r)
  end
end
