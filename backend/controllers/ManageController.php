<?php

namespace backend\controllers;

use Yii;
use yii\web\Controller;
use app\models\ShopAdmin;
use yii\data\Pagination;

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
                Yii::$app->session->setFlash('info', '密码修改成功');
            }
        }


        $model->adminuser = $adminuser;
        return $this->render('mailchangepass', ['model' => $model]);
    }

    public function actionManagers() {
        $this->layout = 'layout1';
        $model = ShopAdmin::find();
        //数据总数
        $count = $model->count();
        //分页处理,需要在配置文件params中设置params.php
        $pageSize = Yii::$app->params['pageSize']['manage'];
        $pager = new Pagination(['totalCount' => $count, 'pageSize' => $pageSize]);
        $managers = $model->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('managers', ['managers' => $managers, 'pager' => $pager]);
    }

//新建管理员
    public function actionReg() {
        $this->layout = 'layout1';
        $model = new ShopAdmin;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->reg($post)) {
                Yii::$app->session->setFlash('info', '添加成功');
            } else {
                Yii::$app->session->setFlash('info', '添加失败');
            }
        }
        //创建完管理员则清空密码行（为了美观）
        $model->adminpass = '';
        $model->repass = '';
        return $this->render('reg', ['model' => $model]);
    }

    //删除管理员
    public function actionDel() {
        //强转为int的adminid
        $adminid = (int) Yii::$app->request->get('adminid');
        if (empty($adminid)) {
            $this->redirect(['manage/managers']);
        }
        $model = new ShopAdmin();
        if ($model->deleteAll('adminid = :id', [':id' => $adminid])) {
            Yii::$app->session->setFlash('info', '删除成功');
            $this->redirect(['manage/managers']);
        }
    }

}
