class CreateMyMailers < ActiveRecord::Migration
  def change
    create_table :my_mailers do |t|
      t.datetime :schedule_time, :null => false
      t.string :email
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
