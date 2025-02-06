-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.40 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных esi
CREATE DATABASE IF NOT EXISTS `esi` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esi`;

-- Дамп структуры для таблица esi.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `body` text,
  `likes` int DEFAULT NULL,
  `dislikes` int DEFAULT NULL,
  `author` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы esi.comments: ~0 rows (приблизительно)

-- Дамп структуры для таблица esi.sessiontbl
CREATE TABLE IF NOT EXISTS `sessiontbl` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы esi.sessiontbl: ~0 rows (приблизительно)

-- Дамп структуры для таблица esi.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы esi.users: ~2 rows (приблизительно)
REPLACE INTO `users` (`id`, `login`, `avatar`, `role`) VALUES
	(1, 'Gumball12557', 'http://localhost:9000/avatars/gumball.jpg', 'gumball'),
	(2, 'Darwin', 'http://localhost:9000/avatars/gumball.jpg', 'darwin'),
	(3, 'Anais', 'http://localhost:9000/avatars/anais.jpg', 'anais');

-- Дамп структуры для таблица esi.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `poster` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `views` int DEFAULT '0',
  `path` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_name` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `season` int DEFAULT NULL,
  `episode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `video_id` varchar(50) DEFAULT NULL,
  `skip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы esi.videos: ~5 rows (приблизительно)
REPLACE INTO `videos` (`id`, `poster`, `title`, `description`, `author`, `views`, `path`, `file_name`, `season`, `episode`, `video_id`, `skip`) VALUES
	(1, 'http://localhost:9000/tawog/posters/4653472.jpg', '1-2 серия 1 сезон', '*пустота*', 'bek', 1, 'http://localhost:9000/tawog/season1/', '1_сезон_1_серия_Безответственные_братья_+_Беги,_мама,_беги.mp4', 1, '1', NULL, NULL),
	(2, 'http://localhost:9000/tawog/posters/4653526.jpg', '2 серия 1 сезон', '*пустота*', 'bek', 0, 'http://localhost:9000/tawog/season1/', '1x02_01_The_Amazing_World_of_Gumball_The_Responsible_+_The_DVD_1080p.mkv', 1, '2', NULL, '?t=711'),
	(3, 'http://localhost:9000/tawog/posters/4653530.jpg', '3 серия 1 сезон', '*пустота*', 'bek', 0, 'http://localhost:9000/tawog/season1/', NULL, 1, '3', NULL, NULL),
	(4, 'http://localhost:9000/tawog/posters/4653914.jpg', '4 серия 1 сезон', '*пустота*', 'bek', 0, 'http://localhost:9000/tawog/season1/', NULL, 1, '4', NULL, NULL),
	(5, 'http://localhost:9000/tawog/posters/4653927.jpg', '5 серия 1 сезон', '*пустота*', 'bek', 0, 'http://localhost:9000/tawog/season1/', NULL, 1, '5', NULL, NULL);

-- Дамп структуры для таблица esi.videos_example
CREATE TABLE IF NOT EXISTS `videos_example` (
  `id` bigint DEFAULT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `views` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Дамп данных таблицы esi.videos_example: ~38 rows (приблизительно)
REPLACE INTO `videos_example` (`id`, `poster`, `title`, `author`, `views`) VALUES
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653526.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653530.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653914.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653927.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0),
	(NULL, '4653472.jpg', '2 серия 1 сезон', 'bek', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
