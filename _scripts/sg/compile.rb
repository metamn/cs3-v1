require 'filewatcher'

class Compile
  def initialize(file)
    @root = Dir.pwd
    @destination = '_site/assets/styles'
    @extension = file + '.liquid'
    
    do_compile
  end
  
  def do_compile
    # Do watch
    puts "Watching #{@extension} files in #{@destination}"
    compile = true

    FileWatcher.new(["#{@destination}/*#{@extension}", "#{@destination}/**/#{@extension}"]).watch do |filename|
      puts "Compile: " + compile.to_s

      if compile 
        # filename: ./_site/assets/styles/atoms/test.liquid
        puts "Updated " + filename

        # replace ./_site with absolute path
        absolute = filename.sub "./", "#{@root}/"
        #puts "Absolute " + absolute

        # replace .liquid with .scss
        scss = absolute.sub ".liquid", ".scss"

        # remove _site
        scss = scss.sub "_site/", ""
        #puts "Subs " + scss

        # copy .liquid to .liquid.scss
        system("sudo cp -f #{absolute} #{scss}");

        # tell this script do not enter in an endless loop
        compile = false
      else
        compile = true
      end
    end
  end
end
