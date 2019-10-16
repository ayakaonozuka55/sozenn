<?php
define('WP_AUTO_UPDATE_CORE', false);// この設定は WordPress Toolkit によって WordPress の自動更新を防止するために定義されています。WordPress Toolkit の自動更新機能との競合を防ぐために、変更しないでください。
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
define('DB_USER', 'wordpress_6');

/** MySQL database password */
define('DB_PASSWORD', 'ToDM9_67df');

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
define('AUTH_KEY',         'W7)u6u8BC0sRi1Y8%CtOO^1LuFox4WQxw*6LJZR(SJsFc7mi67XSGkhn5^%FVZ)5');
define('SECURE_AUTH_KEY',  'O4M#kreQL&om5C6!aJGV2nd0(g89TYqvVzKUKp6HI(4PczZsYPUX%&8)GsdpHZ&w');
define('LOGGED_IN_KEY',    'gs#IZ%d!&3KTvnkDIPddGdeE%Dv6uWuO%K5KEvP(HZ!OrnX1jpGw^mQHfLn@WHce');
define('NONCE_KEY',        'hy^(UOw1#*N(lD8!6!DP6o!e7wsoCzBW12Da8XhyZLtg3gBJMj17zwEC4PM^CdIi');
define('AUTH_SALT',        'QxMBqQrwh6turI3ZXSe&LfXpPN9KntAFb#BLM5Gf%kg#iTl14QMGCoZ8NgrZD#6a');
define('SECURE_AUTH_SALT', 'yr2)oEqV0qgLMviMOZXIC3rWjpjkkx^8bh3&Y&zj%k6&vxuNVeA()Wj(ITPqsEjC');
define('LOGGED_IN_SALT',   '!TX8ThduO*2bIcMmxPuN*Um3Szi16ZB&5fsGJb!hhu9gBvqFGy*9labOQBUASNWf');
define('NONCE_SALT',       'MA1rO#BcZec^3*MhDAro5HZ34W*0JVU!Q8V*SYY6q5X2VoGDiX9IT3coK^My4G7Y');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = '6q96JDBZu_';

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
