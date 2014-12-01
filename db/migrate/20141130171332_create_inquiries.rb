class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :mail
      t.text :message

      t.timestamps
    end
  end
end
