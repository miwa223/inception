<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'MYSQL_NAME' );

/** Database username */
define( 'DB_USER', 'MYSQL_USER' );

/** Database password */
define( 'DB_PASSWORD', 'MYSQL_PASSWORD' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'o7L!gQkF]d,t>(?{VNH~aZhvp>m9+Rqi.L@mx@x%!bP_.Uf79!jeE.[v])sasw$^');
define('SECURE_AUTH_KEY',  'Nc!a9u,{ybKfMF(ql4t$<*akw-t-G9>J2G;|j^~,OaU|+3-_V,K^FKW0dbx0*wr}');
define('LOGGED_IN_KEY',    'd(jp-d|:5.S7:f*/:^m1^$n9cUqTssZlo<jN08_U^E uk3K+VnOP{#7C:% X35xJ');
define('NONCE_KEY',        'j,P)t-8%gt_f2ob<|-1$2x44^UC6-R%ai5~~%A3`(:Pmv0XLgY_&%x+aW~O~Q3BJ');
define('AUTH_SALT',        'aWy9*Q{B|o^OZI-Z)zf>(|$*xhD9O8_Z4:vOoZ4d>K`r|Z`O,0gDt[n?TqW@7B=(');
define('SECURE_AUTH_SALT', 'Q)|PJu:eDioq+ #i2:-Dq:cA `}*x|+DI-$jC03Q{3?NBHiuz,j2|h$a>-sM]|+q');
define('LOGGED_IN_SALT',   'IjY$3pT X!:+GCHb!I(GK8iI%PFqgGC>px;w$~1SWVvLTUP6qhCb3&~`}>}k)8V ');
define('NONCE_SALT',       '9=^fYVVN?xc*}P_~x`1#7zO5b#tzj8-9+{QD5@:If2w<S2KKVUmJQ+BGvdJ[ f~ ');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
