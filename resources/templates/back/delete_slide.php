<?php require_once("../../resources/config.php");


if(isset($_GET['delete_slide_id'])) {




$slide_image_query = query("SELECT slide_image FROM slides WHERE slide_id = " . escape_string($_GET['delete_slide_id']) . " ");
confirm($slide_image_query);
$row = fetch_array($slide_image_query);
$target_path = "../../resources/uploads/{$row['slide_image']}";
unlink($target_path);

$query = query("DELETE FROM slides WHERE slide_id = " . escape_string($_GET['delete_slide_id']) . " ");
confirm($query);//C:\wamp64\www\E-commerce\e-shop\img
set_message("Slide Deleted");
redirect("index.php?slides");


} else {

redirect("index.php?slides");


}






 ?>