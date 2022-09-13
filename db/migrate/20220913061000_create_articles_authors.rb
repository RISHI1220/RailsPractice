class CreateArticlesAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_authors do |t|
      t.references :author, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
