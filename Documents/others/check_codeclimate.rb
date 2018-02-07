#!/bin/ruby
require 'optparse'
require 'pry'
@options = {}

def assign_options
  engine= @options[:engines].map do |eng|
    " -e #{eng}"
  end.join || ""

  file= @options[:filter] || 'rb'

  execute(engine, file)
end

# for now. only support 2 file format
def test_command(file_extension)
  command = 'bundle exec rspec'
  pattern = '_spec.rb'
  if file_extension == 'go'
    command = 'go test'
    pattern = '_test.go'
  end
  ignored = Regexp.new(pattern)
  return [command, ignored]
end

# set default to rspec test
def test_script(files, file_extension)
  command, filter = test_command(file_extension)
  test_files = files.select! do |file|
    filter.match(file)
  end.join(' ')

  return "echo no test file(s) found" if files.empty?

  puts "testing #{files.join("\n")}"

  "#{command} #{test_files}"
end

def validate_file(file)
  File.exist?(file)
end

def execute(engine, file)
  ignored = Regexp.new(/db\/+/)
  cmd="git log --no-merges --name-only --first-parent --oneline --pretty='format:' -p master..HEAD | grep #{file}"
  #cmd="git diff --name-only master..HEAD | grep #{file}"
  git_files=IO.popen(cmd).read.split("\n").uniq
  puts git_files
  analyzed_files = git_files.join(' ')
  #analyzed_files = git_files&.select! { |file| !ignored.match(file) && validate_file(file) }.join(' ')
  #analyzed_files = git_files.select { |file| validate_file(file) }.join(' ')

  puts "checking #{analyzed_files}"
  additional_cmd = @options[:test] ? " && #{test_script(git_files, file)}" : ''
  script = "codeclimate analyze #{analyzed_files}#{engine}#{additional_cmd}"
  puts "executing #{script}"
  exec("codeclimate analyze #{analyzed_files}#{engine}#{additional_cmd}")
end

OptionParser.new do |opt|
  opt.banner = 'This script will analyze your changed code using codeclimate'

  opt.on('--engine x,y,z', Array, 'provide engine for analyzing') do |list|
    @options[:engines] = list
  end

  opt.on('-f', '--filter filter', 'file extension for analyzing') do |filter|
    @options[:filter] = filter
  end

  opt.on('-t', '--test', 'run unit test based on file filter') do |test|
    @options[:test] = test
  end
end.parse!

if @options[:engines].nil?
  p 'please specify engine. type -h to show available command'
else
  assign_options
end

