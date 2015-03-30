class AddForvoTable < ActiveRecord::Migration
  def change
    create_table :forvos do |t|
      t.integer :forvo_id
      t.string  :word
      t.string  :lang_code
      t.string  :speaker_gender
      t.text    :forvo_data
    end
  end
end
