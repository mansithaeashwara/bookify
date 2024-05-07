<?php
session_start();
require_once "./functions/database_functions.php";
$conn = db_connect();

$query = "SELECT DISTINCT book_author FROM books ORDER BY book_author";
$result = mysqli_query($conn, $query);
if(!$result){
    echo "Can't retrieve data " . mysqli_error($conn);
    exit;
}
if(mysqli_num_rows($result) == 0){
    echo "Empty author! Something wrong! Please check again.";
    exit;
}

$title = "List Of Authors";
require "./template/header.php";
?>
<div class="h5 fw-bolder text-center">List of Authors</div>
<hr>
<div class="list-group">
    <a class="list-group-item list-group-item-action" href="books.php">
        List of All Authors
    </a>
    <?php
    while($row = mysqli_fetch_assoc($result)){
        $author_name = $row['book_author'];
        $count_query = "SELECT COUNT(*) FROM books WHERE book_author='$author_name'";
        $count_result = mysqli_query($conn, $count_query);
        if(!$count_result){
            echo "Can't retrieve data " . mysqli_error($conn);
            exit;
        }
        $count_row = mysqli_fetch_assoc($count_result);
        $count = $count_row["COUNT(*)"];
        ?>
        <a class="list-group-item list-group-item-action" href="bookPerAuth.php?author=<?php echo urlencode($author_name); ?>">
            <span class="badge badge-primary bg-primary rounded-pill"><?php echo $count; ?></span>
            <?php echo $author_name; ?>
        </a>
    <?php } ?>
</div>
<?php
mysqli_close($conn);
require "./template/footer.php";
?>
