<!-- main container -->
<div class="content">
    <div class="container-fluid">
        <div id="pad-wrapper" class="users-list">
            <div class="row-fluid header">
                <h3>员工信息</h3>
                <div class="span10 pull-right">
                    <a href="<?php echo yii\helpers\Url::to(['staff/create']); ?>" class="btn-flat pull-right">
                        <span>&#43;</span>添加新员工</a></div>
            </div>
            <!-- Users table -->
            <div class="row-fluid table">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="span1">ID</th>
                            <th class="span2">
                                <span class="line"></span>姓名</th>
                            <th class="span2">
                                <span class="line"></span>部门</th>
                            <th class="span2">
                                <span class="line"></span>职位</th>
                            <th class="span3">
                                <span class="line"></span>电话</th>
                            <th class="span2">
                                <span class="line"></span>QQ</th>
                            <th class="span2">
                                <span class="line"></span>在职状态</th>
                            <th class="span2">
                                <span class="line"></span>审核状态</th>
                            <th class="span2">
                                <span class="line"></span>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--将$managers循环遍历-->
                        <?php foreach ($staffs as $staff) : ?>
                            <tr>
                                <td>
                                    <?php echo $staff->id; ?>
                                </td>
                                <td>
                                    <?php echo $staff->name; ?>
                                </td>
                                <td>
                                     <?php echo $staff->department; ?>
                                </td>
                                <td>
                                    <?php echo $staff->position; ?>
                                </td>
                                <td>
                                    <?php echo $staff->mobile; ?>
                                </td>
                                <td>
                                    <?php echo $staff->QQ; ?>
                                </td>
                                <td>
                                    <?php echo $staff->state; ?>
                                </td>
                                <td>
                                    <?php echo $staff->audit; ?>
                                </td>

                                <td class="align-right">
                                    <a href="<?php
                                    echo yii\helpers\Url::to(['staff/test', 'id' => $staff->id]);
                                    ?>">查看</a>

                                <a href="<?php
                                    echo yii\helpers\Url::to(['staff/delete', 'id' => $staff->id]);
                                    ?>">删除</a></td>
                            </tr>




                        <?php endforeach; ?>
                    </tbody>
                </table>
                <?php
                if (Yii::$app->session->hasFlash('info')) {
                    echo Yii::$app->session->getFlash('info');
                }
                ?>
            </div>
            <div class="pagination pull-right">
                <?php
                echo yii\widgets\LinkPager::widget(['pagination' => $pager,
                    //按钮样式
                    'prevPageLabel' => '&#8249;', 'nextPageLabel' => '&#8250;'])
                ?>           
            </div>
        </div>
    </div>
    <!-- end main container -->