require_relative 'utils'

class Move
  def initialize(object1, object2)
    @object1 = object1
    @object2 = object2
    @root = Dir.pwd
    
    @html = @root + "/_includes"
    @css = @root + "/assets/styles"
    @sg = @root + "/styleguide"
    
    @utils = Utils.new
    
    move
  end
  
  def move
    puts "Moving #{@object1} to #{@object2}"
    
    html
    css
    sg
    
    rename
  end
  
  def html
    puts system("mv #{@html}/#{@object1}.html #{@html}/#{@object2}.html")
  end
  
  def css
    puts system("mv #{@css}/#{@object1}.scss #{@css}/#{@object2}.scss")
  end
  
  def sg
    puts system("mv #{@sg}/#{@object1}.html #{@sg}/#{@object2}.html")
  end
  
  def rename
    @name1 = @utils.split(@object1)
    @name2 = @utils.split(@object2)
    
    if (@name1 != @name2) 
      rename_css
      rename_sg
    end
  end
  
  def rename_css
    puts "Renaming 'mixin #{@name1}' to '#{@name2}' in #{@css}/#{@object2}.scss"
    @utils.rename_text_in_file "#{@css}/#{@object2}.scss", "#{@name1}", "#{@name2}"
  end
  
  def rename_sg
    puts "Renaming 'title: #{@name1}' to '#{@name2}' in #{@sg}/#{@object2}.html"
    @utils.rename_text_in_file "#{@sg}/#{@object2}.html", "title: #{@name1}", "title: #{@name2}"
    
    puts "Renaming 'scss: #{@name1}' to '#{@name2}' in #{@sg}/#{@object2}.html"
    @utils.rename_text_in_file "#{@sg}/#{@object2}.html", "scss: #{@name1}", "scss: #{@name2}"
    
    @category1 = @utils.split(@object1, 1)
    @category2 = @utils.split(@object2, 1)
    
    puts "Renaming 'category: #{@category1}' to '#{@category2}' in #{@sg}/#{@object2}.html"
    @utils.rename_text_in_file "#{@sg}/#{@object2}.html", "category: #{@category1}", "category: #{@category2}"
  end
end