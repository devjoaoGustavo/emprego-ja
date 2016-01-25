class AddColumnsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :description, :text
    add_column :jobs, :category, :string
  end
end
