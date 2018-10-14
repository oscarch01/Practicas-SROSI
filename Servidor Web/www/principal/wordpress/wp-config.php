<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'oscar2');

/** MySQL database password */
define('DB_PASSWORD', 'toor');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

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
define('AUTH_KEY',         ';1qr[TCA7S]iT>/$=NgA|vO|=KDeak2=2.RwjB,r@{0fBXxflwRiunNzy.9vA S7');
define('SECURE_AUTH_KEY',  '`r_Pc5>cr%7D)Du$83^X2Fjuwl3,LBR1vgKL_Yi4g&rY^Vlt1P+=ZV~[X)C)# [8');
define('LOGGED_IN_KEY',    '{}30@4:Q&K-nn-de(c3If2U1{v34zQ}hq tapRk3>loIZ=pi4O i/Z#=7)Cv]C>N');
define('NONCE_KEY',        'ilC:t6fE<:N1u]RqsmMKq@>U>-EkS-RD0u<mVptN?h()WXE!YJFWABIpbo~jI%,k');
define('AUTH_SALT',        '<aYt& z8Fpw!X-><$g3PcXUDvqP(v<H[}pQf%BPS-OW!0%X,8I.J}Sp_}Qw#A*$3');
define('SECURE_AUTH_SALT', 'bl|DG6nz<`;<^q4b6h PH^/4CYl3I9Z2$kmV0Hz97-,5-qG=&t]i9E^ tO=9D)&H');
define('LOGGED_IN_SALT',   'JL.%&gqN/[iv1OFV@H6E/(.t0Vr<&m] I_P:1CzN~-~BZ7%niM.QrAHHP.ZW,oO@');
define('NONCE_SALT',       'RDA?}P%7$Ofti_3@]M,r9Z%zhqyEqr2&ES6pkDlR Tn_at pG_p[Yh7P9Bl`z0#^');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
