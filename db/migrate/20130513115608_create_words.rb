class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.timestamps
    end
    add_column :words, :anagram_string, :string
    add_index  :words, :anagram_string
  end
end
