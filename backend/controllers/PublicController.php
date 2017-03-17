<?php

namespace backend\controllers;

use Yii;
use app\models\ShopAdmin;

class PublicController extends \yii\web\Controller {

    public function actionLogin() {

        $this->layout = false;
        //在控制器中连接数据库
        $model = new ShopAdmin();

        //管理员登录：如果是post方法提交，则用post方法接受数据
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            //用login方法（在model中声明）将post数据传递到model中
            //如果返回true，则返回default/index页面
            if ($model->login($post)) {
                $this->redirect(['default/index']);
                Yii::$app->end();
            }
        }
        return $this->render('login', ['model' => $model]);
    }

    public function actionLogout() {
        //清除sesseion  
        Yii::$app->session->removeAll();
        //如果igLogin已经不存在，跳转public/login页面
        if (!isset(Yii::$app->session['admin']['isLogin'])) {
            $this->redirect(['public/login']);
            Yii::$app->end();
        }
        //否则跳回来的页面
        $this->goBack();
    }

    public function actionSeekpassword() {
        $this->layout = false;
        //在控制器中连接数据库
        $model = new ShopAdmin();
        
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            $model->seekPass($post);
        }
        
        return $this->render("seekpassword", ['model' => $model]);
    }

}
