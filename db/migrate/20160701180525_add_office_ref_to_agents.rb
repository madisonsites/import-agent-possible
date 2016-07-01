class AddOfficeRefToAgents < ActiveRecord::Migration[5.0]
  def change
    add_reference :agents, :office, foreign_key: true
  end
end
