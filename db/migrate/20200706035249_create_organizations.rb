class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :organizations, :slug, unique: true
  end
end
