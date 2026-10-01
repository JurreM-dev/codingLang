require "colorize"
class ErrorLogger
  def initialize
    @error_count = 0
    @error_messages = [] of String
  end

  def add_error(error_message : String) 
    @error_messages.push(error_message)
    @error_count += 1
  end

  def error_log
    if @error_count > 0
      puts "================ ERRORS =================="
      @error_messages.each do |error|
        puts error .colorize(:red)
      end
      puts "=========================================="
    end
  end

  def fatalErr(error : String)
    add_error(error)
    error_log
    exit(1)
  end
end