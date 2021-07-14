require_relative './danger_report_struct.rb'

class FlutterAnalyzeParser
  attr_accessor :report_path, :report

  def initialize(report_path)
    @report_path = report_path
  end

  def call
    if !report_path.nil? && File.exist?(report_path)
      @report = File.open(report_path)
      violations
    else
      fail("Could not run lint without setting report path or report file doesn't exists")
    end
  end

  private

  def violations
    filtered_input = filter_input(report)
    result = {warning: [], error: []}
    return result if filtered_input.detect { |element| element.include? "No issues found!" }

    result[:warning] = filtered_input
                          .select { |line| line.start_with?("info") || line.start_with?("warning") }
                          .map(&method(:parse_line))
    result[:error] = filtered_input
                       .select { |line| line.start_with? "error" }
                       .map(&method(:parse_line))
    result
  end

  def filter_input(input)
    input.each_line
      .map(&:strip)
      .reject(&:empty?)
  end

  def parse_line(line)
    _, description, file_with_line_number, rule = line.split(" • ")
    file, line = file_with_line_number.split(":")

    DangerReportStruct.new(description, file, line.to_i)
  end
end
