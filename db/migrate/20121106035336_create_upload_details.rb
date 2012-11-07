class CreateUploadDetails < ActiveRecord::Migration
  def change
    create_table :upload_details do |t|
      t.integer  "upload_id"
      t.float    "gross_revenue"
      t.timestamps
    end
  end
end
