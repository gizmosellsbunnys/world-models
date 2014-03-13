require 'find'

paths = []
entries = []
Find.find('.') do |path|
  paths << path unless FileTest.directory?(path)
end

paths.each do |path|
  if path.include? ".obj"
    lib = path[2..-1]
    entries << lib
  end
end

File.open("library.txt","w") do |f|
  f.write("A\n")
  f.write("800\n")
  f.write("LIBRARY\n\n")
  f.write("# World2XPlane Model Library\n\n")
  entries.each do |entry|
    f.write("EXPORT " << "world_models/" << entry << " objects/" << entry << "\n");
  end


end