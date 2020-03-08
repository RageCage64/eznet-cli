module RecordHelpers
  def self.clean_record(record : String) : Array(String)
	tokenized_record = record.split(" ")
	tokenized_record = tokenized_record.reject { |s| s == "" }
	tokenized_record
  end
end
