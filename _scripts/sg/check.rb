require_relative 'utils'

class Check
  def initialize
    utils = Utils.new
    @ignore_includes = utils.ignore_includes
    @ignore_assets = utils.ignore_assets
    @ignore_sg = utils.ignore_sg
  end
end