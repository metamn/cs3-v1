class Utils
  def initialize
  end
  
  def mixin(object) 
    mixin_name = split(object)
    "mixin #{mixin_name} {}"
  end
  
  def yaml(object) 
    title = split(object)
    category = split(object, 1)
    ret = ''
    
    ret += '---' + "\n"
    ret += "layout: styleguide" + "\n"
    ret += "title: #{title.capitalize}" + "\n"
    ret += "category: #{category}" + "\n"
    ret += "scss: #{title}.scss" + "\n"
    ret += '---' + "\n"
    
    ret
  end
  
  def split(object, index = 0)
    ret = object.split('/')
    
    ret[ret.length - index - 1]
  end
end