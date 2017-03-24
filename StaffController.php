<?php

namespace backend\controllers;

use Yii;
use common\models\Stafftbl;
use yii\web\Controller;
use yii\data\Pagination;

class StaffController extends Controller {

    public function actionChangepwd() {
        $this->layout = false;
//接收到的Token
        $time = Yii::$app->request->get("timestamp");
        $mobile = Yii::$app->request->get("mobile");
        $token = Yii::$app->request->get("token");
//系统生成的Token
        $model = new Stafftbl;
        $mytoken = $model->createToken($mobile, $time);
        if ($token != $mytoken) {
            $this->redirect(['staff/login']);
            Yii::$app->end();
        }
//如果当前时间减$time，大于300s，即超过5min连接实效
        if (time() - $time > 300) {
            $this->redirect(['staff/login']);
            Yii::$app->end();
        }
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->changePwd($post)) {
                Yii::$app->session->setFlash('info', '密码修改成功');
            }
        }
    }

//staff列表
    public function actionIndex() {
        $this->layout = 'layout1';
        $model = Stafftbl::find();
//数据总数
        $count = $model->count();
//分页处理,需要在配置文件params中设置params.php
        $pageSize = Yii::$app->params['pageSize']['staff'];
        $pager = new Pagination(['totalCount' => $count, 'pageSize' => $pageSize]);
        $staffs = $model->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('index', ['staffs' => $staffs, 'pager' => $pager]);
    }

//新建员工
    public function actionCreate() {
        $this->layout = 'layout1';
        $model = new Stafftbl;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->create($post)) {
                Yii::$app->session->setFlash('info', '添加成功');
            } else {
                Yii::$app->session->setFlash('info', '添加失败');
            }
        }







//创建完管理员则清空密码行（为了美观）
        $model->login_pwd = '';
        $model->repwd = '';
        return $this->render('create', ['model' => $model]);
    }


    public function actionView()
    {
        $this->layout = 'layout1';
        $model = new Stafftbl();
        $staff = Stafftbl::find()->all();
        $id = (int) Yii::$app->request->get('id');



        return $this->render('view', ['staff' => $staff,
            'model' => $this->redirect($id),]);




    }
    public function actionTest()
    {
        $id = (int) Yii::$app->request->get('id');
        if (empty($id)) {
            $this->redirect(['staff/index']);
        }
        $model = new Stafftbl();
        $this->layout = 'layout1';

        $staffs = $model::findOne($id);

        return $this->render('view', ['staffs' => $staffs,
            ]);
    }



    }








