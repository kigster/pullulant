# encoding: utf-8
require 'readline'
require 'irb/completion'

begin
  require 'colored2'
rescue LoadError => e
  puts "Unable to load gem dependency: #{e.message}"
  puts "Installing them for you...."
  puts `gem install colored2`
  puts "Now run irb again, and you should be fine :)"
  exit 1
end

puts '—' * (ENV['COLUMNS'] || 80)

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

# irb history
IRB.conf[:EVAL_HISTORY]     = 1000
IRB.conf[:SAVE_HISTORY]     = 1000
#IRB.conf[:HISTORY_FILE]     = File::expand_path('~/.irbhistory')
IRB.conf[:IRB_NAME]         = ('I'.red << 'R'.yellow << 'B'.green).dark.bold
IRB.conf[:MATH_MODE]        = false
IRB.conf[:INSPECT_MODE]     = true
#IRB.conf[:IRB_RC]           = "#{ENV['HOME']}/.irbrc"
IRB.conf[:BACK_TRACE_LIMIT] = 16
IRB.conf[:USE_LOADER]       = false
IRB.conf[:USE_READLINE]     = true
IRB.conf[:USE_TRACER]       = false
IRB.conf[:IGNORE_SIGINT]    = false
IRB.conf[:IGNORE_EOF]       = true
IRB.conf[:DEBUG_LEVEL]      = 0


IRB.conf[:PROMPT][:PULLULANT] = {
  :PROMPT_I => "%N" + "(%m):%03n:%i> ".yellow,
  :PROMPT_S => "%N" + "(%m):%03n:%i%l ".red,
  :PROMPT_C => "%N" + "(%m):%03n:%i* ".blue,
  :RETURN => " ⤷ %s\n" # used to printf
}

Colored2.disable!

IRB.conf[:PROMPT_MODE]  = :PULLULANT

IRB.conf[:PROMPT][:PULLULANT_HUGE] = {
  :AUTO_INDENT => true,
  :PROMPT_I    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i   >".bold.green + ' '.clear,
  :PROMPT_S    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i>[%l]".bold.blue + ' '.clear,
  :PROMPT_C    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i*  >".green.italic + ' '.clear,
  :RETURN      => "%80s".yellow + "   ⬅︎ ┝━".blue.bold  + "━" * 50 + "\n"# used to printf
}
