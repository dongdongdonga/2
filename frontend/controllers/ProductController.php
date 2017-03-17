<?php

namespace frontend\controllers;

class ProductController extends \yii\web\Controller {

    //商品页
    public function actionIndex() {
        $this->layout = 'layout2';
        return $this->render('index');
    }

    //商品详情页
    public function actionDetail() {
        $this->layout = 'layout2';
        return $this->render('detail');
    }

}
