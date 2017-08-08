CREATE TABLE `product_info` (

  `product_id` VARCHAR(32) NOT NULL ,
  `product_name` VARCHAR(64) NOT NULL COMMENT '商品名称' ,
  `product_price` DECIMAL(8,2) NOT NULL COMMENT '单价',
  `product_stock` INT NOT NULL COMMENT '库存',
  `product_description` VARCHAR(64) NOT NULL COMMENT '描述',
  `product_icon` VARCHAR(512) COMMENT '小图',
  `product_type` INT NOT NULL COMMENT '类目编号',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`)

) COMMENT '商品表';

CREATE TABLE `product_category`(
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(64) NOT NULL COMMENT '类目名称',
  `category_type` INT NOT NULL COMMENT '类目编号',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL COMMENT '更新时间',

  PRIMARY KEY (`category_id`),

  UNIQUE KEY `uqe_category_type` (`category_type`)
) COMMENT '产品类目表';

CREATE TABLE `order_master` (
  `order_id` VARCHAR(32) NOT NULL ,
  `buyer_name` VARCHAR(32) NOT NULL COMMENT '买家名称',
  `buyer_phone` VARCHAR(32) NOT NULL COMMENT '买家电话',
  `buyer_address` VARCHAR(128) NOT NULL COMMENT '买家地址',
  `buyer_openid` VARCHAR(64) NOT NULL COMMENT '买家微信openid',
  `order_amount` DECIMAL(8,2) NOT NULL COMMENT '订单金额',
  `order_status` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '订单状态,默认0新下单',
  `pay_status` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '支付状态， 默认为 0 未支付',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL COMMENT '更新时间',

  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)

) COMMENT '订单主表';


CREATE TABLE `order_detail` (

  `detail_id` VARCHAR(32) NOT NULL ,
  `order_id` VARCHAR(32) NOT NULL ,
  `product_id` VARCHAR(32) NOT NULL ,
  `product_name` VARCHAR(64) NOT NULL COMMENT '商品名称',
  `product_price` DECIMAL(8,2) NOT NULL COMMENT '商品单价',
  `product_quantity` INT NOT NULL COMMENT '商品数量',
  `product_icon` VARCHAR(512) NOT NULL COMMENT '商品小图',
  `create_time` TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL COMMENT '更新时间',

  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)



) COMMENT '订单详情';