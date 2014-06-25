class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :bookName
      t.string :auther
      t.string :subject
      t.string :noofcopy

      t.timestamps
    end
  end
end
