
class Generate
  def initialize(object)
    @object = object
    @root = Dir.pwd
    
    @html = @root + "/_includes"
    @css = @root + "/assets/styles"
    @sg = @root + "/styleguide"
    
    generate
  end
  
  def generate
    puts "Generating #{@object} into:"
    puts " - #{@html}"
    puts " - #{@css}"
    puts " - #{@sg}"
    
    html
    css
    sg
  end
  
  def html
    puts system("echo '' > #{@html}/#{@object}.html")
  end
  
  def css
    mixin = "mixin a {}"
    puts system("echo '#{mixin}' > #{@css}/#{@object}.scss")
  end
  
  def sg
    yaml = "--- /n title: aaa /n ----"
    puts system("echo '#{yaml}' > #{@sg}/#{@object}.html")
  end
end