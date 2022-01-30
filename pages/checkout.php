<?php
require("../admin/config/connection.php");
try {
  $user_id = $_SESSION["id"];
  $_command = "SELECT * FROM tempcart WHERE user_id='$user_id'";
  $tempcart = $pdo->prepare($_command);
  $tempcart->execute();
  $tempcart->setFetchMode(PDO::FETCH_ASSOC);
  $results = $tempcart->fetchAll();
  $superTotal = 0;
  if ($tempcart->rowCount()) {
    echo "<pre>";
    // var_dump($results);
    echo "</pre>";
  } else {
    echo "fail";
  }
} catch (PDOException $e) {
  echo "error" . $e->getMessage();
}

function mahdiReload()
{
  echo "<script> window.location.reload();</script>";
  // echo `<meta http-equiv="Location" content="./cart.php">`;
  // echo header("Refresh:0");
}
function mahdiStopReload()
{
  echo "<script> window.stop();</script>";
}

?>
<?php include("../components/Navbar.php"); ?>

    <main class="main">
      <div class="page-header text-center" style="background-image: url('../assets/images/page-header-bg.jpg')">
        <div class="container">
          <h1 class="page-title">Checkout<span>Shop</span></h1>
        </div><!-- End .container -->
      </div><!-- End .page-header -->
      <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Shop</a></li>
            <li class="breadcrumb-item active" aria-current="page">Checkout</li>
          </ol>
        </div><!-- End .container -->
      </nav><!-- End .breadcrumb-nav -->

      <div class="page-content">
        <div class="checkout">
          <div class="container">

            <!-- mahdi -->
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">
              <?php if (isset($_SESSION['success'])) { ?>
                <div class="row">
                  <div class="col-lg-9">
                    <h2 class="checkout-title">Billing Details</h2><!-- End .checkout-title -->
                    <div class="row">
                      <div class="col-sm-6">
                        <label>First Name *</label>
                        <input type="text" name="firstname" class="form-control" required>
                      </div><!-- End .col-sm-6 -->

                      <div class="col-sm-6">
                        <label>Last Name *</label>
                        <input type="text" name="lastname" class="form-control" required>
                      </div><!-- End .col-sm-6 -->
                    </div><!-- End .row -->
                    <label>Email address *</label>
                    <input type="email" name="email" class="form-control" required>

                    <label>Country *</label>
                    <input type="text" name="country" class="form-control" required>

                    <label>Street address *</label>
                    <input type="text" name="streetaddress" class="form-control" placeholder="House number and Street name" required>


                    <div class="row">
                      <div class="col-sm-6">
                        <label>Postcode / ZIP *</label>
                        <input type="text" name="postcode" class="form-control" required>
                      </div><!-- End .col-sm-6 -->

                      <div class="col-sm-6">
                        <label>Phone *</label>
                        <input type="tel" name="phone" class="form-control" required>
                      </div><!-- End .col-sm-6 -->
                    </div><!-- End .row -->

                  </div><!-- End .col-lg-9 -->
                  <aside class="col-lg-3">
                    <div class="summary">
                      <h3 class="summary-title">Your Order</h3><!-- End .summary-title -->

                      <table class="table table-summary">
                        <thead>
                          <tr>
                            <th>Product</th>
                            <th>Total</th>
                          </tr>
                        </thead>

                        <tbody>
                          <?php
                          for ($i = 0; $i < $tempcart->rowCount(); $i++) {
                          ?>
                            <tr>
                              <td><a><?php echo $results[$i]['name']; ?></a></td>
                              <td>$<?php echo $results[$i]['final_price']; ?></td>
                            </tr>
                          <?php } ?>
                          <!-- <tr>
                                                    <td><a href="#">Blue utility pinafore denimdress</a></td>
                                                    <td>$76,00</td>
                                                </tr> -->
                          <tr class="summary-subtotal">
                            <td>Subtotal:</td>
                            <td>$<?php echo $_SESSION['supertotal']; ?></td>
                          </tr><!-- End .summary-subtotal -->
                          <tr>
                            <td>Shipping:</td>
                            <td>Free shipping</td>
                          </tr>
                          <tr class="summary-total">
                            <td>Total:</td>
                            <td>$<?php echo $_SESSION['supertotal']; ?></td>
                          </tr><!-- End .summary-total -->
                        </tbody>
                      </table><!-- End .table table-summary -->

                      <div class="accordion-summary" id="accordion-payment">
                        <div class="card">
                          <!-- <div class="card-header" id="heading-2">
                                                    <h2 class="card-title">
                                                        <a class="collapsed" role="button" data-toggle="collapse"
                                                            href="#collapse-2" aria-expanded="false"
                                                            aria-controls="collapse-2">
                                                            Check payments
                                                        </a>
                                                    </h2>
                                                </div> -->
                          <div id="collapse-2" class="collapse" aria-labelledby="heading-2" data-parent="#accordion-payment">
                            <div class="card-body">
                              Ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio.
                              Quisque volutpat mattis eros. Nullam malesuada erat ut turpis.
                            </div><!-- End .card-body -->
                          </div><!-- End .collapse -->
                        </div><!-- End .card -->

                        <div class="card">
                          <div class="card-header" id="heading-3">
                            <h2 class="card-title">
                              <a class="collapsed" role="button" data-toggle="collapse" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
                                Cash on delivery
                              </a>
                            </h2>
                          </div><!-- End .card-header -->
                          <div id="collapse-3" class="collapse" aria-labelledby="heading-3" data-parent="#accordion-payment">
                            <div class="card-body">Quisque volutpat mattis eros. Lorem ipsum
                              dolor sit amet, consectetuer adipiscing elit. Donec odio.
                              Quisque volutpat mattis eros.
                            </div><!-- End .card-body -->
                          </div><!-- End .collapse -->
                        </div><!-- End .card -->
                      </div>

                      <button type="submit" name="checkout-form" class="btn btn-outline-primary-2 btn-order btn-block">
                        <span class="btn-text">Place Order</span>
                        <span class="btn-hover-text">Proceed to Checkout</span>
                      </button>
                    </div><!-- End .summary -->
                  </aside><!-- End .col-lg-3 -->
                </div><!-- End .row -->
              <?php } else {  ?>
                <div> you are not not logged in </div>
              <?php } ?>
            </form>
          </div><!-- End .container -->
        </div><!-- End .checkout -->
      </div><!-- End .page-content -->
    </main><!-- End .main -->

<?php include("../components/Footer.php"); ?>


<?php
// mahdialert("outside if");
if (isset($_POST['checkout-form'])) {
  // mahdialert("inside if");

  $user_id = $_SESSION['id']; #user id
  // $user_id = 2; #user id
  $totalprice = $_SESSION['supertotal']; #total price
  $order_id;
  try {
    $sqlCommand = "INSERT INTO orders (user_id , total) VALUES ('$user_id', '$totalprice')";
    $pdo->exec($sqlCommand);
    echo mahdialert("New order created successfully");

    // echo "New record created successfully";
    // header("Location: ./index.php");
  } catch (PDOException $e) {
    #email duplicate
    // $emailError = "php error: email already exist";
    echo "error" . $e;
  }
  try {
    // echo mahdialert("inside try");

    $_command = "SELECT * FROM orders";
    $statement = $pdo->prepare($_command);
    $statement->execute();
    $statement->setFetchMode(PDO::FETCH_ASSOC);
    $order = $statement->fetchAll();
    $order_id = $order[$statement->rowCount() - 1]['id']; #get latest order id 
  } catch (PDOException $e) {
    echo "error" . $e->getMessage();
  }

  $firstname = $_POST['firstname'];
  $lastname = $_POST['lastname'];
  $email = $_POST['email'];
  $country = $_POST['country'];
  $streetaddress = $_POST['streetaddress'];
  $postcode = $_POST['postcode'];
  $phone = $_POST['phone'];

  for ($i = 0; $i < $tempcart->rowCount(); $i++) {

    $product_id = $results[$i]['product_id'];
    $quantity = $results[$i]['quantity'];
    $final_price = $results[$i]['final_price'];


    $sql1 = $pdo->prepare("SELECT stock FROM products WHERE id='$product_id'");
    $sql1->execute();
    $data = $sql1->fetch(PDO::FETCH_ASSOC);
    $prevStock = $data["stock"];
    $newStock = $prevStock - $quantity;

    try {
      $sqlCommand = "INSERT INTO items_checkout (products_id, quantity, final_price, orders_id, user_id, firstname, lastname, email, country, street_address, postcode, phone) VALUES ('$product_id', '$quantity', '$final_price', '$order_id', '$user_id', '$firstname', '$lastname', '$email', '$country', '$streetaddress', '$postcode', '$phone')";
      $pdo->exec($sqlCommand);

      $sql = "UPDATE products SET stock = :newStock WHERE id = :product_id";
      $stmt = $pdo->prepare($sql);
      $stmt->bindParam(':newStock', $newStock);
      $stmt->bindParam(':product_id', $product_id);
      $stmt->execute();
    } catch (PDOException $e) {
      echo "error" . $e;
    }
  }
  header("Location: ../index.php");
}


function mahdialert($message)
{
  echo "<script>alert('$message');</script>";
}
?>