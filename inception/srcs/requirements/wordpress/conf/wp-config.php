<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', $_SQL_DATABASE );

/** Database username */
define( 'DB_USER', $_SQL_USER );

/** Database password */
define( 'DB_PASSWORD', $_SQL_PASSWORD );

/** Database hostname */
define( 'DB_HOST', $_SQL_HOST );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'e]#!hqYvj1!aELZ3xu*aA%3NWz&fwtSNzioE|Q|vVlO|50OZ/ xZs]h?aC#l-{))');
define('SECURE_AUTH_KEY',  '_*^. ^~tpc9$/Pc{rBl+&lTB}z v_O-4E/k)g,P)Bo`wc,}XQ1WeYOE!vg-*xwKH');
define('LOGGED_IN_KEY',    '3+o.W-G<3-YD^G]X=(%5B6V-T*C3MF^,x<{|4 }R.4M^[&urFf2B +>*k|ZOuIHc');
define('NONCE_KEY',        'W*OC7B%eD$b@|8y7A3SIJ;[A>sEnvnv*6va&7=Q]|G_61=(M$@`2m[$,|g13_O-s');
define('AUTH_SALT',        'LY/!:#PZ;JQTI*d<QS0rH9j5+d%r8A|G;kxoT@2*|-GEp=8|c#+4*%aHVgvUph1G');
define('SECURE_AUTH_SALT', ')*[q+K+]oSK+QJc`8E>I0FDY]]s@d6/su5Oh@LSqKD/0YOJnf2A)gv8Ic3mv1%hW');
define('LOGGED_IN_SALT',   '#y@[K0SE8n;^J2H}2Ya?HRE:oaO!1abza+-ny]]1i:Wh+UF&_NtY`aUtXw+?,f=F');
define('NONCE_SALT',       '}?-U=?A?vQlt/IO2(d$fn>vz;W6?fhE-[;rq>H.}|laj0o^yrB7~y;M^t;Hj|&$6');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );