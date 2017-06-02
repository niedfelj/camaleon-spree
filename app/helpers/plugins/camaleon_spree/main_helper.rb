module Plugins::CamaleonSpree::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end
  
  # fix to avoid missing route for https://github.com/spree-contrib/spree_tax_cloud
  def edit_admin_tax_cloud_settings_path
    spree.edit_admin_tax_cloud_settings_path
  end
  
  # fix to avoid missing route for https://github.com/spree-contrib/spree_mail_settings
  def edit_admin_mail_method_url
    spree.edit_admin_mail_method_url
  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def camaleon_spree_on_active(plugin)
  end

  # here all actions on going to inactive
  # plugin: plugin model
  def camaleon_spree_on_inactive(plugin)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def camaleon_spree_on_upgrade(plugin)
  end

  def camaleon_spree_user_roles_hook(args)
    args[:roles_list][:manager] << { key: 'spree_role', label: t('plugins.spree_cama.admin.roles.label', default: 'Spree Ecommerce'), description: t('plugins.spree_cama.admin.roles.descr', default: 'Manage all sections of Spree Ecommerce')}
  end

  def camaleon_spree_custom_fields(args)
    args[:fields][:spree_products] = {
        key: 'spree_products',
        label: 'Spree Products',
        render: plugin_view('admin/custom_field/spree_products.html.erb'),
        options: {
            required: true,
            multiple: true,
        }
    }

    args[:fields][:spree_categories] = {
        key: 'spree_categories',
        label: 'Spree Categories',
        render: plugin_view('admin/custom_field/spree_categories.html.erb'),
        options: {
            required: true,
            multiple: true,
        }
    }
  end

  def camaleon_spree_custom_field_models(args)
    args[:models] << Spree::Product
  end


  def camaleon_spree_on_render_front_menu_item(args)
    if args[:parsed_menu] !=  false && args[:menu_item].kind == 'external' && args[:parsed_menu][:current] == false
      args[:parsed_menu][:current] = URI::parse(site_current_url).path == args[:parsed_menu][:link]
    end
  end
end
