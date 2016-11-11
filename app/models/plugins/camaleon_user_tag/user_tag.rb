class Plugins::CamaleonUserTag::UserTag < ActiveRecord::Base
  self.table_name = 'plugins_camaleon_user_tag_user_tags'

  def create
    @user = UserTag.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :counter)
  end

end