class CreateDebugs < ActiveRecord::Migration[5.2]
  def change
    create_table :debugs do |t|
      t.string     :col_string
      t.text       :col_text
      t.boolean    :col_boolean
      t.datetime   :col_datetime
      t.timestamps
    end
  end
end
