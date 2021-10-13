<?php require_once("../resources/config.php");?>
<?php require_once(TEMPLATE_FRONT.DS."header.php");?>

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
        <header class="">
            <h1>Shop</h1>
        </header>

        <hr>

        <!-- Title -->
      
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row text-center">

            <?php get_products_in_shop_page(); ?>

 

        </div>
        <!-- element en miniature -->
        <div class="row text-center">

            <?php get_products_in_shop_page_small(); ?>

 

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

<?php require_once(TEMPLATE_FRONT.DS."footer.php");?>