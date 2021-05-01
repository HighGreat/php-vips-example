<?php

require __DIR__ . '/vendor/autoload.php';

use Jcupitt\Vips;

$image_path = $_FILES['image']['tmp_name'];

$image = Vips\Image::thumbnail($image_path, 600);

header('Content-Type: image/webp');

$resized = $image->writeToBuffer('.jpeg', [
  'Q' => 85,
]);

echo $resized;
