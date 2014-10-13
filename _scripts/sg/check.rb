require_relative 'utils'

class Check
  def initialize
    utils = Utils.new
    @ignore_includes = utils.ignore_includes
    @ignore_assets = utils.ignore_assets
    @ignore_sg = utils.ignore_sg
    
    @includes = files('_includes', @ignore_includes)
    @assets = files('assets/styles', @ignore_assets)
    @sg = files('styleguide', @ignore_sg)
    
    check
  end
  
  def check
    puts
    puts "_includes vs. assets"
    puts
    puts compare(@includes, @assets, '_includes', 'assets/styles')
    
    puts
    puts "_includes vs. styleguide"
    puts
    puts compare(@includes, @sg, '_includes', 'styleguide')
    
    puts
    puts "assets vs styleguide"
    puts
    puts compare(@assets, @sg, 'assets/styles', 'styleguide')
  end
  
  def files(folder, ignore)
    all = Dir.glob(folder + "/**/*")
    ignore.each {|i| all = all - Dir.glob(i)}
    
    all
  end
  
  def compare(array1, array2, prefix1, prefix2) 
    a1 = array1.map {|a| a.gsub(prefix1, '')}
    a2 = array2.map {|a| a.gsub(prefix2, '')}
    a1-a2
  end
end