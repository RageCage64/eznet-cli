require "../modules/record_helpers"

class LtnpRecord
  def initialize(record : String)
	@str_arr = RecordHelpers.clean_record(record)
	
  end
end
