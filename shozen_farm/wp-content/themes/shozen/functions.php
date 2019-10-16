<?php
/**
 * @package WordPress
 */


// アイキャッチ画像を有効にする。
add_theme_support('post-thumbnails'); 

// カスタムメニュー有効
register_nav_menus(array(
  'news_nav'=>'News_Navigation'
));

// 投稿スラッグ自動生成
function auto_post_slug( $slug, $post_ID, $post_status, $post_type ) {
    if ( preg_match( '/(%[0-9a-f]{2})+/', $slug ) ) {
        $slug = utf8_uri_encode( $post_type ) . '-' . $post_ID;
    }
    return $slug;
}
add_filter( 'wp_unique_post_slug', 'auto_post_slug', 10, 4  );

add_filter('protected_title_format', 'remove_protected');
function remove_protected($title) {
       return '%s';
}


 
add_filter('tiny_mce_before_init', function($init) {
	$init['wpautop'] = false;
	$init['apply_source_formatting'] = ture;
	return $init;
});

function add_category_columns($columns)
{
    $index = 1; // 追加位置

    return array_merge(
        array_slice($columns, 0, $index),
        array('id' => 'ID'),
        array_slice($columns, $index)
    );
}
add_filter('manage_edit-category_columns', 'add_category_columns');

function add_category_custom_fields($deprecated, $column_name, $term_id)
{
    if ($column_name == 'id') {
        echo $term_id;
    }
}
add_action('manage_category_custom_column', 'add_category_custom_fields', 10, 3);

add_theme_support( 'admin-bar', array( 'callback' => '__return_false' ) );
add_filter( 'show_admin_bar', '__return_false' );// 管理バーのHTMLを非表示


// ajaxzip3の読み込み
function ajaxzip3_scripts() {
    wp_enqueue_script( 'ajaxzip3-script', 'https://ajaxzip3.googlecode.com/svn/trunk/ajaxzip3/ajaxzip3-https.js', array( 'jquery' ), '20140807', true );
}
add_action( 'wp_enqueue_scripts', 'ajaxzip3_scripts' );

function wp_pagination() {
	global $wp_query;
	$big = 99999999;
	$page_format = paginate_links( array(
		'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
		'format' => '?paged=%#%',
		'current' => max( 1, get_query_var('paged') ),
		'total' => $wp_query->max_num_pages,
		'prev_next'    => True,
		'prev_text'    => __('< 前へ'),
		'next_text'    => __('次へ >'),
		'type'  => 'array'
	) );
	if( is_array($page_format) ) {
		$paged = ( get_query_var('paged') == 0 ) ? 1 : get_query_var('paged');
		echo '<ul class="pager_list cf noto">';
		foreach ( $page_format as $page ) {
    		echo "<li>$page</li>";
		}
			echo '</ul>';
	}
	wp_reset_query();
}

?>