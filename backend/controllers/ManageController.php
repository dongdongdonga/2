<?php

namespace backend\controllers;

use Yii;
use yii\web\Controller;
use app\models\ShopAdmin;

class ManageController extends Controller {

    public function actionMailchangepass() {
        $this->layout = false;
        //接收到的Token
        $time = Yii::$app->request->get("timestamp");
        $adminuser = Yii::$app->request->get("adminuser");
        $token = Yii::$app->request->get("token");
        //系统生成的Token
        $model = new ShopAdmin;
        $mytoken = $model->createToken($adminuser, $time);
        if ($token != $mytoken) {
            $this->redirect(['punlic/login']);
            Yii::$app->end();
        }
        //如果当前时间减$time，大于300s，即超过5min连接实效
        if (time() - $time > 300) {
            $this->redirect(['public/login']);
            Yii::$app->end();
        }
        //是否成功按照model中changePass修改密码
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->changePass($post)) {
                Yii::$app->session->setFlash('info','密码修改成功');
            }
        }


        $model->adminuser = $adminuser;
        return $this->render('mailchangepass', ['model' => $model]);
    }

}
