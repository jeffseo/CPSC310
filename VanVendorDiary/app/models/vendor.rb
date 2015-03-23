class Vendor < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :key, presence: true, uniqueness: true
  def self.import(file)
    allowed_attributes = [ "key", "vendor_type", "status", "business_name", "location", "description", "lat", "lon"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vendor = find_by_id(row["id"]) || new
      vendor.attributes = row.to_hash.select{ |k,v| allowed_attributes.include? k}
      if(vendor.valid?)
        vendor.save!
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.search(query)
    where("description like ? OR business_name like ? or status like ? or location like ?","%#{query}%","%#{query}%", "%#{query}%","%#{query}%")
  end

end
