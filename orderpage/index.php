
<html>
  <head>
    <title>ORDER PITZZA</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel='stylesheet' href='https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css'>
    <script src="https://code.jquery.com/ui/1.13.0-rc.3/jquery-ui.min.js" integrity="sha256-R6eRO29lbCyPGfninb/kjIXeRjMOqY3VWPVk6gMhREk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styl.css">
    
    
  </head>
  <body>
    <div class='container pt-5' style=''>
      <h1  class='text-center text-primary'> ORDER NOW </h1><hr>
      <?php
        $con=mysqli_connect("localhost","root","","gestion");
        if(isset($_POST["submit"])){
          $invoice_no=$_POST["invoice_table"];
          $invoice_date=date("Y-m-d",strtotime($_POST["invoice_date"]));
          $cname=mysqli_real_escape_string($con,$_POST["cname"]);
          $Nserver=mysqli_real_escape_string($con,$_POST["Nserver"]);
          $grand_total=mysqli_real_escape_string($con,$_POST["grand_total"]);
          
          $sql_client = "INSERT INTO client_1 (Nom_Client) VALUES ('{$cname}') ";
          if($con->query($sql_client)){
            $sid=$con->insert_id;
                    // Insert data into 'serveur' table
        $sql_serveur = "INSERT INTO serveur (id, Nom_serveur) VALUES ('$sid', '$Nserver')";
        $con->query($sql_serveur);
                // Insert data into 'table' table
                $sql_table = "INSERT INTO `table` (id, Num_table) VALUES ('$sid', '$invoice_no')";
                $con->query($sql_table);
                $sql_command = "INSERT INTO command (id, date, GRAND_TOTAL) VALUES ('$sid', '$invoice_date', '$grand_total')";
                if ($con->query($sql_command)) {
                    $command_id = $con->insert_id;
        
                    // Insert data into 'lign_command' table (assuming you have product details)
                    $sql_lign_command = "INSERT INTO lign_command (id,id_command) VALUES ";
                    $rows = [];
                    for ($i = 0; $i < count($_POST["pname"]); $i++) {
                        $pname = mysqli_real_escape_string($con, $_POST["pname"][$i]);
                        $rows[] = "('$sid', '$command_id')";
                    }
                    $sql_lign_command .= implode(",", $rows);
                    $con->query($sql_lign_command);
            $sql2="insert into produit (id,Nom_produit,QTE,prix,TOTAL) values ";
            $rows=[];
            for($i=0;$i<count($_POST["pname"]);$i++)
            {
              $pname=mysqli_real_escape_string($con,$_POST["pname"][$i]);
              $price=mysqli_real_escape_string($con,$_POST["price"][$i]);
              $qty=mysqli_real_escape_string($con,$_POST["qty"][$i]);
              $total=mysqli_real_escape_string($con,$_POST["total"][$i]);
              $rows[]="('{$sid}','{$pname}','{$price}','{$qty}','{$total}')";
            }
            $sql2.=implode(",",$rows);
            if($con->query($sql2)){
              echo "<div class='alert alert-success'>Your Order Added Successfully. <a href='print.php?id={$sid}' target='_BLANK'>Click </a> here to Print your Invoice </div> ";
            }else{
              echo "<div class='alert alert-danger'>Invoice Added Failed.</div>";
            }
          }else{
            echo "<div class='alert alert-danger'>Invoice Added Failed.</div>";
          }
        }
        }
        
        
      ?>
     <form method='post' action='index.php' autocomplete='off'>
        <div class='row' style=''>
          <div class='col-md-4'>
            <h5 class='text-success'>Customer Details</h5>
            <div class='form-group'>
              <label>Name</label>
              <input type='text' name='cname' required class='form-control' style='' >
            </div>
            <div class='form-group'>
              <label> Date</label>
              <input type='text' name='invoice_date' id='date' required class='form-control'>
            </div>
          </div>
          <div class='col-md-8'>
            <h5 class='text-success'>Restaurant Details</h5>
            <div class='form-group'>
              <label>N°Table</label>
              <input type='text' name='invoice_table' required class='form-control' style='width:500px;position:relative;left: 110px;'>
            </div>
            <div class='form-group'>
              <label>Name_Server</label>
              <input type='text' name='Nserver' required class='form-control'  style='width:500px;position:relative;left: 110px;'>
            </div>
          </div>
        </div>
        <div class='row'>
          <div class='col-md-12'>
            <h5 class='text-success'>Product Details</h5>
            <table class='table table-bordered'>
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Price</th>
                  <th>Qty</th>
                  <th>Total</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody id='product_tbody'>
                <tr>
                  <td>
                    <select name='pname[]' class='form-control' required>
                      <?php
                        $products = array("Italian Pizza", "Hawaiian Special", "Hawaiian Pizza","Ultimate Overload","Greek Pizza","Bacon Pizza","Bacon Crispy Thins","Ham & Pineapple"); // Add more products as needed
                        foreach ($products as $product) {
                          echo "<option value='$product'>$product</option>";
                        }
                      ?>
                    </select>
                  </td>
                  <td><input type='text' required name='price[]' class='form-control price'></td>
                  <td><input type='text' required name='qty[]' class='form-control qty'></td>
                  <td><input type='text' required name='total[]' class='form-control total'></td>
                  <td><input type='button' value='x' class='btn btn-danger btn-sm btn-row-remove'> </td>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <td><input type='button' value='+ Add Product' class='btn btn-primary btn-sm' id='btn-add-row'></td>
                  <td colspan='2' class='text-right'>Total</td>
                  <td><input type='text' name='grand_total' id='grand_total' value='$' class='form-control' required></td>
                </tr>
              </tfoot>
            </table>
            <input type='submit' name='submit' value='Save Order' class='btn btn-success float-right'>
          </div>
        </div>
      </form>
    </div>
    <script>
      $(document).ready(function () {
        $("#date").datepicker({
          dateFormat: "dd-mm-yy",
        });

        $("#btn-add-row").click(function () {
          var productsDropdown = "<?php foreach ($products as $product) { echo "<option value='$product'>$product</option>"; } ?>";
          var row =
            "<tr> <td><select name='pname[]' class='form-control' required>" + productsDropdown + "</select></td> <td><input type='text' required name='price[]' class='form-control price'></td> <td><input type='text' required name='qty[]' class='form-control qty'></td> <td><input type='text' required name='total[]' class='form-control total'></td> <td><input type='button' value='x' class='btn btn-danger btn-sm btn-row-remove'> </td> </tr>";
          $("#product_tbody").append(row);
        });

        $("body").on("click", ".btn-row-remove", function () {
          if (confirm("Are You Sure?")) {
            $(this).closest("tr").remove();
            grand_total();
          }
        });

        $("body").on("keyup", ".price", function () {
          var price = Number($(this).val());
          var qty = Number($(this).closest("tr").find(".qty").val());
          $(this).closest("tr").find(".total").val(price * qty);
          grand_total();
        });

        $("body").on("keyup", ".qty", function () {
          var qty = Number($(this).val());
          var price = Number($(this).closest("tr").find(".price").val());
          $(this).closest("tr").find(".total").val(price * qty);
          grand_total();
        });

        function grand_total() {
          var tot = 0;
          $(".total").each(function () {
            tot += Number($(this).val());
          });
          $("#grand_total").val(tot);
        }
      });
    </script>


  </body>
</html>