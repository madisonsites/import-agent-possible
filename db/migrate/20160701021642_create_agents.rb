class CreateAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :description
      t.string :image_url
      t.string :agent_mls
      t.string :phone_number
      t.string :country_code

      t.timestamps
    end
  end
end
