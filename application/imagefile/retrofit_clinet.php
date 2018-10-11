<?php
$target_dir = "uploads/";
$target_file_name = $target_dir.basename($_FILES['file']['name']);
$response = array();

if(isset($_FILES['file'])){
	if(move_uploaded_file($_FILES['file']['name'], $target_file_name)){
		$success = true;
		$message = "Successfully Uploaded";
	}else{
		$success = false;
		$message = "Not Uploaded";
	}
}else{
	$success = false;
	$message = "Required filed is empty";
}

$response['success'] = $success;
$response['message'] = $message;

echo json_encode($response);
?>