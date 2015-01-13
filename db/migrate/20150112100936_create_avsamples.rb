class CreateAvsamples < ActiveRecord::Migration
  def change
    create_table :avsamples do |t|
      t.string :title
      t.text :content
      t.text :affi_title
      t.text :affi_link
      t.string :actress_name
      t.text :sumnail
      t.string :image
      t.timestamps
    end
  end
end
