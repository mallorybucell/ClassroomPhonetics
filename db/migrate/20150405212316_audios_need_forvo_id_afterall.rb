class AudiosNeedForvoIdAfterall < ActiveRecord::Migration
  def change
    rename_column :audios, :source_id,  :forvo_id
  end
end
