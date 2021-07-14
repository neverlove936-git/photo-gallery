require_relative './danger/pull_request_overview.rb'
require_relative './danger/flutter_analyze_parse.rb'

warns = []
errors = []

analyze_parse = FlutterAnalyzeParser.new('flutter_analyze_report.txt')
analyze_parse_result = analyze_parse.call

warns.concat(analyze_parse_result[:warning])
errors.concat(analyze_parse_result[:error])

pr_overview = PullRequestOverview.new(github)
warns.concat(pr_overview.call)

warns.each {|w| warn(w.description, file: w.file, line: w.line)}
errors.each {|e| fail(e.description, file: e.file, line: e.line)}
