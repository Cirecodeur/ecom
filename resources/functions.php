<?php

$upload_directory = "uploads/";

function set_message($msg){
	if(!empty($msg)){
		$_SESSION['message'] = $msg;
	}else{
		$msg = "";
	}
}

function display_message(){
	if(isset($_SESSION['message'])){
		echo $_SESSION['message'] ;
		unset($_SESSION['message']);
	}
}
function display_message2($message, $type="success"){
		echo "<h3 class=\"bg-$type\">".$message.'</h3>';
	
}
	//helper function

	function last_id(){
		global $connection;
        return mysqli_insert_id($connection);
	}


	function redirect($location){
		header("Location:$location");
	}

	function query($sql){
		global $connection;
		return mysqli_query($connection, $sql);
	}

	function confirm($result){
		global $connection;
		if(!$result){
            die("QUERY FAILED".mysqli_error($connection));
        }
	}

	function escape_string($string){
		global $connection;
		return mysqli_real_escape_string($connection, $string);
	}

	function fetch_array($result){
		return mysqli_fetch_array($result);
	}

/************************FRONT END FUNCTIONS ********************************/
	//get products functions
	function get_products(){
		$query = query("SELECT * FROM products WHERE product_quantity>=1");
		confirm($query);

		$rows = mysqli_num_rows($query);
		if(isset($_GET['page'])){
			$page = preg_replace('#[^0-9]#', '', $_GET['page']);
			//echo $page;
		}
		else{
			$page = 1;


		}
		$perPage = 6;
		$lastPage = ceil($rows / $perPage);
		if($page < 1){
			$page = 1;
		}
		elseif($page > $lastPage){
			$page = $lastPage;
		}

		$middleNumbers = '';
		$sub1 = $page - 1;
		$sub2 = $page - 2;
		$add1 = $page + 1;
		$add2 = $page + 2;

		if($page == 1){
			
			$middleNumbers .= '<li class="page-item active"><a>'.$page.'</a></li>';

			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$add1.'">'.$add1. '</a></li>';
			 //echo '<ul class="pagination">'.$middleNumbers.'</ul>';
		}
		elseif($page == $lastPage){

			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$sub1.'">'.$sub1. '</a></li>';
			$middleNumbers .= '<li class="page-item active"><a>'.$page.'</a></li>';
		}
		elseif($page >2 &&  $page < ($lastPage-1)){

			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$sub2.'">'.$sub2. '</a></li>';
			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$sub1.'">'.$sub1. '</a></li>';
			$middleNumbers .= '<li class="page-item active"><a>'.$page.'</a></li>';

			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$add1.'">'.$add1. '</a></li>';
			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$add2.'">'.$add2. '</a></li>';
			//echo "<ul class='pagination'>{$middleNumbers}</ul>";
		}
		elseif($page >1 &&  $page < $lastPage){

			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$sub1.'">'.$sub1. '</a></li>';
			$middleNumbers .= '<li class="page-item active"><a>'.$page.'</a></li>';

			$middleNumbers .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$add1.'">'.$add1. '</a></li>';
			//echo "lastpage : {$lastPage}<ul class='pagination'>{$middleNumbers}</ul>";
		}

		$limit = ' LIMIT '.($page-1) * $perPage.','.$perPage;
		$query2 = query("SELECT * FROM products $limit");
		confirm($query2);

		$outputPagination = "";
		/*if($page != "1"){
			echo "page $page of $lastPage";
		}*/
		if($page != 1){
			$prev = $page -1;
			$outputPagination .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$add1.'">Back</a></li>';
		}
		$outputPagination .= $middleNumbers;
		if($page != $lastPage){

			$next = $page +1;
			$outputPagination .= '<li class="page-item" aria-current="page"><a class="page-link" href="'.$_SERVER['PHP_SELF'].'?page='.$next.'">Next</a></li>';

		}



		while ($row = fetch_array($query2)) {
			$product_image = display_image($row['product_image']);
			$product = <<<DELIMETER

							<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <a href="item.php?id={$row['product_id']}" ><img  style="height:100px" src="../resources/{$product_image}" alt=""></a>
                            <div class="caption">
                                <h4 class="pull-right">&#36;{$row['product_price']}</h4>
                                <h4><a href="item.php?id={$row['product_id']}">{$row['product_title']}</a>
                                </h4>
                                <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p><a class="btn btn-primary" target="_blank" href="../resources/cart.php?add={$row['product_id']}">Add to cart</a>
                            </div>
                            
                        </div>
                    </div>

DELIMETER;
			echo $product; 
		}
		echo "<div class='text-center'><ul class='pagination'>{$outputPagination}</ul></div>";
	}


function get_categories(){
	$query = query("SELECT *FROM categories");
	confirm($query);
     while($row = fetch_array($query)){

     $category_links = <<<DELIMETER
		<a href='category.php?id={$row['cat_id']}' class='list-group-item'>{$row['cat_title']}</a>

DELIMETER;

		echo $category_links;
    }
   }



	function get_products_in_cat_page(){
		$query = query("SELECT * FROM products WHERE product_category_id = ".escape_string($_GET['id'])." ");
		confirm($query);
		while ($row = fetch_array($query)) {
			$product_image = display_image($row['product_image']);
			$product = <<<DELIMETER

				<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="../resources/{$product_image}" alt="">
	                    <div class="caption">
	                        <h3>{$row['product_title']}</h3>
	                        <p>{$row['short_desc']}</p>
	                        <p>
	                            <a href="../resources/cart.php?add={$row['product_id']}" class="btn btn-primary">Buy Now!</a> <a href="item.php?id={$row['product_id']}" class="btn btn-default">More Info</a>
	                        </p>
	                    </div>
	                </div>
            	</div>
DELIMETER;
			echo $product; 
		}
	}




	function get_products_in_shop_page(){
		$query = query("SELECT * FROM products");
		confirm($query);
		while ($row = fetch_array($query)) {
			$product_image = display_image($row['product_image']);
			$product = <<<DELIMETER

				<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="../resources/{$product_image}" alt="">
	                    <div class="caption">
	                        <h3>{$row['product_title']}</h3>
	                        <p>{$row['short_desc']}</p>
	                        <p>
	                            <a href="../resources/cart.php?add={$row['product_id']}" class="btn btn-primary">Buy Now!</a> <a href="item.php?id={$row['product_id']}" class="btn btn-default">More Info</a>
	                        </p>
	                    </div>
	                </div>
            	</div>
DELIMETER;
			echo $product; 
		}
	}

	//affiche les element en miniature
		function get_products_in_shop_page_small(){
		$query = query("SELECT * FROM products ORDER BY RAND() DESC");
		confirm($query);
		while ($row = fetch_array($query)) {
			$product_image = display_image($row['product_image']);
			$product = <<<DELIMETER

				<div class="col-md-2 col-sm-4 hero-feature small_height">
	                <div class="thumbnail">
	                    <img src="../resources/{$product_image}" alt="">
	                    <div class="caption">
	                        <h3>{$row['product_title']}</h3>
	                        <p>{$row['short_desc']}</p>
	                        <p>
	                            <a href="../resources/cart.php?add={$row['product_id']}" class="btn btn-primary col-md-5">Buy Now!</a> <a href="item.php?id={$row['product_id']}" class="btn btn-default col-md-5">More Info</a>
	                        </p>
	                    </div>
	                </div>
            	</div>
DELIMETER;
			echo $product; 
		}
	}
	//affiche les elements en miniature





	function login_user(){
		if(isset($_POST['submit'])){
			extract($_POST);
			$user_name = escape_string($username);
			$password = escape_string($password);
			$query = query("SELECT * FROM users WHERE username = '${user_name}' AND password = '{$password}'");
			confirm($query);
			if(mysqli_num_rows($query) == 0){
				set_message("Your password or username is wrong");
				redirect('login.php');
			}else{
				$_SESSION['username'] = $username;
				//set_message("Welcome to admin {$username}");
				redirect('admin');
			}
		}
	}


	function send_message(){
		if(isset($_POST['submit'])){
			extract($_POST);
			$to = "someemailAddress@gmail.com";
			$from_name = $name;
			$subject  = $subject;
			$email  = $email;
			$message  = $message;

			$headers = "FROM: {$from_name} {email}";
			$result = mail($to, $subject, $message, $headers);
			if(!$result){
				set_message("Sorry we could not sent your message");
			}else{
				set_message("Your message has been sent");
			}

		}
	}
/************************ BACK END FUNCTIONS ********************************/

function display_orders(){
	$query = query("SELECT * FROM orders");
	confirm($query);
	while ($row = fetch_array($query)) {
			$orders = <<<DELIMETER
			<tr>
           <td>{$row['order_id']}</td>
           <td>{$row['order_amount']}</td>
           <td>{$row['order_transaction']}</td>
           <td>{$row['order_currency']}</td>
           <td>{$row['order_status']}</td>
           <td><a class="btn btn-danger" href="../../resources/templates/back/delete_order.php?id={$row['order_id']}"><span class="glyphicon glyphicon-remove"></span></a></td>
   
      </tr>
DELIMETER;
	echo $orders;
	}
}


/************************ADMIN PRODUCTS PAGE********************************/

function display_image($picture){
	global $upload_directory;
	return $upload_directory. DS . $picture;
}

function get_products_in_admin(){

	$query = query("SELECT * FROM products");
		confirm($query);
		
		while ($row = fetch_array($query)) {
			$category = show_product_category_title($row['product_category_id']);
			$product_image = display_image($row['product_image']);
			$product = <<<DELIMETER
				
		      <tr>
		           <td>{$row['product_id']}</td>
		           <td>{$row['product_title']}<br>
		           <a href="index.php?edit_product&id={$row['product_id']}" ><img width="150" src="../../resources/{$product_image}" alt="" /></a></td>
		           <td>{$category}</td>
		           <td>{$row['product_price']}</td>
		           <td>{$row['product_quantity']}</td>
		           <td><a class="btn btn-danger" href="../../resources/templates/back/delete_product.php?id={$row['product_id']}"><span class="glyphicon glyphicon-remove"></span></a></td>
		      </tr>
DELIMETER;
			echo $product; 
		}
}


function show_product_category_title($product_category_id){
	$category_query = query("SELECT *FROM categories WHERE cat_id = '{$product_category_id}'");
	confirm($category_query);
	while ($category_row = fetch_array($category_query)) {
		return $category_row['cat_title'] ;
	}
}



function get_reports(){

	$query = query("SELECT * FROM reports");
		confirm($query);
		
		while ($row = fetch_array($query)) {

			$report = <<<DELIMETER
				
		      <tr>
		           <td>{$row['report_id']}</td>
		           <td>{$row['product_id']}</td>
		           <td>{$row['order_id']}</td>
		           <td>{$row['product_price']}</td>
		           <td>{$row['product_title']}</td>
		           <td>{$row['product_quantity']}</td>
		           <td><a class="btn btn-danger" href="../../resources/templates/back/delete_report.php?id={$row['report_id']}"><span class="glyphicon glyphicon-remove"></span></a></td>
		      </tr>
DELIMETER;
			echo $report; 
		}
}

/************************ ADD PRODUCTS IN ADMIN ********************************/

function add_product(){

	if(isset($_POST['publish'])){
		$product_title          = escape_string($_POST['product_title']);
		$product_category_id    = escape_string($_POST['product_category_id']);
		$product_price          = escape_string($_POST['product_price']);
		$product_description    = escape_string($_POST['product_description']);
		$short_desc             = escape_string($_POST['short_desc']);
		$product_quantity       = escape_string($_POST['product_quantity']);
		$product_image          = escape_string($_FILES['file']['name']);
		$image_temp_location    = $_FILES['file']['tmp_name'];

		if(move_uploaded_file($image_temp_location, UPLOAD_DIRECTORY.DS.$product_image)){
			echo 'upload FAILED';
		}
		$query = query("INSERT INTO products(product_title, product_category_id, product_price, product_description, short_desc, product_quantity, product_image) VALUES('{$product_title}', '{$product_category_id}', '{$product_price}', '{$product_description}', '{$short_desc}', '{$product_quantity}', '{$product_image}')");
		confirm($query);
		$last_id = last_id();
		set_message("New product whith id $last_id was added");
		redirect("index.php?products");
	
	}

}

function show_categories_add_product_page(){
	$query = query("SELECT *FROM categories");
	confirm($query);
     while($row = fetch_array($query)){

     $category_options = <<<DELIMETER
		<option value="{$row['cat_id']}">{$row['cat_title']}</option>

DELIMETER;

		echo $category_options;
    }
   }


/************************ UPDATE PRODUCTS CODE ********************************/
   function update_product(){

	if(isset($_POST['update'])){
		$product_title          = escape_string($_POST['product_title']);
		$product_category_id    = escape_string($_POST['product_category_id']);
		$product_price          = escape_string($_POST['product_price']);
		$product_description    = escape_string($_POST['product_description']);
		$short_desc             = escape_string($_POST['short_desc']);
		$product_quantity       = escape_string($_POST['product_quantity']);
		$product_image          = escape_string($_FILES['file']['name']);
		$image_temp_location    = $_FILES['file']['tmp_name'];

		if(empty($product_image)){
			$get_pic = query("SELECT product_image FROM products WHERE product_id= ".escape_string($_GET['id']) ." ");
			confirm($get_pic);
			while ($pic = fetch_array($get_pic)) {
				$product_image = $pic['product_image'];
			}

		}
		move_uploaded_file($image_temp_location, UPLOAD_DIRECTORY.DS.$product_image);
		$query = "UPDATE  products SET ";
		$query .= " product_title        = '{$product_title}'       , ";
		$query .= " product_category_id  = '{$product_category_id}' , ";
		$query .= " product_price        = '{$product_price}'       , ";
		$query .= " product_description  = '{$product_description}' , ";
		$query .= " short_desc           = '{$short_desc}'          , ";
		$query .= " product_quantity     = '{$product_quantity}'    , ";
		$query .= " product_image        = '{$product_image}' ";
		$query .= " WHERE product_id     = " . escape_string($_GET['id']);
		$send_update_query = query($query);
		confirm($query);
		set_message("product has been updated");
		redirect("index.php?products");
	
	}

}

/************************  CATEGORY IN ADMIN********************************/
function show_categories_in_admin(){
	
	$cat_query = query("SELECT * FROM categories");
		confirm($cat_query);
	while ($row = fetch_array($cat_query)) {
			$product = <<<DELIMETER
			<tr>
				<td>{$row['cat_id']}</td>
				<td>{$row['cat_title']}</td>
				<td><a class="btn btn-danger" href="../../resources/templates/back/delete_category.php?id={$row['cat_id']}"><span class="glyphicon glyphicon-remove"></span></a></td>
			</tr>
DELIMETER;
			echo $product; 
		}
	}


	function add_category(){
		if(isset($_POST['add_category'])){
			$cat_title = escape_string($_POST['cat_title']);
			if(empty($cat_title) || strlen(trim($cat_title)) < 1){
				//set_message("This cannot be empty");//error message
				display_message2("This cannot be empty", "danger");
			}
			else{
				$cat_insert_query = query("INSERT INTO categories(cat_title) VALUE('{$cat_title}') ");
				confirm($cat_insert_query);
				set_message("category has been added");
				//redirect("index.php?categories");
			}
	}

	}

/************************  ADMIN users ********************************/

	function display_users(){
	
	$cat_query = query("SELECT * FROM users");
		confirm($cat_query);
	while ($row = fetch_array($cat_query)) {
		$user_id = $row['user_id'];
		$username = $row['username'];
		$email = $row['email'];
		$password = $row['password'];
		$user_photo = display_image($row['user_photo']);
			$user = <<<DELIMETER
			<tr>
				<td>{$user_id}</td>
				<td>{$username}<br><img width="100" height="100" src="../../resources/{$user_photo}" alt="" /></td>
				<td>{$email}</td>
				<td><a class="btn btn-danger" href="../../resources/templates/back/delete_user.php?id={$user_id}"><span class="glyphicon glyphicon-remove"></span></a></td>
			</tr>
DELIMETER;
			echo $user; 
		}
	}



function add_user(){

	if(isset($_POST['add_user'])){
		//extract($_POST);
		$username    = escape_string($_POST['username']);
		$email       = escape_string($_POST['email']);
		$password    = escape_string($_POST['password']);
		$user_photo  = escape_string($_FILES['file']['name']);
		$photo_temp  = htmlspecialchars($_FILES['file']['tmp_name']);

		if(move_uploaded_file($photo_temp, UPLOAD_DIRECTORY.DS.$user_photo)){
			echo "Avatar's upload FAILED";
		}
		$query = query("INSERT INTO users(username, email, password, user_photo) VALUES('{$username}', '{$email}', '{$password}', '{$user_photo}') ");
		confirm($query);
		set_message("USER CREATED");
		redirect("index.php?users");
		
		
	}

}


/************************ SLIDES FUNCTIONS ********************************/
function add_slides(){

	if(isset($_POST['add_slide'])){
		$slide_title = escape_string($_POST['slide_title']);
		$slide_image = escape_string($_FILES['file']['name']);
		$slide_image_loc = $_FILES['file']['tmp_name'];
		if(empty(trim($slide_title)) || empty(trim($slide_image_loc))){

			display_message2("This field cannot be empty", "danger");
		}else{
			if(!move_uploaded_file($slide_image_loc, UPLOAD_DIRECTORY.DS.$slide_image)){
				echo 'File uploded failed';
			}

			$query = query("INSERT INTO slides(slide_title, slide_image) VALUE('{$slide_title}', '{$slide_image}') ");
			confirm($query);
			set_message("Slide added");
			redirect("index.php?slides");
		}
	}
}

function get_current_slide_in_admin(){

	$query = query("SELECT * FROM slides ORDER BY slide_id DESC LIMIT 1 ");
	confirm($query);
	while ($row = fetch_array($query)){
		$slide_image = display_image($row['slide_image']);
		$slide_active_admin = <<<DELIMETER
		
            <img class="img-responsive" src="../../resources/{$slide_image}" alt="">
        
DELIMETER;
echo $slide_active_admin;
	}
}
function get_active_slide(){
	$query = query("SELECT * FROM slides ORDER BY slide_id DESC LIMIT 1 ");
	confirm($query);
	while ($row = fetch_array($query)){
		$slide_image = display_image($row['slide_image']);
		$slide_active = <<<DELIMETER
			<div class="item active">
            <img class="slide-image" src="../resources/{$slide_image}" alt="">
        </div>
DELIMETER;
echo $slide_active;
	}
}

function get_slides(){
	$query = query("SELECT * FROM slides ");
	confirm($query);
	while ($row = fetch_array($query)){
		$slide_image = display_image($row['slide_image']);
		$slides = <<<DELIMETER
			<div class="item">
            <img class="slide-image" src="../resources/{$slide_image}" alt="">
        </div>
DELIMETER;
echo $slides;
	}
}

function get_slide_thumbnails(){
	$query = query("SELECT * FROM slides ORDER BY slide_id ASC");
	confirm($query);
	while ($row = fetch_array($query)){
		$slide_image = display_image($row['slide_image']);
		$slide_thumb_admin = <<<DELIMETER
		
            <div class="col-xs-6 col-md-3 image_container">
			 	<a href="index.php?delete_slide_id={$row['slide_id']}">
			 		<img width="100" class="img-responsive slide_admin" src="../../resources/{$slide_image}" alt="">
			 	</a>
			 	<div class="caption">
			 		<p>{$row['slide_title']}</p>
			 	</div>
			</div>
        
DELIMETER;
echo $slide_thumb_admin;
	}
}
?>