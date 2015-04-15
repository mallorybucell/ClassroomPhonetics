class FixExAudio < ActiveRecord::Migration
  def change
    rename_column :exercises, :forvo_id, :audio_id
  end
end
