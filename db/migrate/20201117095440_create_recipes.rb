class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :cuisine,    null: false
      t.text       :description
      t.string     :foodstuff,  null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
