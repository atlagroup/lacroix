class AddTypeToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :type, :string
  end
end
