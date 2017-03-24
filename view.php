

<!-- main container -->




<div class="content">


     
 <legend>用户详细资料</legend>

        <ol>
    <div>姓名 <?php echo $staffs->name; ?></div>
     <div>部门<?php echo $staffs->department; ?></div>
     <div>职位 <?php echo $staffs->position; ?></div>
                    
    <div>电话 <?php echo $staffs->mobile; ?></div>

            <li>

                <label for="name">用户名称：</label>

                <input id="name" name="name" type="text" placeholder="请输入用户名" required autofocus>

            </li>

            <li>

                <label for="email">邮件地址：</label>

                <input id="email" name="email" type="email" placeholder="example@163.com" required>

            </li>

            <li>

                <label for="phone">联系电话：</label>

                <input id="phone" name="phone" type="tel" placeholder="010-12345678" required>

            </li>

        </ol>

    </fieldset>

    <fieldset>

        <legend>家庭住址（收货地址）：</legend>

        <ol>

            <li>

                <label for="address">详细地址：</label>

                <textarea id="address" name="address" rows="1" required></textarea>

            </li>

            <li>

                <label for="postcode">邮政编码：</label>

                <input id="postcode" name="postcode" type="text" required>

            </li>

            <li>

                <label for="country">国&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</label>

                <input id="country" name="country" type="text" required>

            </li>

        </ol>

    </fieldset>

    <fieldset>

        <legend>付费方式</legend>

        <ol>

            <li>

                <fieldset>

                    <legend>信用卡类型</legend>

                    <ol>

                        <li>

                            <input id="visa" name="cardtype" type="radio">

                            <label for="visa">中国工商银行</label>

                        </li>

                        <li>

                            <input id="amex" name="cardtype" type="radio">

                            <label for="amex">中国人民银行</label>

                        </li>

                        <li>

                            <input id="mastercard" name="cardtype" type="radio">

                            <label for="mastercard">中国建设银行</label>

                        </li>

                    </ol>

                </fieldset>

            </li>

            <li>

                <label for="cardnumber">银行卡号：</label>

                <input id="cardnumber" name="cardnumber" type="number" required>

            </li>

            <li>

                <label for="secure">验 证 码：</label>

                <input id="secure" name="secure" type="number" required>

            </li>

            <li>

                <label for="namecard">持 卡 人：</label>

                <input id="namecard" name="namecard" type="text" placeholder="确定是否该卡用户！" required>

            </li>

        </ol>

    </fieldset>

    <fieldset>

        <button type="submit">现在购买</button>

    </fieldset>

</form>
