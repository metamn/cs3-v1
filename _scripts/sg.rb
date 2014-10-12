require_relative 'sg/compile'

class Styleguide
  def initialize
    @command = ARGV[0].to_s
    @param1 = ARGV[1].to_s
    @param2 = ARGV[2].to_s
    
    usage if @command.empty? or @param1.empty?
    run_command
  end
  
  def run_command
    case @command
      when "c"
        Compile.new
      when "g"
        puts "Generate"
      when "rm"
        puts "Remove"
      when "mv"
        puts "Move"
      else
        usage
    end
  end
  
  def usage
    puts "Usage: sg command object1 [object2]"
    puts "Example:"
    puts " - sg c fonts #=> compile fonts.liquid"
    puts " - sg g atoms/player/header #=> generates the header styleguide objects"
    puts " - sg rm atoms/player/header #=> removes the header styleguide objects"
    puts " - sg mv atoms/player/header molecules/player/header #=> moves the header styleguide objects"
    abort
  end
end

sg = Styleguide.new