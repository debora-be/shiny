class CreateSlugs < ActiveRecord::Migration[7.0]
  def change
    create_table :slugs do |t|
      t.string :slug

      t.timestamps
    end
  end
end
