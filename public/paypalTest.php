<?php require_once("../resources/config.php");?>

<?php
    if(isset($_GET['add'])){


        $query = query("SELECT * FROM products WHERE product_id=".escape_string($_GET['add'])." ");
        confirm($query);
        //var_dump($query= fetch_array($query));die();

        while($row = fetch_array($query)){

            if($row['product_quantity'] != $_SESSION['product_'.$_GET['add']]){
                $_SESSION['product_'.$_GET['add']] += 1;
                redirect("checkout.php");
            }else{
                set_message("We have only ".$row['product_quantity']." {$row['product_title']} "."available");
                redirect("checkout.php");
            }
        }
       /* $_SESSION['product_'.$_GET['add']] += 1;
        redirect('index.php');*/
    }



    if(isset($_GET['remove'])){
        $_SESSION['product_'.$_GET['remove']]--;
        if($_SESSION['product_'.$_GET['remove']] <1){
            unset($_SESSION['item_total']);
            unset($_SESSION['item_quantity']);  
            redirect("checkout.php");
        }else{
            redirect("checkout.php");
        }
    }
    

    if(isset($_GET['delete'])){
         $_SESSION['product_'.$_GET['delete']] = '0';
        unset($_SESSION['item_total']);
        unset($_SESSION['item_quantity']);  
         redirect("checkout.php");
     }


     function cart(){
            $total = 0;
            $item_quantity = 0;
            $item_name = 1;
            $item_number = 1;
            $amount = 1;
            $quantity = 1;
            foreach ($_SESSION as $name => $value) {
            if($value>0){
            if(substr($name, 0, 8) == "product_"){
            $length = strlen($name) - 8;
            $id = substr($name, 8, $length);
                $query = query("SELECT * FROM products WHERE product_id =".escape_string($id)." ");
                confirm($query);
                while ($row = fetch_array($query)) {
                    $sub = $row['product_price'] * $value;
                    $item_quantity += $value;
                    $product = <<<DELIMETER

                     <tr>
                        <td>{$row['product_title']}</td>
                        <td>&#36;{$row['product_price']}</td>
                        <td>{$value}</td>
                        <td>&#36;{$sub}</td>
                        <td><a class="btn btn-warning" href="cart.php?remove={$row['product_id']}"><span class="glyphicon glyphicon-minus"></span></a> <a class="btn btn-success" href="cart.php?add={$row['product_id']}"><span class="glyphicon glyphicon-plus"></a>
                        <a class="btn btn-danger" href="cart.php?delete={$row['product_id']}"><span class="glyphicon glyphicon-remove"></span></a></td>
                      
                    </tr>
                    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
  <input type="hidden" name="cmd" value="_xclick">
  <input type="hidden" name="business" value="sb-ye7wn1043628@business.example.com">
  <input type="hidden" name="item_name" value="hat">
  <input type="hidden" name="item_number" value="123">
  <input type="hidden" name="amount" value="15.00">
  <input type="hidden" name="first_name" value="John">
  <input type="hidden" name="last_name" value="Doe">
  <input type="hidden" name="address1" value="9 Elm Street">
  <input type="hidden" name="address2" value="Apt 5">
  <input type="hidden" name="city" value="Berwyn">
  <input type="hidden" name="state" value="PA">
  <input type="hidden" name="zip" value="19312">
  <input type="hidden" name="night_phone_a" value="610">
  <input type="hidden" name="night_phone_b" value="555">
  <input type="hidden" name="night_phone_c" value="1234">
  <input type="hidden" name="email" value="jdoe@zyzzyu.com">
  <input type="image" name="submit"
    src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
    alt="PayPal - The safer, easier way to pay online">
</form>
DELIMETER;
        echo $product;
        $item_name++;
        $item_number++;
        $amount++;
        $quantity++;    }
                    $_SESSION['item_total'] = $total +=$sub;
                    $_SESSION['item_quantity']  =$item_quantity;
            }
        }
        }

    }
?>