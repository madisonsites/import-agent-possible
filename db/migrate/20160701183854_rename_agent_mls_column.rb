class RenameAgentMlsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :agents, :agent_mls, :mls
  end
end
