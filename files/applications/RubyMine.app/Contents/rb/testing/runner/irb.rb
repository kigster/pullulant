require "irb"
$LOAD_PATH << `pwd`.chomp + '/lib'
Dir.glob('lib/*.rb').map{|f| f.gsub(%{lib/}, '')}.each { |file| require file }
ENV['IRBTOOLS']='disabled'
IRB.start(__FILE__)
