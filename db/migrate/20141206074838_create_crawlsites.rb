class CreateCrawlsites < ActiveRecord::Migration
  def change
    create_table :crawlsites do |t|
      t.text :thumb
      t.string :title
      t.text :uri
      t.text :embed
      t.string :time
      t.string :sitename

      t.timestamps
    end
  end
end
