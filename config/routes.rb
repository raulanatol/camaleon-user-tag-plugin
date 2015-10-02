Rails.application.routes.draw do

  scope '(:locale)', locale: /#{PluginRoutes.all_locales}/, :defaults => {  } do
    # frontend
    namespace :plugins do
      namespace 'camaleon_user_tag' do
        get 'index' => 'front#index'
      end
    end
  end

  #Admin Panel
  scope 'admin', as: 'admin' do
    namespace 'plugins' do
      namespace 'camaleon_user_tag' do
        get 'index' => 'admin#index'
      end
    end
  end

  # main routes
  #scope 'camaleon_user_tag', module: 'plugins/camaleon_user_tag/', as: 'camaleon_user_tag' do
  #  Here my routes for main routes
  #end
end
