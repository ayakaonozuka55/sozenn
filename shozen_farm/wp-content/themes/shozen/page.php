<?php get_header(); ?>
<!-- sub-container -->
<?php if(have_posts()): while(have_posts()): the_post(); ?>

<?php the_content(); ?>

<?php endwhile; endif; ?>
<!-- sub-container end -->
<?php get_footer(); ?>