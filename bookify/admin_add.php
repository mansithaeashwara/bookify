<?php
session_start();
require_once "./functions/admin.php";
$title = "Add new book";
require "./template/header.php";
require "./functions/database_functions.php";
$conn = db_connect();

if(isset($_POST['add'])){
    $isbn = trim($_POST['isbn']);
    $isbn = mysqli_real_escape_string($conn, $isbn);

    $title = trim($_POST['title']);
    $title = mysqli_real_escape_string($conn, $title);

    $author = trim($_POST['author']);
    $author = mysqli_real_escape_string($conn, $author);

    $descr = trim($_POST['descr']);
    $descr = mysqli_real_escape_string($conn, $descr);

    $price = floatval(trim($_POST['price']));
    $price = mysqli_real_escape_string($conn, $price);

    $publisher = trim($_POST['publisher']);
    $publisher = mysqli_real_escape_string($conn, $publisher);

// add image
    if(isset($_FILES['image']) && $_FILES['image']['name'] != ""){
        $image = $_FILES['image']['name'];
        $directory_self = str_replace(basename($_SERVER['PHP_SELF']), '', $_SERVER['PHP_SELF']);
        $uploadDirectory = $_SERVER['DOCUMENT_ROOT'] . $directory_self . "bootstrap/img/";
        $uploadDirectory .= $image;
        move_uploaded_file($_FILES['image']['tmp_name'], $uploadDirectory);
    }

// Check if the publisher already exists in the database
    $query = "SELECT * FROM publisher WHERE publisher_name = '$publisher'";
    $result = mysqli_query($conn, $query);
    if(mysqli_num_rows($result) > 0){
        $row = mysqli_fetch_assoc($result);
        $publisherid = $row['publisherid'];
    } else {
// If the publisher doesn't exist, insert it into the database
        $insert_query = "INSERT INTO publisher (publisher_name) VALUES ('$publisher')";
        $insert_result = mysqli_query($conn, $insert_query);
        if($insert_result){
            $publisherid = mysqli_insert_id($conn);
        } else {
            $err = "Can't add new publisher: " . mysqli_error($conn);
        }
    }

    $query = "INSERT INTO books (`book_isbn`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `publisherid`) VALUES ('$isbn', '$title', '$author', '$image', '$descr', '$price', '$publisherid')";
    $result = mysqli_query($conn, $query);
    if($result){
        $_SESSION['book_success'] = "New Book has been added successfully";
        header("Location: admin_book.php");
    } else {
        $err =  "Can't add new data " . mysqli_error($conn);
    }
}
?>
<h4 class="fw-bolder text-center">Add a New Book</h4>
<center>
    <hr class="bg-dark" style="width:100%;height:3px;opacity:1">
</center>
<div class="row justify-content-center">
    <div class="col-lg-6 col-md-8 col-sm-10 col-xs-12">
        <div class="card rounded-0 shadow">
            <div class="card-body">
                <div class="container-fluid">
                    <?php if(isset($err)): ?>
                        <div class="alert alert-danger rounded-0">
                            <?= $_SESSION['err_login'] ?>
                        </div>
                    <?php endif; ?>
                    <form method="post" action="admin_add.php" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="control-label">ISBN</label>
                            <input class="form-control rounded-0" type="text" name="isbn">
                        </div>
                        <div class="mb-3">
                            <label class="control-label">Title</label>
                            <input class="form-control rounded-0" type="text" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label class="control-label">Author</label>
                            <input class="form-control rounded-0" type="text" name="author" required>
                        </div>

                        <div class="mb-3">
                            <label class="control-label">Image</label>
                            <input class="form-control rounded-0" type="file" name="image">
                        </div>
                        <div class="mb-3">
                            <label class="control-label">Description</label>
                            <textarea class="form-control rounded-0" name="descr" cols="40" rows="5"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="control-label">Price ($)</label>
                            <input class="form-control rounded-0" type="text" name="price" required>
                        </div>

                        <div class="mb-3">
                            <label class="control-label">Publisher</label>
                            <input class="form-control rounded-0" type="text" name="publisher" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" name="add"  class="btn btn-primary btn-sm rounded-0">Save</button>
                            <button type="reset" class="btn btn-default btn-sm rounded-0 border">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
if(isset($conn)) {mysqli_close($conn);}
require_once "./template/footer.php";
?>
