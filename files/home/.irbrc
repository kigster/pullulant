require 'colored2'
require 'rubygems'
require 'irb/completion'

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

# load .railsrc in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
  end
end

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

module Kernel
  def guid(s)
    s.scan(/[a-f0-9-]{36}/).first
  end
end


IRB.conf[:IRB_NAME]         = ('I'.red << 'R'.yellow << 'B'.green).dark.bold
IRB.conf[:MATH_MODE]        = false
IRB.conf[:INSPECT_MODE]     = false
IRB.conf[:IRB_RC]           = nil
IRB.conf[:BACK_TRACE_LIMIT] = 16
IRB.conf[:USE_LOADER]       = false
IRB.conf[:USE_READLINE]     = true
IRB.conf[:USE_TRACER]       = false
IRB.conf[:SAVE_HISTORY]     = 1000
IRB.conf[:IGNORE_SIGINT]    = true
IRB.conf[:IGNORE_EOF]       = false
IRB.conf[:DEBUG_LEVEL]      = 0


IRB.conf[:PROMPT][:KIG] = {
  :AUTO_INDENT => true,
  :PROMPT_I    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i   >".bold.green + ' '.clear,
  :PROMPT_S    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i>[%l]".bold.blue + ' '.clear,
  :PROMPT_C    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i*  >".green.italic + ' '.clear,
  :RETURN      => "%80s".yellow + "   ⬅︎ ┝━".blue.bold  + "━" * 50 + "\n"# used to printf
}

IRB.conf[:PROMPT][:DUDE] = {
  :PROMPT_I => "%N" + "(%m):%03n:%i> ".black.bold,
  :PROMPT_S => "%N" + "(%m):%03n:%i%l ".dark,
  :PROMPT_C => "%N" + "(%m):%03n:%i* ".dark,
  :RETURN => " ⤷ %s\n" # used to printf
}

IRB.conf[:PROMPT_MODE]  = :DUDE


