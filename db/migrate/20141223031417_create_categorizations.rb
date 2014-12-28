class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :article, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
