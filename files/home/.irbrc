# encoding: utf-8

require 'rubygems'
require 'irb/completion'

railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
  end
end

begin
  require 'colored2' 
rescue LoadError
end

unless defined?(Colored2)
  class String
    def noop
      self
    end
    %i(clear dark black yellow red blue green bold italic cyan on).each do |m|
      alias_method m, :noop;
    end
  end
end

class GemLoader
  TRIES = 2

  attr_accessor :gem_name
  def initialize(gem_name)
    self.gem_name = gem_name
  end
  def load &block
    begin
      tries ||= TRIES
      printf 'Loading '.bold.blue 
      printf '%12.12s...'.bold.yellow, gem_name
      require gem_name
      printf "OK\n".bold.green
    rescue Exception
      if tries == TRIES
        printf "MISSING\n".bold.red
        printf 'Installing '.bold
        printf '%9.9s...'.bold.yellow, gem_name
        %x(gem install #{gem_name})
        printf "HIFIVE!\n".bold.green
        Gem.clear_paths
        tries -= 1
        retry        
      end
    end
  end
end

%w(colored2 irbtools).each { |gem_name| GemLoader.new(gem_name).load } 

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
IRB.conf[:HISTORY_FILE]     = File::expand_path('~/.irbhistory')
IRB.conf[:IRB_NAME]         = ('I'.red << 'R'.yellow << 'B'.green).dark.bold
IRB.conf[:MATH_MODE]        = false
IRB.conf[:INSPECT_MODE]     = false
IRB.conf[:IRB_RC]           = nil
IRB.conf[:BACK_TRACE_LIMIT] = 16
IRB.conf[:USE_LOADER]       = false
IRB.conf[:USE_READLINE]     = true
IRB.conf[:USE_TRACER]       = false
IRB.conf[:IGNORE_SIGINT]    = true
IRB.conf[:IGNORE_EOF]       = false
IRB.conf[:DEBUG_LEVEL]      = 0


IRB.conf[:PROMPT][:PULLULANT] = {
  :PROMPT_I => "%N" + "(%m):%03n:%i> ".blue.bold,
  :PROMPT_S => "%N" + "(%m):%03n:%i%l ".blue.dark,
  :PROMPT_C => "%N" + "(%m):%03n:%i* ".blue.dark,
  :RETURN => " ⤷ %s\n" # used to printf
}

IRB.conf[:PROMPT_MODE]  = :PULLULANT

IRB.conf[:PROMPT][:PULLULANT_HUGE] = {
  :AUTO_INDENT => true,
  :PROMPT_I    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i   >".bold.green + ' '.clear,
  :PROMPT_S    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i>[%l]".bold.blue + ' '.clear,
  :PROMPT_C    => "%N" + " (%m) ".blue + " [:%03n] ".cyan.on.black + ":%i*  >".green.italic + ' '.clear,
  :RETURN      => "%80s".yellow + "   ⬅︎ ┝━".blue.bold  + "━" * 50 + "\n"# used to printf
}
