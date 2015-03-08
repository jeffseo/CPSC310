class Vendor < ActiveRecord::Base
   #validates_uniqueness_of :key, message:
  def self.import(file)
    if validates_uniqueness_of :key
    allowed_attributes = [ "key", "vendor_type", "status", "business_name", "location", "description", "lat", "lon"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vendor = find_by_id(row["id"]) || new
      vendor.attributes = row.to_hash.select{ |k,v| allowed_attributes.include? k}
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
end
