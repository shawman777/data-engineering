require 'csv'

class Upload < ActiveRecord::Base
  attr_accessible :upload, :upload_detail
  has_attached_file :upload

  has_one :upload_detail

  after_save :import
  after_commit :update_revenue



  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "revenue" => self.upload_detail.gross_revenue,
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE"
    }
  end

  def import
    @data = []
    ctr = 0
    gross_revenue = 0.0

    CSV.foreach(upload.path, :col_sep => "\t") do |row|
      if ctr == 0
        puts "Header: #{row}"
        ctr += 1
        next
      end

      @data << row

      purchase = Purchase.new
      purchase.purchaser_name = row[0]
      purchase.item_description = row[1]
      purchase.item_price = row[2]
      purchase.purchase_count = row[3]
      purchase.merchant_address = row[4]
      purchase.merchant_name = row[5]
      purchase.save!

     gross_revenue += (row[2].to_f * row[3].to_i)


      puts "col 2:  #{row[2]}"

      ctr += 1
    end

    #self.gross_revenue = gross_revenue
    #self.save!
    detail = self.build_upload_detail
    detail.gross_revenue = gross_revenue
    detail.save!

    puts " #{ctr} rows "
    puts "Gross Revenue: $#{gross_revenue}"
  end

end
