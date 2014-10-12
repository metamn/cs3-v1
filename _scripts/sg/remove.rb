
class Remove
  def initialize(object)
    @object = object
    @root = Dir.pwd
    
    @html = @root + "/_includes"
    @css = @root + "/assets/styles"
    @sg = @root + "/styleguide"
    
    remove
  end
  
  def remove
    puts "Removing #{@object} into:"
    puts " - #{@html}"
    puts " - #{@css}"
    puts " - #{@sg}"
    
    puts system("rm #{@html}/#{@object}.html")
    puts system("rm #{@css}/#{@object}.scss")
    puts system("rm #{@sg}/#{@object}.html")
  end
end