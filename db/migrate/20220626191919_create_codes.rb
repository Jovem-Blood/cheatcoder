class CreateCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :codes do |t|
      t.text :description
      t.text :code_text

      t.timestamps
    end
  end
end
