module Jekyll
  class CodeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      # get which file to display, ie. full-height.scss
      # the file type to display is passed through the @text parameter
      # ie. {% code scss %}
      filename = context.environments.first["page"]["#{@text}"]
      
      # locate in which folder the file exists, ie 'atoms' of 'molecules'
      folder = context.environments.first["page"]["category"]
      
      # the root dir of the project
      root = Dir.pwd
      
      case @text
        when "scss"
          file = root + "/assets/styles/" + folder + "/" + filename
        when "html"
          file = root + "/_includes/site/" + folder + "/" + filename
        when "js"
          file = root + "/assets/scripts/" + folder + "/" + filename
      end
      
      File.open(file, 'r') { |f| f.read } if File.exist? file
    end
  end
end

Liquid::Template.register_tag('code', Jekyll::CodeTag)