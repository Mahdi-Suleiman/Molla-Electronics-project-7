<?php
include('../../admin/config/server.php');

if (($_SESSION['Role']) != 1) {
    $_SESSION['msg'] = "You must log in first";
    echo "<script>alert('You must log in first');</script>";

    header('location: ../../login.php');
}

//get all users from database
$sql = $pdo->prepare('SELECT * FROM users ORDER BY id');
$sql->execute();
$users = $sql->fetchAll(PDO::FETCH_ASSOC);

if (isset($_GET['logout'])) {
    session_destroy();
    unset($_SESSION['name']);
    header("location: ../../login.php");
}
?>

<?php include '../layout/header.php' ?>

        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row m-t-25">
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c1">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-account-o"></i>
                                        </div>
                                        <div class="text">
                                            <h2><?php
                                                $stmt = $pdo->prepare('SELECT * FROM users ORDER BY id DESC');
                                                $num_users = $pdo->query('SELECT COUNT(*) FROM users')->fetchColumn();
                                                $stmt->execute();
                                                $num_contacts = $stmt->rowCount();
                                                echo $num_users;
                                                ?></h2>
                                            <span>Users</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart1"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c2">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-shopping-cart"></i>
                                        </div>
                                        <div class="text">
                                            <h2>
                                                <?php
                                                $stmt = $pdo->prepare('SELECT * FROM products ORDER BY id DESC');
                                                $num_products = $pdo->query('SELECT COUNT(*) FROM products')->fetchColumn();
                                                $stmt->execute();
                                                $num_products = $stmt->rowCount();
                                                echo $num_products;
                                                ?>
                                            </h2>
                                            <span>Products</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart2"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c3">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-calendar-note"></i>
                                        </div>
                                        <div class="text">
                                            <h2><?php
                                                $stmt = $pdo->prepare('SELECT * FROM categories ORDER BY id DESC');
                                                $num_categories = $pdo->query('SELECT COUNT(*) FROM categories')->fetchColumn();
                                                $stmt->execute();
                                                $num_categories = $stmt->rowCount();
                                                echo $num_categories;
                                                ?></h2>
                                            <span>Categories</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart3"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c4">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-money"></i>
                                        </div>
                                        <div class="text">
                                            <h2>$1,060,386</h2>
                                            <span>total earnings</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart4"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <div class="overview-wrap">
                                <h2 class="title-1">Users</h2>
                                <a href="create_user.php" class="au-btn au-btn-icon au-btn--blue">
                                    <i class="zmdi zmdi-plus"></i>Add User</a>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th class="text-right">Role</th>
                                        <th>Control</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ($users as $user): ?>
                                        <tr>
                                            <td><?=$user['id']?></td>
                                            <td><?=$user['name']?></td>
                                            <td><?=$user['email']?></td>
                                            <td class="text-right"><?php if ($user['role'] == 1): ?>
                                                    <span class="badge badge-success">Admin</span>
                                                <?php else: ?>
                                                    <span class="badge badge-danger">User</span>
                                                <?php endif; ?>
                                            </td>
                                            <td class="actions">
                                                <a href="edit.php?id=<?=$user['id']?>" class="edit"><i class="fas fa-pencil-alt"></i></a>
                                                <a href="delete.php?id=<?=$user['id']?>" class="trash text-danger"><i class="fas fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="copyright">
                                <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
<?php include '../layout/footer.php' ?>