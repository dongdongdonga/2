<?php

namespace frontend\controllers;

class OrderController extends \yii\web\Controller
{
    public function actionCheck()
    {
        $this->layout='layout1';
        return $this->render('check');
    }

    public function actionIndex()
    {
         $this->layout='layout1';
        return $this->render('index');
    }

}
