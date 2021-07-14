require_relative './danger_report_struct.rb'

class PullRequestOverview
  attr_accessor :template, :pr_body, :need_check_titles, :titles, :warns, :github

  def initialize(github)
    @github   = github
    @template = get_pr_template
    @pr_body  = get_pr_body
    @titles   = []
    @warns    = []
    @need_check_titles = []
  end

  def call
    get_titles
    @warns << check_changed_template
    @warns.concat check_pr_body
    @warns.compact
  end

  def get_pr_template
    template_file = File.open('./.github/pull_request_template.md')
    template_file.readlines.map(&:chomp) - ['']
  end

  def get_pr_body
    @github.pr_body.gsub(/\r\n/, '\n').split('\n') - ['']
  end

  def get_titles
    template.each_with_index do |title, index|
      @titles << title if title.include?('###')
      @need_check_titles << template[index - 1] if title.include?('required')
    end
  end

  def check_changed_template
    titles_index = titles.map do |title|
      @pr_body.find_index(title)
    end

    if titles_index.any?(nil)
      description = 'The PR body is different with template, please update `Dangerfile`'
      DangerReportStruct.new(description)
    end
  end

  def check_pr_body
    group_by_title = {}
    title = ''
    @pr_body.each do |content|
      if @titles.include?(content)
        group_by_title[content] = []
        title = content
      else
        group_by_title[title] << content unless group_by_title[title].nil?
      end
    end
    group_by_title.delete_if {|k,v| !need_check_titles.include?(k)}

    warns = []
    group_by_title.each do |k,v|
      content = v - template
      if content.empty?
        description = "You need to fill `#{k.gsub(/(#)+/,'').strip}`"
        warns << DangerReportStruct.new(description)
      end
    end
    warns
  end
end
