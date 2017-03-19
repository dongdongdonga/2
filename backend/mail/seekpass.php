<p>Hi~!!!<?php echo $adminuser; ?></p>
<p>click thie url below:</p>
<?php
//创建绝对路径,路由r=manege/mailchangepass
$url = Yii::$app->urlManager->createAbsoluteUrl([
    'manage/mailchangepass', 'timestamp' => $time, 'adminuser' => $adminuser, 'token' => $token]);
?>
<p><a href="<?php echo $url; ?>"><?php echo $url; ?></a></p>
