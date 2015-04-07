class RenameForvosTable < ActiveRecord::Migration
  def change
    rename_table  :forvos,  :audios
    rename_column :audios,  :forvo_id,      :source_id
    add_column    :audios,  :audio_source,  :string
  end
end
