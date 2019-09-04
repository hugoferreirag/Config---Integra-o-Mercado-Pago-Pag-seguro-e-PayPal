# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Base de Dados: loja2
# Tempo de Geração: 2019-04-24 19:06:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `name`)
VALUES
	(1,'LG'),
	(2,'Samsung'),
	(3,'AOC'),
	(4,'Apple');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `sub`, `name`)
VALUES
	(1,NULL,'Monitor'),
	(2,0,'Som'),
	(3,2,'Headphones'),
	(5,3,'Com fio'),
	(6,3,'Sem fio'),
	(11,2,'Microfones');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `coupon_type` int(11) NOT NULL DEFAULT '0',
  `coupon_value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;

INSERT INTO `options` (`id`, `name`)
VALUES
	(1,'Cor'),
	(2,'Tamanho'),
	(3,'Memória RAM'),
	(4,'Polegadas');

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `title`, `body`)
VALUES
	(3,'Política de Privacidade','...'),
	(4,'Termos de Uso','<p><img src=\"../../../nova_loja/media/pages/84eb0e8aa6ddb0f483c503f7b9a0a7b7.jpg\" alt=\"\" width=\"175\" height=\"175\" /></p>\r\n<p>lkajs<strong>rlkajrlkja</strong>krjlk arjka<em>jrs klaj<span style=\"background-color: #ff0000;\">r</span></em><span style=\"background-color: #ff0000;\">lsjal</span>r...</p>'),
	(5,'Política de Devolução','...');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela permission_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_groups`;

CREATE TABLE `permission_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;

INSERT INTO `permission_groups` (`id`, `name`)
VALUES
	(1,'Super Administrador'),
	(2,'Administrador'),
	(3,'Gerente'),
	(5,'Vendedor'),
	(7,'Algum Grupo');

/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela permission_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_items`;

CREATE TABLE `permission_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `slug` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission_items` WRITE;
/*!40000 ALTER TABLE `permission_items` DISABLE KEYS */;

INSERT INTO `permission_items` (`id`, `name`, `slug`)
VALUES
	(1,'Criar Cupom de Oferta','cupons_create'),
	(2,'Ver Permissões','permissions_view'),
	(3,'Ver Categorias','categories_view'),
	(4,'Ver Páginas','pages_view'),
	(5,'Ver Marcas','brands_view'),
	(6,'Ver Produtos','products_view'),
	(7,'Ver Usuários','users_view');

/*!40000 ALTER TABLE `permission_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela permission_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_links`;

CREATE TABLE `permission_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_permission_group` int(11) NOT NULL,
  `id_permission_item` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission_links` WRITE;
/*!40000 ALTER TABLE `permission_links` DISABLE KEYS */;

INSERT INTO `permission_links` (`id`, `id_permission_group`, `id_permission_item`)
VALUES
	(2,2,1),
	(3,3,1),
	(13,7,2),
	(18,5,1),
	(49,1,1),
	(50,1,2),
	(51,1,3),
	(52,1,4),
	(53,1,5),
	(54,1,6),
	(55,1,7);

/*!40000 ALTER TABLE `permission_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NOT NULL DEFAULT '0',
  `id_brand` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `description` text,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_from` float NOT NULL,
  `rating` float NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `bestseller` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `options` varchar(200) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `length` float NOT NULL,
  `diameter` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `id_category`, `id_brand`, `name`, `description`, `stock`, `price`, `price_from`, `rating`, `featured`, `sale`, `bestseller`, `new_product`, `options`, `weight`, `width`, `height`, `length`, `diameter`)
VALUES
	(1,1,1,'Monitor 31 polegadas ATUALIZADO','<p>Monitor em alta defini&ccedil;&atilde;o</p>',10,499,599,4,1,1,1,0,'1,2,4',0.9,20,15,20,15),
	(2,1,2,'Monitor 21 polegadas','Monitor 1080p 3D',10,399,499,0,1,0,1,0,'1,2',0.8,20,15,20,15),
	(3,1,2,'Monitor 24 polegadas','Monitor 4K Gamer',10,2599,699,2,1,1,0,1,'1,2',0.7,20,15,20,15),
	(4,1,3,'Monitor 17 polegadas','Monitor 3D LED',10,779,900,0,1,0,0,0,'1,4',0.6,20,15,20,15),
	(5,1,1,'Monitor 20 polegadas','Monitor HDR LED 1080p',10,299,0,0,1,0,0,1,'1',0.5,20,15,20,15),
	(6,1,3,'Monitor 20 polegadas','Monitor 1080p 3D',10,699,0,0,1,1,0,0,'1,2,4',0.4,20,15,20,15),
	(7,1,3,'Monitor 19 polegadas','Monitor 1080p Full HD',10,889,999,5,1,0,0,0,'2,4',0.3,20,15,20,15),
	(8,1,1,'Monitor 18 polegadas','Monitor 4K Gamer',10,599,699,0,1,0,0,0,'4',0.2,20,15,20,15),
	(11,11,4,'Microfone Apple','<p>Muito interessante</p>',3,650,799,0,1,0,0,1,'1,3',0.2,2,3,4,5),
	(12,2,1,'Produto com Imagem','<p>Qualquer uma</p>',0,95,100,0,0,0,1,0,'1,3',0,0,0,0,0),
	(13,2,1,'Produto de TESTE com IMAGEM','<p>asrasrasr</p>',123,800,0,0,0,1,0,1,'1',0,0,0,0,0);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela products_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_images`;

CREATE TABLE `products_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products_images` WRITE;
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;

INSERT INTO `products_images` (`id`, `id_product`, `url`)
VALUES
	(1,1,'1.jpg'),
	(2,2,'2.jpg'),
	(3,3,'3.jpg'),
	(4,4,'4.jpg'),
	(5,5,'4.jpg'),
	(6,6,'4.jpg'),
	(7,7,'7.jpg'),
	(8,8,'4.jpg'),
	(9,1,'4.jpg'),
	(11,1,'3.jpg'),
	(12,12,'b89b0be85b0eb58e8f3c623c34f6299e.jpg'),
	(13,12,'3b3c6636f0f75ee5e7eb122ac7331e0f.jpg'),
	(14,13,'9d8f959850adaf8153b7b1785cf0541a.jpg');

/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela products_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_options`;

CREATE TABLE `products_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `id_option` int(11) NOT NULL DEFAULT '0',
  `p_value` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;

INSERT INTO `products_options` (`id`, `id_product`, `id_option`, `p_value`)
VALUES
	(4,2,1,'Azul'),
	(5,2,2,'19cm'),
	(6,3,1,'Branco'),
	(7,3,2,'20cm'),
	(8,4,1,'Preto'),
	(9,4,4,'17'),
	(10,5,1,'Vermelho'),
	(11,6,1,'Cinza'),
	(12,6,2,'18cm'),
	(13,6,4,'20'),
	(14,7,2,'18cm'),
	(15,7,4,'19'),
	(16,8,4,'18'),
	(17,11,1,'Branco'),
	(18,11,3,'4GB'),
	(19,12,1,'Azul'),
	(20,12,3,'2GB'),
	(21,13,1,'Vermelho'),
	(25,1,1,'Azul'),
	(26,1,2,'23cm'),
	(27,1,4,'31');

/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela purchase_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_transactions`;

CREATE TABLE `purchase_transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_purchase` int(11) NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `transaction_code` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_coupon` int(11) DEFAULT '0',
  `total_amount` float NOT NULL DEFAULT '0',
  `payment_type` varchar(100) DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `id_user`, `id_coupon`, `total_amount`, `payment_type`, `payment_status`)
VALUES
	(1,2,0,528.71,'psckttransparente',1),
	(2,2,0,528.71,'psckttransparente',1),
	(3,2,0,528.71,'psckttransparente',1),
	(4,2,0,528.71,'psckttransparente',1),
	(5,2,0,528.71,'psckttransparente',1),
	(6,2,0,528.71,'psckttransparente',1),
	(7,2,0,528.71,'psckttransparente',1),
	(8,2,0,528.71,'psckttransparente',1),
	(9,2,0,528.71,'psckttransparente',1),
	(10,2,0,528.71,'psckttransparente',1),
	(11,2,0,528.71,'psckttransparente',1),
	(12,2,0,528.71,'psckttransparente',1),
	(13,2,0,528.71,'psckttransparente',1),
	(14,2,0,528.71,'psckttransparente',1),
	(15,2,0,528.71,'psckttransparente',1),
	(16,4,0,814.31,'mp',1),
	(17,4,0,814.31,'mp',1),
	(18,4,0,814.31,'mp',1),
	(19,4,0,814.31,'mp',1),
	(20,4,0,814.31,'mp',1),
	(21,4,0,814.31,'mp',1),
	(22,4,0,814.31,'mp',1),
	(23,4,0,814.31,'mp',1),
	(24,4,0,814.31,'mp',1),
	(25,4,0,814.31,'mp',1),
	(26,4,0,814.31,'mp',1),
	(27,4,0,814.31,'mp',1),
	(28,4,0,925.21,'mp',1),
	(29,4,0,925.21,'mp',1);

/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela purchases_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases_products`;

CREATE TABLE `purchases_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_purchase` int(11) NOT NULL DEFAULT '0',
  `id_product` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `product_price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchases_products` WRITE;
/*!40000 ALTER TABLE `purchases_products` DISABLE KEYS */;

INSERT INTO `purchases_products` (`id`, `id_purchase`, `id_product`, `quantity`, `product_price`)
VALUES
	(1,2,1,1,499),
	(2,3,1,1,499),
	(3,4,1,1,499),
	(4,5,1,1,499),
	(5,6,1,1,499),
	(6,7,1,1,499),
	(7,8,1,1,499),
	(8,9,1,1,499),
	(9,10,1,1,499),
	(10,11,1,1,499),
	(11,12,1,1,499),
	(12,13,1,1,499),
	(13,14,1,1,499),
	(14,15,1,1,499),
	(15,16,4,1,779),
	(16,17,4,1,779),
	(17,18,4,1,779),
	(18,19,4,1,779),
	(19,20,4,1,779),
	(20,21,4,1,779),
	(21,22,4,1,779),
	(22,23,4,1,779),
	(23,24,4,1,779),
	(24,25,4,1,779),
	(25,26,4,1,779),
	(26,27,4,1,779),
	(27,28,7,1,889),
	(28,29,7,1,889);

/*!40000 ALTER TABLE `purchases_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rates`;

CREATE TABLE `rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `date_rated` datetime NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;

INSERT INTO `rates` (`id`, `id_product`, `id_user`, `date_rated`, `points`, `comment`)
VALUES
	(2,1,1,'2018-09-28 21:27:36',4,'Produto meio ruim');

/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_permission` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `id_permission`, `email`, `password`, `name`, `admin`, `token`)
VALUES
	(1,1,'suporte@b7web.com.br','e10adc3949ba59abbe56e057f20f883e','Bonieky Lacerda',1,'b608986bb9f6a5ba2f3d13191c09ca7f'),
	(2,0,'c41388735159787216280@sandbox.pagseguro.com.br','W7kkCD0atP6lLf8h','Sandbox Pagseguro',0,''),
	(4,5,'testemp@hotmail.com','123','Testador',0,'');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
