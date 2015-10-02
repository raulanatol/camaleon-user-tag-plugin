class Plugins::CamaleonUserTag::UserTag < ActiveRecord::Base
  self.table_name = 'plugins_camaleon_user_tag_user_tags'

  attr_accessible :name, :counter
end