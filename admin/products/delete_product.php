<?php
include('../../admin/config/server.php');

if (($_SESSION['Role']) != 1) {
    $_SESSION['msg'] = "You must log in first";
    echo "<script>alert('You must log in first');</script>";

    header('location: ../../login.php');
}

$msg = '';
$delete_products_errors = array();

if (isset($_GET['id'])) {
    // Select the record that is going to be deleted
    $stmt = $pdo->prepare('SELECT * FROM products WHERE id = ?');
    $stmt->execute([$_GET['id']]);
    $product = $stmt->fetch();
    if (!$product) {
        exit('Contact doesn\'t exist with that ID!');
    }
    if (isset($_GET['confirm']) && empty($delete_products_errors)) {
        if ($_GET['confirm'] == 'yes') {
            // User clicked the "Yes" button, delete record
            $stmt = $pdo->prepare('DELETE FROM products WHERE id = ?');
            $stmt->execute([$_GET['id']]);
            $msg = 'You have deleted the contact!';
            header('Location: ./index.php');

        } else {
            // User clicked the "No" button, redirect them back to the read page
            header('Location: ./index.php');
            exit;
        }
    }
} else {
    exit('No ID specified!');
}
?>
<?php include '../layout/header.php' ?>

        <div class="container pt-5 mt-5">
            <div class="row">
                <div class="col-lg-9">
                    <div class="card">
                        <div class="card-header">
                            <h2>Delete Product #<?=$product['id']?></h2>
                        </div>
                        <?php if ($msg)  : ?>
                            <div class='alert alert-danger  d-flex align-items-center justify-content-center'><?=$msg?></div>
                        <?php else: ?>

                            <div class="confirm-delete">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div>
                                            <label class="p-5 font-weight-bold font-size-10">Are you sure want to delete this Product <?=$product['id']?>?</label>

                                            <a class="btn btn-danger mr-2" href="delete_product.php?id=<?=$product['id']?>&confirm=yes">Yes</a>
                                            <a class="btn btn-primary " href="delete_product.php?id=<?=$product['id']?>&confirm=no">No</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                        <?php
                        //errors printing
                        if (isset($delete_products_errors) && !empty($delete_products_errors)) {

                            foreach ($delete_products_errors as $error) {
                                echo '<p class="alert alert-danger  d-flex align-items-center justify-content-center">' . $error . '</p>';
                            }

                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include '../layout/footer.php' ?>
