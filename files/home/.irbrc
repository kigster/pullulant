# encoding: utf-8

require 'readline'
require 'irb/completion'
require 'irb/ext/save-history'
require 'colored2'

gems = %w[awesome_print]
gems += %w[irbtools] if ENV.keys.grep(/RUBYMINE/).empty?

installed = false
gems.each do |gem|
  begin
    require gem
  rescue LoadError => e
    puts "Attempting to install #{gem.bold.yellow}...\n"
    puts "  > gem install #{gem} --no-doc\n".bold.green
    puts `gem install #{gem} --no-doc`
    installed = true
  end
end

exec(ARGV.join(' ')) if installed

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
IRB.conf[:HISTORY_FILE]     = "#{ENV['HOME']}/.history.irb.#{RUBY_VERSION}"
IRB.conf[:IRB_NAME]         = ('I'.red << 'R'.yellow << 'B'.green).dark.bold
IRB.conf[:MATH_MODE]        = false
IRB.conf[:INSPECT_MODE]     = false
IRB.conf[:BACK_TRACE_LIMIT] = 16
IRB.conf[:USE_LOADER]       = false
IRB.conf[:USE_READLINE]     = true
IRB.conf[:USE_TRACER]       = false
IRB.conf[:IGNORE_SIGINT]    = true
IRB.conf[:IGNORE_EOF]       = false
IRB.conf[:DEBUG_LEVEL]      = 0

IRB.conf[:PROMPT][:PULLULANT] = {
  :PROMPT_I => "%N" + "(%m):%03n:%i> ".yellow,
  :PROMPT_S => "%N" + "(%m):%03n:%i%l ".red,
  :PROMPT_C => "%N" + "(%m):%03n:%i* ".blue,
  :RETURN => " ⤷ %s\n" # used to printf
}


IRB.conf[:PROMPT_MODE]  = :PULLULANT

#IRB.conf[:PROMPT][:PULLULANT_HUGE] = {
#  :AUTO_INDENT => true,
#  :PROMPT_I    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i   >".bold.green + ' '.clear,
#  :PROMPT_S    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i>[%l]".bold.blue + ' '.clear,
#  :PROMPT_C    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i*  >".green.italic + ' '.clear,
#  :RETURN      => "%80s".yellow + "   ⬅︎ ┝━".blue.bold  + "━" * 50 + "\n"# used to printf
#}

