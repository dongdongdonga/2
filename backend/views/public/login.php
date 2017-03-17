<?php

//用于创建表格的组件
use yii\bootstrap\ActiveForm;
//用于生成提交按钮
use yii\helpers\Html;
?>

<!DOCTYPE html>
<html class="login-bg">

    <head>
        <title>VITAWEB - 后台登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- bootstrap -->
        <link href="assets/css/bootstrap/bootstrap.css" rel="stylesheet" />
        <link href="assets/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
        <link href="assets/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />
        <!-- global styles -->
        <link rel="stylesheet" type="text/css" href="assets/css/layout.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/elements.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/icons.css" />
        <!-- libraries -->
        <link rel="stylesheet" type="text/css" href="assets/css/lib/font-awesome.css" />
        <!-- this page specific styles -->
        <link rel="stylesheet" href="assets/css/compiled/signin.css" type="text/css" media="screen" />
        <!-- open sans font -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>



    <body>
        <div class="row-fluid login-wrapper">
            <a class="brand" href="index.html"></a>

            <!--用ActiveForm创建登录表格-->
            <?php
            $form = ActiveForm::begin([
                        //用template去掉属性标签/显示错误信息
                        'fieldConfig' => [
                            'template' => '{input}{error}'],
            ]);
            ?>
            <div class="span4 box">
                <div class="content-wrap">
                    <h6>vitaweb - 后台管理</h6>
                    <?php
                    echo $form->field($model, 'adminuser')
                            ->textInput(["class" => "span12", "placeholder" => "占位符", 'autofocus' => true]);
                    echo $form->field($model, 'adminpass')
                            ->passwordInput(["class" => "span12", "placeholder" => "管理员密码"]);
                    ?>
                    <!--忘记密码-->
                    <a href = "<?php echo yii\helpers\Url::to(['public/seekpassword']); ?>
                       " class = "forgot">忘记密码?</a>
                    <?php
                    //记住我
                    echo $form->field($model, 'rememberMe')
                            ->checkbox([
                                'id' => 'rememberMe',
                                'template' => '<div class="remember">{input}<label for = "rememberMe">记住我</label></div></div>']);
                    //登录按钮
                    echo Html::submitButton('登录', ["class" => "btn-glow primary login"])
                    ?>
                    <?php ActiveForm::end(); ?>
                </div>
            </div>
            、

            <!-- scripts -->
            <script src="assets/js/jquery-latest.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/theme.js"></script>
            <!-- pre load bg imgs -->
            <script type="text/javascript">$(function () {
                    // bg switcher
                    var $btns = $(".bg-switch .bg");
                    $btns.click(function (e) {
                        e.preventDefault();
                        $btns.removeClass("active");
                        $(this).addClass("active");
                        var bg = $(this).data("img");

                        $("html").css("background-image", "url('img/bgs/" + bg + "')  ");
                    });

                });</script>
    </body>

</html>