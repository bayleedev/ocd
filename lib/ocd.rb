path = "#{File.dirname(__FILE__)}/ocd/**/*.rb"
files = Dir.glob(path)
files.each do |file|
  require file
end