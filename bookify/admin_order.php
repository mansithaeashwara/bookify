<?php
session_start();
require_once "./functions/admin.php";
$title = "Order List";
require_once "./template/header.php";
require_once "./functions/database_functions.php";
$conn = db_connect();
$result = getAllOrdersWithISBN($conn);
?>
<h4 class="fw-bolder text-center">Order List</h4>
<center>
    <hr class="bg-dark" style="width:100%;height:3px;opacity:1">
</center>
<?php if(isset($_SESSION['order_success'])): ?>
    <div class="alert alert-success rounded-0">
        <?= $_SESSION['order_success'] ?>
    </div>
    <?php
    unset($_SESSION['order_success']);
endif;
?>
<div class="card rounded-0">
    <div class="card-body">
        <div class="container-fluid">
            <table class="table table-striped table-bordered">
                <colgroup>
                    <col width="15%">
                    <col width="20%">
                    <col width="20%">
                    <col width="15%">
                    <col width="20%">
                    <col width="10%">
                    <col width="10%">
                </colgroup>
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Ship Address</th>
                    <th>Book ISBN</th>
                </tr>
                </thead>
                <tbody>
                <?php while($row = mysqli_fetch_assoc($result)){ ?>
                    <tr>
                        <td class="px-2 py-1 align-middle"><?php echo $row['orderid']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['customerid']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['customer_name']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['amount']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['date']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['ship_address']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['book_isbn']; ?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php
if(isset($conn)) {mysqli_close($conn);}
require_once "./template/footer.php";
?>



