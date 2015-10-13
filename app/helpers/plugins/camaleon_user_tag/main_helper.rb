module Plugins::CamaleonUserTag::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def camaleon_user_tag_on_active(plugin)
    unless ActiveRecord::Base.connection.column_exists? 'users', :tags
      ActiveRecord::Base.connection.change_table 'users' do |t|
        t.text :tags, array: true
      end
    end

    unless ActiveRecord::Base.connection.table_exists? 'plugins_camaleon_user_tag_user_tags'
      ActiveRecord::Base.connection.create_table :plugins_camaleon_user_tag_user_tags do |t|
        t.string :name
        t.integer :counter
      end
    end
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def camaleon_user_tag_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def camaleon_user_tag_on_upgrade(plugin)
  end

  def user_update_more_actions_form(plugin)
    plugin[:html] << render('plugins/camaleon_user_tag/admin/update_user_more_actions', f: plugin[:f])
  end


  def user_tag_on_user_edit(plugin)
    append_asset_libraries({usertag: {js: [plugin_gem_asset('user_edit.js')]}})
  end


  def user_after_edited(plugin)
    user = plugin[:user]
    old_tags = user.tags
    new_tags = plugin[:params][:tags].split(',')

    # to_remove_tags = old_tags - new_tags
    to_add_tags = new_tags - old_tags
    update_user_tags_list (to_add_tags)

    user.tags = new_tags
    user.save
  end

  private

  def update_user_tags_list(to_add_tags)
    to_add_tags.each do |tag|
      Plugins::CamaleonUserTag::UserTag.where({name: tag}).first_or_create
    end
  end

end
