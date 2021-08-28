class RemoveCodeFromSize < ActiveRecord::Migration[5.2]
  def change
    remove_column :sizes, :code
  end
end
