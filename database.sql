-- phpMyAdmin SQL Dump
-- version 4.7.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-03-21 09:23:58
-- 服务器版本： 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `煤金网`
--

-- --------------------------------------------------------

--
-- 表的结构 `buyer_certificatetbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `buyer_certificatetbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_path` varchar(32) NOT NULL COMMENT '凭证路径',
  `certificate_name` varchar(32) NOT NULL COMMENT '凭证名称',
  `certificate_type_id` int(11) NOT NULL COMMENT '凭证类型id',
  `gmt_create` int(11) NOT NULL COMMENT '上传时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='凭证表（买家）';

-- --------------------------------------------------------

--
-- 表的结构 `certificate_typetbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `certificate_typetbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_type` varchar(32) NOT NULL COMMENT '凭证类型',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='凭证类型表';

-- --------------------------------------------------------

--
-- 表的结构 `coal_demandtbl`
--
-- 创建时间： 2017-03-21 01:22:58
-- 最后更新： 2017-03-21 01:22:58
--

CREATE TABLE IF NOT EXISTS `coal_demandtbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coal_type` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '煤种',
  `coal_name` varchar(30) DEFAULT NULL COMMENT '品名',
  `origin` varchar(255) DEFAULT NULL COMMENT '产地',
  `delivery_method` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '提货方式',
  `demand_quantity` int(8) UNSIGNED DEFAULT NULL COMMENT '需求数量',
  `payment` tinyint(4) DEFAULT NULL COMMENT '付款方式',
  `deadline` int(11) UNSIGNED DEFAULT NULL COMMENT '报名截止日',
  `transportation` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '运输方式',
  `delivery_place` varchar(255) NOT NULL COMMENT '提货地点',
  `delivery_time` int(11) DEFAULT NULL COMMENT '提货时间',
  `low_calValue` int(6) UNSIGNED DEFAULT NULL COMMENT '低拉热值',
  `air_sulfur` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '收到基硫分',
  `air_drySulfur` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '空干基硫分',
  `granularity` varchar(24) DEFAULT NULL COMMENT '颗粒度',
  `airdry_volatile` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '空干基挥发分',
  `arb_sulfur` varchar(24) NOT NULL COMMENT '收到基挥发分',
  `fixed_carbon` varchar(24) DEFAULT NULL,
  `total_moisture` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '全水分',
  `inner_moisture` varchar(24) DEFAULT NULL COMMENT '内水分',
  `G_value` varchar(24) DEFAULT NULL COMMENT 'G值',
  `Y_value` varchar(24) DEFAULT NULL COMMENT 'Y值',
  `fusibility` varchar(24) DEFAULT NULL COMMENT '灰熔点',
  `ash_content` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '灰分',
  `hardgrove` varchar(24) DEFAULT NULL COMMENT '哈氏可磨',
  `char_characteristic` varchar(24) DEFAULT NULL COMMENT '焦渣特征',
  `remark` text COMMENT '备注',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `coal_ordertbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `coal_ordertbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penalty` decimal(10,0) NOT NULL COMMENT '违约金',
  `coal_charge` decimal(10,0) NOT NULL COMMENT '买煤费用',
  `truck_charge` decimal(10,0) NOT NULL COMMENT '汽运费用',
  `train_charge` decimal(10,0) NOT NULL COMMENT '铁路费用',
  `deposit` decimal(10,0) NOT NULL COMMENT '担保费用',
  `gmt_create` int(11) NOT NULL COMMENT '创建时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL COMMENT '伪删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='煤炭交易订单表';

-- --------------------------------------------------------

--
-- 表的结构 `coal_products`
--
-- 创建时间： 2017-03-21 01:22:58
-- 最后更新： 2017-03-21 01:22:58
--

CREATE TABLE IF NOT EXISTS `coal_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coal_type` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '煤种',
  `coal_name` varchar(30) DEFAULT NULL COMMENT '品名',
  `origin` varchar(255) DEFAULT NULL COMMENT '产地',
  `low_calValue` int(6) UNSIGNED DEFAULT NULL COMMENT '低拉热值',
  `ar_sulfur` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '收到基硫分',
  `air_dry_sulfur` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '空干基硫分',
  `granularity` varchar(24) DEFAULT NULL COMMENT '颗粒度',
  `air_dry_volatile` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '空干基挥发分',
  `arb_sulfur` varchar(24) DEFAULT NULL COMMENT '收到基挥发分',
  `fixed_carbon` varchar(24) DEFAULT NULL COMMENT '固定碳',
  `total_moisture` tinyint(4) DEFAULT NULL COMMENT '全水分',
  `inner_moisture` varchar(24) DEFAULT NULL COMMENT '内水分',
  `G_value` varchar(24) DEFAULT NULL COMMENT 'G值',
  `Y_value` varchar(24) DEFAULT NULL COMMENT 'Y值',
  `fusibility` varchar(24) DEFAULT NULL COMMENT '灰熔点',
  `ash_content` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '灰分',
  `hardgrove` varchar(24) DEFAULT NULL COMMENT '哈氏可磨',
  `char_characteristic` varchar(24) DEFAULT NULL COMMENT '焦渣特征',
  `remark` text COMMENT '备注',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `release_time` int(11) UNSIGNED DEFAULT NULL COMMENT '发布时间',
  `views` int(11) UNSIGNED DEFAULT '0' COMMENT '预览人气',
  `product_number` varchar(30) DEFAULT NULL COMMENT '产品编号',
  `supply` int(8) UNSIGNED DEFAULT NULL COMMENT '供应量',
  `delivery_time` int(11) UNSIGNED DEFAULT NULL COMMENT '交货时间',
  `taxlnclusive_price` decimal(10,2) UNSIGNED DEFAULT NULL COMMENT '含税价格',
  `paymenr` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '付款方式',
  `inspection_organization` varchar(255) DEFAULT NULL COMMENT '检测机构',
  `delivery_way` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '交货方式',
  `dealer_name` varchar(30) DEFAULT NULL COMMENT '交易员',
  `dealer_phone` char(11) DEFAULT NULL COMMENT '交易员电话',
  `settlement_method` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '结算方式',
  `delivery_place` varchar(255) DEFAULT NULL COMMENT '交货地点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `complainttbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `complainttbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type_id` int(11) NOT NULL COMMENT '投诉项目id',
  `complaint_title` varchar(64) NOT NULL COMMENT '投诉标题',
  `complaint_content` text NOT NULL COMMENT '投诉内容',
  `gmt_create` int(11) NOT NULL COMMENT '创建时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉表';

-- --------------------------------------------------------

--
-- 表的结构 `complaint_typetbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `complaint_typetbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_complaints` varchar(32) NOT NULL COMMENT '人员投诉',
  `quality_complaint` text NOT NULL COMMENT '煤炭质量投诉',
  `gmt_create` int(11) NOT NULL COMMENT '创建时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉类型表';

-- --------------------------------------------------------

--
-- 表的结构 `co_emptbl`
--
-- 创建时间： 2017-03-21 01:22:58
-- 最后更新： 2017-03-21 01:22:58
--

CREATE TABLE IF NOT EXISTS `co_emptbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `co_name` varchar(128) DEFAULT NULL COMMENT '公司姓名',
  `staff_name` varchar(30) DEFAULT NULL COMMENT '员工姓名',
  `staff_mobile` char(255) DEFAULT NULL COMMENT '手机号',
  `gmt_create` int(255) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `co_usertbl`
--
-- 创建时间： 2017-03-21 01:22:58
-- 最后更新： 2017-03-21 01:22:58
--

CREATE TABLE IF NOT EXISTS `co_usertbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `co_name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `co_type` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '企业类型',
  `co_nature` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '企业性质',
  `co_no` varchar(30) DEFAULT NULL COMMENT '企业号',
  `co_addr` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `business_addr` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '经营地址',
  `business_term` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '营业期限',
  `tel` varchar(12) DEFAULT NULL COMMENT '座机电话',
  `registered_capital` varchar(10) DEFAULT NULL COMMENT '注册资本',
  `fax` varchar(128) DEFAULT NULL COMMENT '传真',
  `lr_hometown` varchar(255) DEFAULT NULL COMMENT '法人归属地',
  `lr_name` varchar(30) DEFAULT NULL COMMENT '法人姓名',
  `lr_certificatetype` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '法人证件类型',
  `lr_certifcatenum` char(18) DEFAULT NULL COMMENT '法人证件类型',
  `lr_phone` char(11) DEFAULT NULL COMMENT '法人手机号码',
  `acct_bank` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '对公开户行',
  `acct_name` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '对公账户开户名',
  `bank_province` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '开户行所在省',
  `bank_city` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '开户行所在市',
  `bank_branch` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '开户银行支行名称',
  `basic_acct` varchar(20) DEFAULT NULL COMMENT '对公基本账户',
  `emp_name` varchar(30) DEFAULT NULL COMMENT '雇员姓名',
  `emp_position` varchar(30) DEFAULT NULL COMMENT '雇员职位',
  `emp_mobile` char(11) DEFAULT NULL COMMENT '雇员手机号',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `demandtbl`
--
-- 创建时间： 2017-03-21 01:22:58
-- 最后更新： 2017-03-21 01:22:58
--

CREATE TABLE IF NOT EXISTS `demandtbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `devlivery_place` varchar(255) DEFAULT NULL COMMENT '交货地点',
  `requiement` int(11) UNSIGNED DEFAULT NULL COMMENT '需求量',
  `purchase_indicator` text COMMENT '采购指标',
  `people_need` char(11) DEFAULT NULL COMMENT '需求人',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `deposittbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `deposittbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `deposit_apptbl`
--
-- 创建时间： 2017-03-21 01:22:58
-- 最后更新： 2017-03-21 01:22:58
--

CREATE TABLE IF NOT EXISTS `deposit_apptbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `co_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `co_addr` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `business_area` varchar(128) DEFAULT NULL COMMENT '业务区域',
  `fimamcomh_amt` varchar(10) DEFAULT NULL COMMENT '融资金额',
  `contacts` varchar(30) DEFAULT NULL COMMENT '联系人',
  `contact_no` char(11) DEFAULT NULL COMMENT '联系电话',
  `examination` tinyint(4) UNSIGNED DEFAULT '0' COMMENT '审核',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `econtacttbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `econtacttbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_contact_charge` decimal(10,0) NOT NULL COMMENT '电子合同签订费用',
  `sign_time` int(11) NOT NULL COMMENT '签约时间',
  `gmt_create` int(11) NOT NULL COMMENT '上传时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电子合同订单表';

-- --------------------------------------------------------

--
-- 表的结构 `fast_reward_apptbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `fast_reward_apptbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `co_name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `co_addr` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `business_aera` varchar(255) DEFAULT NULL COMMENT '业务区域',
  `financing_amt` varchar(10) DEFAULT NULL COMMENT '融资金额',
  `contacts` varchar(30) DEFAULT NULL COMMENT '联系人',
  `contact_no` char(11) DEFAULT NULL COMMENT '联系电话',
  `examination` tinyint(255) UNSIGNED DEFAULT '0' COMMENT '审核',
  `gmt_greate` int(11) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmf_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fin_usertbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `fin_usertbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pay_pwd` char(32) DEFAULT NULL COMMENT '支付密码',
  `login_pwd` char(32) DEFAULT NULL COMMENT '登陆密码',
  `acct_bal` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '账户余额',
  `bind_acct` varchar(30) DEFAULT NULL COMMENT '绑定平台一般为账户',
  `loan_amt` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '货款额度',
  `cargo_loanlnfo` varchar(128) DEFAULT NULL COMMENT '货权贷款资料',
  `margin_loanlnfo` varchar(128) DEFAULT NULL COMMENT '保证金贷款资料',
  `gmt_cerate` int(255) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `newstbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `newstbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL COMMENT '表的标题',
  `content` text NOT NULL COMMENT '内容',
  `examination` tinyint(4) NOT NULL COMMENT '审查',
  `sort` int(11) NOT NULL COMMENT '排序',
  `gmt_create` int(11) NOT NULL COMMENT '上传时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- --------------------------------------------------------

--
-- 表的结构 `pictbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `pictbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_path` varchar(32) NOT NULL COMMENT '图片存放位置',
  `pic_name` varchar(32) NOT NULL COMMENT '图片名',
  `gmt_create` int(11) NOT NULL COMMENT '上传时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片表';

-- --------------------------------------------------------

--
-- 表的结构 `platform_stafftbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `platform_stafftbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(32) NOT NULL COMMENT '职位',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `gentle` tinyint(2) NOT NULL COMMENT '性别',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `QQ` varchar(32) NOT NULL COMMENT 'QQ',
  `we_chat` varchar(32) NOT NULL COMMENT '微信号',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  `emergency_contact_no` char(11) NOT NULL COMMENT '紧急联系人电话',
  `emergency_contact` varchar(32) NOT NULL COMMENT '紧急联系人',
  `id_no` char(18) NOT NULL COMMENT '身份证号',
  `addr` varchar(128) NOT NULL COMMENT '住址',
  `login_pwd` char(32) NOT NULL COMMENT '员工密码',
  `Ukey_info` varchar(32) NOT NULL COMMENT '主管U盾信息',
  `backstage_id` char(11) NOT NULL COMMENT '后台账号',
  `staff_id` char(11) NOT NULL COMMENT '员工账号',
  `gmt_create` int(11) NOT NULL COMMENT '创建时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='平台员工账户表';

-- --------------------------------------------------------

--
-- 表的结构 `possesiontbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `possesiontbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acct_bal` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '可用金额',
  `acct_amt` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '总金额',
  `freeze_amt` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '冻结金额',
  `deposit` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '违约保证金',
  `transfer_amt` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '转出金额',
  `recieve_amt` decimal(10,0) UNSIGNED DEFAULT NULL COMMENT '转入金额',
  `transfer_time` int(11) UNSIGNED DEFAULT NULL COMMENT '转出时间',
  `recieve_time` int(11) UNSIGNED DEFAULT NULL COMMENT '转入时间',
  `gmt_create` int(255) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(255) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ppt_imgtbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `ppt_imgtbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ppt_path` varchar(32) NOT NULL COMMENT '图片存放位置',
  `ppt_name` varchar(32) NOT NULL COMMENT '图片名',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  `gmt_create` int(11) NOT NULL COMMENT '上传时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页PPT轮播图';

-- --------------------------------------------------------

--
-- 表的结构 `product_typetbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `product_typetbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_type` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '商品种类',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `seller_certificatetbl`
--
-- 创建时间： 2017-03-21 01:20:32
-- 最后更新： 2017-03-21 01:20:32
--

CREATE TABLE IF NOT EXISTS `seller_certificatetbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_path` varchar(32) NOT NULL COMMENT '凭证路径',
  `certificate_name` varchar(32) NOT NULL COMMENT '凭证名称',
  `certificate_type_id` int(11) NOT NULL COMMENT '凭证类型id',
  `gmt_create` int(11) NOT NULL COMMENT '上传时间',
  `gmt_modified` int(11) NOT NULL COMMENT '修改时间',
  `is_del` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='凭证表(卖家)';

-- --------------------------------------------------------

--
-- 表的结构 `storagetbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `storagetbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `storage_addr` varchar(255) DEFAULT NULL COMMENT '仓位地址',
  `loading_way` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '仓位装车方式',
  `loading_capacity` int(8) UNSIGNED DEFAULT NULL COMMENT '仓库装车能力',
  `storage_rent` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '仓库租赁方式',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `publisher` char(11) DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `storage_demandtbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `storage_demandtbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `people_need` char(11) DEFAULT NULL COMMENT '仓位需求人',
  `storage_addr` varchar(255) DEFAULT NULL COMMENT '仓位地址',
  `loading_way` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '仓位装车方式',
  `loading_capacity` int(8) UNSIGNED DEFAULT NULL COMMENT '仓位装车能力',
  `storage_rent` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '仓位租赁方式',
  `gmt_create` int(11) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usertbl`
--
-- 创建时间： 2017-03-21 01:22:59
-- 最后更新： 2017-03-21 01:22:59
--

CREATE TABLE IF NOT EXISTS `usertbl` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) UNSIGNED DEFAULT '1' COMMENT '用户类型',
  `phone_no` varchar(11) NOT NULL COMMENT '手机号码',
  `login_pwd` char(32) NOT NULL COMMENT '登陆密码',
  `last_loginip` varchar(30) DEFAULT NULL COMMENT '上次登陆IP',
  `last_logintime` int(11) UNSIGNED DEFAULT NULL COMMENT '上次登陆时间',
  `gmt_cerate` int(11) UNSIGNED DEFAULT NULL COMMENT '上传时间',
  `gmt_modified` int(11) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `del` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '伪删除',
  `email` varchar(128) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
