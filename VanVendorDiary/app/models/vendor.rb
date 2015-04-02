class Vendor < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :history_entries

  validates :key, presence: true, uniqueness: true
  def self.import(file)
    allowed_attributes = [ "key", "vendor_type", "status", "business_name", "location", "description", "lat", "lon"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vendor = find_by_id(row["id"]) || new
      vendor.attributes = row.to_hash.select{ |k,v| allowed_attributes.include? k}
      vendor.business_name = vendor.business_name? ? vendor.business_name : "Unknown vendor"
      vendor.vendor_type = vendor.vendor_type? ? vendor.vendor_type : "Not specified"
      vendor.status = vendor.status? ? vendor.status : "Not specified"
      vendor.location = vendor.location? ? vendor.location : "Not specified"
      vendor.description = vendor.description? ? vendor.description : "Not specified"
      if(vendor.valid?)
        vendor.save!
      end
    end
  end

  def self.autoimport
    url = 'http://c.albert-thompson.com/assets/files/new_food_vendor_locations.xls'
    spreadsheet = Roo::Spreadsheet.open(url)
    allowed_attributes = [ "key", "vendor_type", "status", "business_name", "location", "description", "lat", "lon"]
    #spreadsheet = open_spreadsheet(url)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vendor = find_by_id(row["id"]) || new
      vendor.attributes = row.to_hash.select{ |k,v| allowed_attributes.include? k}
      vendor.business_name = vendor.business_name? ? vendor.business_name : "Unknown vendor"
      vendor.vendor_type = vendor.vendor_type? ? vendor.vendor_type : "Not specified"
      vendor.status = vendor.status? ? vendor.status : "Not specified"
      vendor.location = vendor.location? ? vendor.location : "Not specified"
      vendor.description = vendor.description? ? vendor.description : "Not specified"
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
    where("description ilike ? OR business_name ilike ? or status ilike ? or location ilike ?","%#{query}%","%#{query}%", "%#{query}%","%#{query}%")
  end

end
