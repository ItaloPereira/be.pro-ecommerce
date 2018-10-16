CREATE TABLE `categories` (
  `id` INT AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))

CREATE TABLE `products` (
  `id` INT AUTO_INCREMENT,
  `category_id` INT NULL,
  `type` INT NULL,
  `title` VARCHAR(45) NULL,
  `subtitle` VARCHAR(45) NULL,
  `icon` VARCHAR(45) NULL,
  `badge` VARCHAR(45) NULL,
  `badge_direction` VARCHAR(45) NULL,
  `old_price` DECIMAL(8) NULL,
  `price` DECIMAL(8) NULL,
  `product_image` VARCHAR(45) NULL,
  `theme` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))

CREATE TABLE `slides` (
  `id` INT AUTO_INCREMENT,
  `type` INT NULL,
  `text_back` VARCHAR(45) NULL,
  `bgr_image` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `button_text` VARCHAR(45) NULL,
  `href` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))

  INSERT INTO `products` (`id`, `category_id`, `type`, `title`, `subtitle`, `icon`, `badge`, `badge_direction`, `old_price`, `price`, `product_image`, `theme`)
VALUES
	(1, 1, 0, 'POPULAR PRODUCT', 'more product', 'fire', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 1, 1,'Essential cotton-blend', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(3, 1, 1, 'Flecked cotton-blend', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(4, 1, 1, 'Striped cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(5, 1, 1, 'V-neck cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(6, 1, 1, 'Striped cotton', NULL, NULL, 'new', 'left', NULL, 50, 'product.png', 'color'),
	(7, 1, 1, 'Striped cotton 2.0', NULL, NULL, NULL, NULL, NULL, 100, 'product2.png', 'color'),
	(8, 1, 1, 'Striped cotton 3.0', NULL, NULL, 'old', 'right', 150, 75, 'product3.png', 'color'),
	(9, 1, 1, 'Message cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(10, 1, 1, 'Sequin star t-shirt', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(11, 1, 1, 'Ruffle sleeve t-shirt', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(12, 1, 1, 'Double layer top', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(13, 1, 1, 'Essential cotton-blend', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(14, 1, 1, 'Flecked cotton-blend', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(15, 1, 1, 'Striped cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(16, 1, 1, 'V-neck cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(17, 1, 1, 'Striped cotton', NULL, NULL, 'new', 'left', NULL, 50, 'product.png', 'color'),
	(18, 1, 1, 'Striped cotton 2.0', NULL, NULL, NULL, NULL, NULL, 100, 'product2.png', 'color'),
	(19, 1, 1, 'Striped cotton 3.0', NULL, NULL, 'old', 'right', 150, 75, 'product3.png', 'color'),
	(20, 1, 1, 'Message cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(21, 1, 1, 'Sequin star t-shirt', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(22, 1, 1, 'Ruffle sleeve t-shirt', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(23, 1, 1, 'Double layer top', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(24, 1, 1, 'Essential cotton-blend', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(25, 1, 1, 'Flecked cotton-blend', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(26, 1, 1, 'Striped cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL),
	(27, 1, 1, 'V-neck cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(28, 1, 1, 'Striped cotton', NULL, NULL, 'new', 'left', NULL, 50, 'product.png', 'color'),
	(29, 1, 1, 'Striped cotton 2.0', NULL, NULL, NULL, NULL, NULL, 100, 'product2.png', 'color'),
	(30, 1, 1, 'Striped cotton 3.0', NULL, NULL, 'old', 'right', 150, 75, 'product3.png', 'color'),
	(31, 1, 1, 'Message cotton t-shirt', NULL, NULL, NULL, NULL, NULL, 100, 'product4.png', NULL),
	(32, 1, 1, 'Sequin star t-shirt', NULL, NULL, 'sale', 'right', 200, 100, 'product.png', NULL),
	(33, 1, 1, 'Ruffle sleeve t-shirt', NULL, NULL, NULL, NULL, NULL, 175, 'product2.png', NULL),
	(34, 1, 1, 'Double layer top', NULL, NULL, NULL, NULL, NULL, 200, 'product3.png', NULL);

INSERT INTO `slides` (`id`, `type`, `text_back`, `bgr_image`, `title`, `button_text`, `href`)
VALUES
	(1, 1, 'FASHION', 'bgr-header.png', 'New Arrival', 'BUY NOW', NULL),
	(2, 1, 'COTTON', 'bgr-header2.png', 'Cotton Clothes', 'SEE NOW', NULL),
	(3, 1, 'PRET CAPS', 'bgr-header3.png', 'New Caps', 'BUY NOW', NULL);

