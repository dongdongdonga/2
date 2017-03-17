<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "shop_admin".
 *
 * @property integer $adminid
 * @property string $adminuser
 * @property string $adminpass
 * @property string $adminemail
 * @property integer $logintime            
 * @property integer $loginip
 * @property integer $createtime
 */
class ShopAdmin extends \yii\db\ActiveRecord {

//为“记住我“创建一个新的方法,并且默认打开
    public $rememberMe = true;

//（gii）连接数据库中的表shop_admin
    public static function tableName() {
        return 'shop_admin';
    }

    //提交到数据库前执行简单的验证
    public function rules() {
        return [
            ['adminuser', 'required', 'message' => '管理员帐号不能为空',
                //指定验证规则启用的场景
                'on' => ['login', 'seekpass']],
            ['adminpass', 'required', 'message' => '管理员密码不能为空', 'on' => 'login'],
            ['rememberMe', 'boolean', 'on' => 'login'],
            ['adminpass', 'validatePass', 'on' => 'login'],
            ['adminemail', 'required', 'message' => '邮箱不能为空', 'on' => 'seekpass'],
            ['adminemail', 'email', 'message' => '邮箱格式不正确', 'on' => 'seekpass'],
            ['adminemail', 'validateEmail', 'on' => 'seekpass']
        ];
    }

    public function validatePass() {
        //判断之前是否有错误，再查询adminuser及adminpass
        if (!$this->hasErrors()) {
            //用索引adminuser+adminpass
            $data = self::find()->where('adminuser= :user and adminpass = :pass', [
                        ":user" => $this->adminuser, ":pass" => md5($this->adminpass)
                    ])->one();

            //根据$data返回类型判断，为空报错
            if (is_null($data)) {
                $this->addError("adminpass", "用户名或密码错误");
            }
        }
    }

    public function validateEmail() {
        if (!$this->hasErrors()) {
            $data = self::find()->where('adminuser = :user and adminemail = :email', [
                        ":user" => $this->adminuser, ":email" => $this->adminemail])
                    ->one();
            if (is_null($data)) {
                $this->addError("adminemail", "帐号邮箱不匹配");
            }
        }
    }

    public function login($data) {
        //场景声明，场景不同验证规则不同
        $this->scenario = "login";

        //如果载入成功并且验证成功,validate指rules的验证
        if ($this->load($data) && $this->validate()) {

            //勾选‘记住我’则设置session有效期为lifetime）
            $session = Yii::$app->session;
            $lifetime = $this->rememberMe ? 24 * 3600 : 0;
            session_set_cookie_params($lifetime);

            //写入session
            $session['admin'] = ['adminuser' => $this->adminuser,
                'isLogin' => 1,];

            //更新登录时间/IP
            $this->updateAll(['logintime' => time(), 'loginip' => ip2long(Yii::$app->request->userIP)], 'adminuser= :user', [':user' => $this->adminuser]);

            //写入成功与否，返回 强转为bool 的类型
            return (bool) $session['admin']['isLogin'];
        }
        return FALSE;
    }

    public function seekPass($data) {
        $this->scenario = 'seekpass';
        if ($this->load($data) && $this->validate()) {
            //发送邮件
            Yii::$app->mailer->compose('contact/html', ['contactForm' => $form])
                    ->setFrom('from@domain.com')
                    ->setTo($form->email)
                    ->setSubject($form->subject)
                    ->send();
        }
    }

    public function attributeLabels() {
        return [
            'adminid' => '主键ID',
            'adminuser' => '管理员帐号',
            'adminpass' => '管理员密码',
            'adminemail' => '管理员邮箱',
            'logintime' => '登录时间',
            'loginip' => '登录IP',
            'createtime' => '创建时间',
        ];
    }

}
