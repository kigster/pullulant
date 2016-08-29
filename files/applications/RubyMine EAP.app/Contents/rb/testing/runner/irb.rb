$LOAD_PATH << `pwd`.chomp + '/lib'
Dir.glob('lib/*.rb').map{|f| f.gsub(%{lib/}, '')}.each { |file| require file }

require "irb"
IRB.start(__FILE__)
