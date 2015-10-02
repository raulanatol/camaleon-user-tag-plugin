class Plugins::CamaleonUserTag::TagsController < Apps::PluginsFrontController
  include Plugins::CamaleonUserTag::MainHelper


  def list
    @user_tags = Plugins::CamaleonUserTag::UserTag.all.pluck('name')
    render json: @user_tags
  end

end
