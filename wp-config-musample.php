<?php
/** Enable W3 Total Cache */
//define('WP_CACHE', true); // Added by W3 Total Cache

// Enable WordPress Multisite
define('WP_ALLOW_MULTISITE', true);
define('MULTISITE', true);
define('SUNRISE', 'on');
define('SUBDOMAIN_INSTALL', true);
$base = '/';
define('DOMAIN_CURRENT_SITE',  'example.com');
define('PATH_CURRENT_SITE',    '/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);

// Security settings
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

// ** MySQL settings ** //
define('DB_NAME',     'database_name_here'); // The name of the database
define('DB_USER',     'username_here');      // Your MySQL username
define('DB_PASSWORD', 'password_here');      // ...and password
define('DB_HOST',     'localhost');          // 99% chance you won't need to change this value

// You can have multiple installations in one database if you give each a unique prefix
$table_prefix  = 'wp_';   // Only numbers, letters, and underscores please!

// Change this to localize WordPress.  A corresponding MO file for the
// chosen language must be installed to wp-includes/languages.
// For example, install de.mo to wp-includes/languages and set WPLANG to 'de'
// to enable German language support.
define ('WPLANG', '');

/* That's all, stop editing! Happy blogging. */
define('ABSPATH', dirname(__FILE__).'/');

require_once(ABSPATH.'wp-settings.php');
