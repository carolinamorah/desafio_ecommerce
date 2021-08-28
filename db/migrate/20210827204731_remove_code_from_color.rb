class RemoveCodeFromColor < ActiveRecord::Migration[5.2]
  def change
    remove_column :colors, :code
  end
end
