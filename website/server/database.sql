CREATE TABLE `products` (
  `id` INT AUTO_INCREMENT,
  `category_id` INT NULL,
  `type` INT NULL,
  `title` VARCHAR(45) NULL,
  `subtitle` VARCHAR(45) NULL,
  `icon` VARCHAR(45) NULL,
  `badge` VARCHAR(45) NULL,
  `badgeDirection` VARCHAR(45) NULL,
  `oldPrice` DECIMAL(8) NULL,
  `price` DECIMAL(8) NULL,
  `productImage` VARCHAR(45) NULL,
  `theme` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))

CREATE TABLE `categories` (
  `id` INT AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))

CREATE TABLE `slides` (
  `id` INT AUTO_INCREMENT,
  `type` INT NULL,
  `textBack` VARCHAR(45) NULL,
  `bgrImage` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `buttonText` VARCHAR(45) NULL,
  `href` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))

  INSERT INTO `products` (`id`, `type`, `title`, `subtitle`, `icon`, `badge`, `badgeDirection`, `oldPrice`, `price`, `productImage`, `theme`)
VALUES
	(1, 0, 'POPULAR PRODUCT', 'more product', 'fire', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 1, 'Essential cotton-blend', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(3, 1, 'Flecked cotton-blend', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(4, 1, 'Striped cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(5, 1, 'V-neck cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(6, 1, 'Striped cotton', NULL, NULL, 'new', 'left', NULL, 50, 'product.png', 'blue'),
	(7, 1, 'Striped cotton 2.0', NULL, NULL, NULL, NULL, NULL, 100, 'product2.png', 'blue'),
	(8, 1, 'Striped cotton 3.0', NULL, NULL, 'old', 'right', 150, 75, 'product3.png', 'blue'),
	(9, 1, 'Message cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(10, 1, 'Sequin star t-shirt', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(11, 1, 'Ruffle sleeve t-shirt', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(12, 1, 'Double layer top', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(13, 1, 'Essential cotton-blend', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(14, 1, 'Flecked cotton-blend', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(15, 1, 'Striped cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(16, 1, 'V-neck cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(17, 1, 'Striped cotton', NULL, NULL, 'new', 'left', NULL, 50, 'product.png', 'blue'),
	(18, 1, 'Striped cotton 2.0', NULL, NULL, NULL, NULL, NULL, 100, 'product2.png', 'blue'),
	(19, 1, 'Striped cotton 3.0', NULL, NULL, 'old', 'right', 150, 75, 'product3.png', 'blue'),
	(20, 1, 'Message cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(21, 1, 'Sequin star t-shirt', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(22, 1, 'Ruffle sleeve t-shirt', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(23, 1, 'Double layer top', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(24, 1, 'Essential cotton-blend', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(25, 1, 'Flecked cotton-blend', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(26, 1, 'Striped cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(27, 1, 'V-neck cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(28, 1, 'Striped cotton', NULL, NULL, 'new', 'left', NULL, 50, 'product.png', 'blue'),
	(29, 1, 'Striped cotton 2.0', NULL, NULL, NULL, NULL, NULL, 100, 'product2.png', 'blue'),
	(30, 1, 'Striped cotton 3.0', NULL, NULL, 'old', 'right', 150, 75, 'product3.png', 'blue'),
	(31, 1, 'Message cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(32, 1, 'Sequin star t-shirt', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(33, 1, 'Ruffle sleeve t-shirt', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(34, 1, 'Double layer top', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL);

INSERT INTO `slides` (`id`, `type`, `textBack`, `bgrImage`, `title`, `buttonText`, `href`)
VALUES
	(1, 1, 'FASHION', 'bgr-header.png', 'New Arrival', 'BUY NOW', NULL),
	(2, 1, 'COTTON', 'bgr-header2.png', 'Cotton Clothes', 'SEE NOW', NULL),
	(3, 1, 'PRET CAPS', 'bgr-header3.png', 'New Caps', 'BUY NOW', NULL);
