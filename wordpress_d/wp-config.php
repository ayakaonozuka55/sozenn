<?php
/** 
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress_3');

/** MySQL database username */
define('DB_USER', 'wordpress_9');

/** MySQL database password */
define('DB_PASSWORD', 'kBd1AXs78_');

/** MySQL hostname */
define('DB_HOST', 'localhost:3306');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'asokNBPkQzDW&%xLtID&Vn#iZ(oCfek4kMOUwm*UgElv@jiYBiZ&mEmoDj&CcwZU');
define('SECURE_AUTH_KEY',  '#%Y!&mWt(h4qVGoOKju)fVI*0ixEvEuu&Oa9kmD%E2k)uroi9%hM*j3&DTQ%HDFr');
define('LOGGED_IN_KEY',    'ZaaLgr6Yfe3orq#tCpHE7kb4cUxi#RvKcknu0wxWdwlQ534IWSh&QT7(iDYl0)p7');
define('NONCE_KEY',        'V3km7f#r)76MkFjVaXA%g%hf3x^CDPGH5&!x7Fa)jqUp6lQYzrj9GgESYSa82PI%');
define('AUTH_SALT',        '4rDO6*Ut27F68^CD0BC^Pm%flTu#ql3GwiwU%U7&VXyZUUu3lnTiCt3^cqggSNmN');
define('SECURE_AUTH_SALT', 'P3ooZ4niwhnGl)YHcwyl3aN2zTh!8#k%*672yY7Z^)aseKxfHtR4Sba!%!)ueH)K');
define('LOGGED_IN_SALT',   'v5IyB7z#AcH5hBwHVqpxfQ@xqkEe3Ycg!BL&q!!e7Slz7I#o^i^#r4%FlNvEHxRO');
define('NONCE_SALT',       'EPi)IS2VKAgK^ys1(n)ij0D9J7sACSGE6I#MQH2Fk#R!d1X8kBXtO1xsIbym(HSJ');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'U9Vn79nY_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);
/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress.  A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de.mo to wp-content/languages and set WPLANG to 'de' to enable German
 * language support.
 */
define ('WPLANG', 'en_US');

define( 'WP_ALLOW_MULTISITE', true );

define ('FS_METHOD', 'direct');


/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

//--- disable auto upgrade
define( 'AUTOMATIC_UPDATER_DISABLED', true );



?>
