# Steps
* Install Spree
* If there is an error creating admin user: please do this:
```
rake spree_auth:admin:create
```
* Install Camaleon CMS '>= 2.3.6' (Note: Before rake db:migrate, please define in config.json)
 ```
 "user_model": "Spree::User",
 "admin_path_name": "store_admin",
 ```
* Copy camaleon_spree plugin inside apps/plugins/
* Install Camaleon Spree Plugin: add gem into Gemfile
```
gem 'camaleon_spree', path:  './apps/plugins/camaleon_spree/'
```
* Rake db:migrate
* Move views/plugins/camaleon_spree/front/template_product_page.html.erb inside your camaleon theme/views
* Active your plugin within admin -> plugins (After install plugin please restart server)