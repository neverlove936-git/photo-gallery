class DangerReportStruct
  attr_accessor :description, :file, :line

  def initialize(description, file = nil, line = nil)
    @description = description
    @file        = file
    @line        = line
  end
end
