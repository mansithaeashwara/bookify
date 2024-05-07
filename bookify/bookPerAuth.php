<?php
session_start();
require_once "./functions/database_functions.php";
// get author
if(isset($_GET['author'])){
$author = $_GET['author'];
} else {
echo "Wrong query! Check again!";
exit;
}

// connect database
$conn = db_connect();

$query = "SELECT book_isbn, book_title, book_image, book_descr, publisherid FROM books WHERE book_author = '$author'";
$result = mysqli_query($conn, $query);
if(!$result){
echo "Can't retrieve data " . mysqli_error($conn);
exit;
}
if(mysqli_num_rows($result) == 0){
echo "No books found for this author!";
exit;
}

$title = "Books Per Author";
require "./template/header.php";
?>
<style>
    .book-item .img-holder {
        height: 20em;
    }
    .book-item:nth-child(even){
        direction: rtl !important;
    }
</style>
<p class="lead"><a href="author_list.php">Authors</a> > <?php echo $author; ?></p>
<div id="authBooks">
    <?php while($row = mysqli_fetch_assoc($result)){
        $pubid = $row['publisherid'];
        $pubName = getPubName($conn, $pubid);
        ?>
        <div class="row book-item mb-2">
            <div class="col-md-3">
                <div class="img-holder overflow-hidden">
                    <img class="img-top" src="./bootstrap/img/<?php echo $row['book_image'];?>">
                </div>
            </div>
            <div class="col-md-9">
                <h4><?php echo $row['book_title'];?></h4>
                <hr>
                <p class="truncate-5"><?= $row['book_descr'] ?></p>
                <p>Published by: <?php echo $pubName; ?></p>
                <a href="book.php?bookisbn=<?php echo $row['book_isbn'];?>" class="btn btn-primary">Get Details</a>
            </div>
        </div>
        <?php
    }
    ?>
</div>
<?php
if(isset($conn)) { mysqli_close($conn);}
require "./template/footer.php";
