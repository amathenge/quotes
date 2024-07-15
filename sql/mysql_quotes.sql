-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: aamathenge.mysql.pythonanywhere-services.com    Database: aamathenge$tmysql
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(64) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `quote` text,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Woody Allen','Inspirational','90% of life is just showing up',10),(2,'Maya Angelou','Inspirational','Success is liking yourself, liking what you do, and liking how you do it.',10),(3,'Woody Allen','Inspirational','The talent for being happy is appreciating and liking what you have, instead of what you don\'t have.',9),(4,'Andre Gide','Philosophical','It is better to fail at your own life than to succeed at someone else\'s.',9),(5,'Evan Esar','Philosophical','Character is what you have left when you\'ve lost everything you can lose.',9),(6,'Judy Garland','Inspirational','Always be a first-rate version of yourself, instead of a second-rate version of someone else.',9),(7,'Chinese Proverb','Philosophical','The journey is the reward.',8),(8,'John Ruskin','Inspirational','What we think, or what we know, or what we believe is, in the end, of little consequence. The only consequence is what we do.',8),(9,'Albert Einstein','Humorous','If a cluttered desk is a sign of a cluttered mind,\r\nOf what, then, is an empty desk a sign?',8),(10,'Douglas Adams','Humorous','I love deadlines. I like the whooshing sound they make as they fly by.',7),(11,'Jerome K. Jerome','Humorous','I like work: it fascinates me. I can sit and look at it for hours.',7),(12,'Leonardo Da Vinci	','Inspirational','I have been impressed with the urgency of doing. Knowing is not enough; we must apply. Being willing is not enough; we must do.',7),(13,'Unknown Author','Humorous','The difference between \"involvement\" and \"commitment\" is like an eggs-and-ham breakfast; the chicken was involved - the pig was committed.\"',6),(14,'Woody Allen','Humorous','The lion and the calf shall lie down together but the calf won\'t get much sleep.',5),(15,'Steven Wright','Humorous','It may be that your sole purpose in life is to serve as a warning to others.',5),(16,'Wayne Gretzky','Inspirational','You miss 100 percent of the shots you never take.',5),(17,'Robert M. Persig','Philosophical','When one person suffers from a delusion it is called insanity. When many people suffer from a delusion, it is called Religion.',5),(18,'Lao Tzu','Philosophical','A journey of a thousand miles begins with a single step.',4),(19,'Les Brown','Inspirational','No one gets out of the game of life alive. You either die in the bleachers, or on the field. So, you might as well play out on the field and go for it.',1),(20,'Leonardo Da Vinci','Inspirational','Iron rusts from disuse; water loses its purity from stagnation and in cold weather becomes frozen; even so does inaction sap the vigours of the mind.',1),(21,'Thomas Alva Edison','Inspirational','I have more respect for the fellow with a single idea who gets there than for the fellow with a thousand ideas who does nothing.',1),(22,'Johann Wolfgang von Goethe','Inspirational','Knowing is not enough; we must apply.',1),(23,'Kahlil Gibran','Inspirational','A little knowledge that acts is worth infinitely more than knowledge that is idle.',1),(24,'Grace Hopper','Inspirational','A ship in port is safe, but that’s not what ships are built for.',1),(25,'Michael Jordan','Inspirational','I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.',1),(26,'Kevin Kruse','Inspirational','Life isn’t about getting and having, it’s about giving and being.',1),(27,'Earl Nightingale','Inspirational','We become what we think about.',1),(28,'Christopher Columbus','Inspirational','You can never cross the ocean until you have the courage to lose sight of the shore.',1),(29,'Maya Angelou','Inspirational','I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.',1),(30,'Aristotle','Inspirational','There is only one way to avoid criticism: do nothing, say nothing, and be nothing.',1),(31,'Confucious','Inspirational','It does not matter how slowly you go as long as you do not stop.',1),(32,'Maya Angelou','Inspirational','You can’t use up creativity.  The more you use, the more you have.',1),(33,'Nico and Vinz','Song','I ain\'t trying to do what everybody else doin\'\r\nJust \'cause everybody doin\' what they all do\r\nIf one thing I know, I\'ll fall but I\'ll grow\r\nI\'m walking down this road of mine, this road that I call home\r\nSo am I wrong?',1),(34,'Bobby McFerrin','Song','In every life we have some trouble\r\nBut when you worry you make it double\r\nDon’t worry, be happy',1),(35,'Bob Marley','Song','Emancipate yourselves from mental slavery\r\nNone but ourselves can free our minds',1),(36,'Bill Withers','Song','Sometimes in our lives\r\nWe all have pain, we all have sorrow\r\nBut if we are wise\r\nWe know that there\'s always tomorrow',1),(37,'R Kelly','Song','I believe I can fly\r\nI believe I can touch the sky\r\nI think about it every night and day\r\nSpread my wings and fly away\r\nI believe I can soar\r\nI see me running through that open door\r\nI believe I can fly',1),(38,'Marvin Gaye','Song','You see, war is not the answer\r\nFor only love can conquer hate',1),(39,'Michael Jackson','Song','I\'m starting with the man in the mirror\r\nI\'m asking him to change his ways\r\nAnd no message could have been any clearer\r\nIf you wanna make the world a better place\r\nTake a look at yourself, and then make a change',1),(40,'Mariah Carey','Song','So when you feel like hope is gone\r\nLook inside you and be strong\r\nAnd you\'ll finally see the truth\r\nThat a hero lies in you',1),(41,'Pharrell Williams','Song','Clap along if you feel like a room without a roof\r\nClap along if you feel like happiness is the truth\r\nClap along if you know what happiness is to you\r\nClap along if you feel like that\'s what you wanna do',1),(42,'R Kelly','Song','I\'m that star up in the sky\r\nI\'m that mountain peak up high\r\nHey, I made it\r\nI\'m the world\'s greatest\r\nAnd I\'m that little bit of hope\r\nWhen my back\'s against the ropes\r\nI can feel it\r\nI\'m the world\'s greatest',1),(43,'Whitney Houston','Song','I decided long ago, never to walk in anyone\'s shadows\r\nIf I fail, if I succeed\r\nAt least I\'ll live as I believe\r\nNo matter what they take from me\r\nThey can\'t take away my dignity\r\nBecause the greatest love of all\r\nIs happening to me\r\nI found the greatest love of all\r\nInside of me\r\nThe greatest love of all\r\nIs easy to achieve\r\nLearning to love yourself\r\nIt is the greatest love of all',1),(44,'Whitney Houston','Song','I believe the children are our future\r\nTeach them well and let them lead the way\r\nShow them all the beauty they possess inside\r\nGive them a sense of pride to make it easier\r\nLet the children\'s laughter remind us how we used to be',1),(45,'Whitney Houston','Song','Everybody\'s searching for a hero\r\nPeople need someone to look up to\r\nI never found anyone who fulfilled my needs\r\nA lonely place to be\r\nAnd so I learned to depend on me',1),(46,'Whitney Houston and Mariah Carey','Song','Many nights we\'ve prayed\r\nWith no proof anyone could hear\r\nIn our hearts a hopeful song\r\nWe barely understood\r\nNow we are not afraid\r\nAlthough we know there\'s much to fear\r\nWe were moving mountains\r\nLong before we knew we could',1),(47,'India.Arie','Song','When I look in the mirror and the only one there is me\r\nEvery freckle on my face is where it’s suppose to be\r\nAnd I know my creator didn’t make no mistakes on me\r\nMy feet, my thighs, my Lips, my eyes, I’m loving what I see',1),(48,'India.Arie','Song','My momma said a lady ain’t what she wears but what she knows',1),(49,'Michael Jackson','Song','Heal The World\r\nMake It A Better Place\r\nFor You And For Me\r\nAnd The Entire Human Race\r\nThere Are People Dying\r\nIf You Care Enough\r\nFor The Living\r\nMake A Better Place\r\nFor You And For Me',1),(50,'Bill Cosby','Inspirational','I don\'t know the key to success, but the key to failure is trying to please everybody.',1),(51,'Bill Cosby','Inspirational','In order to succeed, your desire for success should be greater than your fear of failure.',1),(52,'Bill Cosby','Inspirational','A word to the wise isn\'t necessary, it is the stupid ones who need all the advice.',1),(53,'Bill Cosby','Inspirational','Every closed eye is not sleeping, and every open eye is not seeing.',1),(54,'Woody Allen','Humorous','If only God would give me some clear sign! Like making a large deposit in my name at a Swiss bank.',1),(55,'Woody Allen','Philosophical','If you\'re not failing now and again, it\'s a sign that you\'re not doing anything very innovative.',1),(56,'Woody Allen','Philosophical','Time is nature\'s way of keeping everything from happening at once.',1),(57,'Woody Allen','Humorous','To you I\'m an atheist; to God, I\'m the Loyal Opposition',1),(58,'Abraham Lincoln','Inspirational','Better to remain silent and be thought a fool than to speak and remove all doubt.',1),(59,'Abraham Lincoln','Inspirational','No man has a good enough memory to make a successful liar.',1),(60,'Abraham Lincoln','Inspirational','You cannot escape the responsibility of tomorrow by evading it today.',1),(61,'Benjamin Franklin','Inspirational','Having been poor is no shame, but being ashamed of it is.',1),(62,'Benjamin Franklin','Humorous','Three may keep a secret, if two of them are dead.',1),(63,'Aesop','Humorous','We hang the petty thieves and appoint the great ones to public office.',1),(64,'Henry Ford','Philosophical','Whether you think that you can, or that you can\'t, you are usually right.',1),(65,'Thomas Edison','Inspirational','I have not failed. I\'ve just found 10,000 ways that won\'t work.',1),(66,'Jimmy Durante','Inspirational','Be nice to people on your way up because you\'ll meet them on your way down.',1),(67,'Honore de Balzac','Humorous','Behind every great fortune there is a crime.',1),(68,'Oscar Wilde','Humorous','Bigamy is having one wife too many. Monogamy is the same.',1),(69,'Mohandas Ghandi','Philosophical','An eye for an eye only ends up making the whole world blind.',1),(70,'Samuel Jackson','Inspirational','Great works are performed, not by strength, but by perseverance.',1),(71,'Walt Disney','Inspirational','The way to get started is to quit talking and begin doing.',1),(72,'Mohandas Ghandi','Philosophical','Live as if you were to die tomorrow. Learn as if you were to live forever.',1),(73,'Zig Ziglar','Inspirational','What you get by achieving your goals is not as important as what you become in achieving your goals.',1),(74,'Mark Twain','Inspirational','Courage is resistance to fear, mastery of fear -- not absence of fear.',1),(75,'Steven Wright','Humorous','I\'m writing a book. I\'ve got the page numbers done.',1),(76,'Steven Wright','Humorous','When I was in high school, I got into trouble with my girlfriend\'s dad. He said, \"I want my daughter back by 8:15.\" I said \"the middle of August? Cool.\"',7),(77,'Goethe','Philosophical','To think is easy. To act is hard. But the hardest thing in the world is to act in accordance with your thinking.',1),(78,'Friedrich Engels','Inspirational','An ounce of action is worth a ton of theory.',1),(79,'George Bernard Shaw','Inspirational','We don\'t stop playing because we grow old; We grow old because we stop playing.',1),(80,'Hindu Proverb','Philosophical','There is nothing noble about being superior to some other man. The true nobility is in being superior to your previous self.',1),(81,'Ronald Reagan','Philosophical','Nations do not mistrust each other because they are armed; they are armed because they mistrust each other.',1),(82,'F. Scott Fitzgerald','Inspirational','You don\'t write because you want to say something; you write because you\'ve got something to say.',1),(83,'Sam Ewing','Inspirational','It\'s not the hours you put into your work that count, it\'s the work you put in the hours.',1),(84,'Unknown Author','Philosophical','The richest man is not he who has the most, but he who needs the least.',1),(85,'Unknown Author','Inspirational','Work like you don\'t need money, love like you\'ve never been hurt, and dance like no one\'s watching.',1),(86,'Kurt Vonnegut','Humorous','Those who believe in telekinetics, raise my hand.',1),(87,'Robert Wilensky','Inspirational','We\'ve heard that a million monkeys at a million keyboards could produce the complete works of Sharkespeare; now, thanks to the Internet, we know that is not true.',1),(88,'Christopher Hampton','Humorous','Asking a working writer what he thinks about critics is like asking a lamppost how it feels about dogs.',1),(89,'Albert Einstein','Inspirational','nsanity: doing the same thing over and over again and expecting different results.',1),(90,'Oscar Wilde','Philosophical','Be yourself; everyone else is already taken.',1),(91,'Chinese Proverb','Philosophical','I hear; I forget. I see; I remember. I do; I understand',1),(92,'Barry LePatner','Philosophical','Good judgement comes from experience, and experience comes from bad judgement.',1),(93,'Winston Churchill','Inspirational','Success consists of going from failure to failure without loss of enthusiasm.',1),(94,'Albert Einstein','Inspirational','Education is what remains after one has forgotten what one has learned in school.',1),(95,'Andrew W. Mathis','Humorous','It is bad luck to be superstitious',1),(96,'Edwin Schlossberg','Philosophical','The skill of writing is to create a context in which other people can think.',1),(97,'George Burns','Humorous','It takes only one drink to get me drunk. The trouble is, I can\'t remember if it\'s the thirteenth or the fourteenth.',1),(98,'Henri Youngman','Humorous','My Grandmother is over eighty and still doesn\'t need glasses. Drinks right out of the bottle.',1),(99,'Isaac Newton','Philosophical','If I have seen further, it is by standing on the shoulders of giants.',1),(100,'Jeff Dunteman','Inspirational','A good tool improves the way you work. A great tool improves the way you think.',1),(101,'Joseph Stalin	','Philosophical','A single death is a tragedy; a million deaths is a statistic.',1),(102,'Jules Renard','Humorous','Laziness is nothing more than the habit of resting before you get tired.',1),(103,'Leo Tolstoy','Philosophical','Everyone thinks of changing the world, but no one thinks of changing himself.',1),(104,'Lou Holtz','Inspirational','Life is ten percent what happens to you and ninety percent how you respond to it.',1),(105,'Mark Twain','Humorous','To cease smoking is the easiest thing I ever did; I ought to know because I\'ve done it a thousand times.',1),(106,'Micheal Pritchard','Philosophical','You don\'t stop laughing because you grow old. You grow old because you stop laughing.',1),(107,'Mother Teresa','Philosophical','We can do no great things, only small things with great love.',1),(108,'Olin Miller','Philosophical','You probably wouldn\'t worry about what people think of you if you could know how seldom they do.',1),(109,'Oscar Wilde','Humorous','Imagination was given to man to compensate him for what he is not, and a sense of humour was provided to console him for what he is.',1),(110,'Peter McArthur','Philosophical','Some people have so much respect for their superiors they have none left for themselves.',1),(111,'Reginald B. Mansell','Philosophical','A pessimist is one who makes difficulties of his opportunities; an opportunist is one who makes opportunities of his difficulties.',1),(112,'Reinhold Niebuhr','Inspirational','Grant me the serenity to accept the things I cannot change, courage to change the things I can, and the wisdom to know the difference.',1),(113,'Samuel Johnson','Humorous','Your manuscript is both good and original, but the part that is good is not original and the part that is original is not good.',1),(114,'Unknown Author','Philosophical','The richest man is not he who has the most, but he who needs the least.',1),(115,'Thomas Mann','Inspirational','A writer is someone for whom writing is more difficult than it is for other people.',1),(116,'Pablo Sarasate','Inspirational','A genius! For 37 years I\'ve practised fourteen hours a day, and now they call me a genius!\r\n(Spanish Violinist)',1),(117,'Michelangelo','Inspirational','If people knew how hard I had to work to gain my mastery, it wouldn\'t seem so wonderful at all.',1),(118,'Wayne Dyer','Inspirational','Remind yourself that you cannot fail at being yourself.',10),(119,'Johnny Hunt','Inspirational','Inspiration is about being genuine.',1),(120,'Winston Churchill','Inspirational','Success is walking from failure to failure with no loss of enthusiasm.',9),(121,'Jim Ryun','Inspirational','Motivation is what gets you started. Habit is what keeps you going.',9);
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes_deleted`
--

DROP TABLE IF EXISTS `quotes_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes_deleted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(64) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `quote` text,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes_deleted`
--

LOCK TABLES `quotes_deleted` WRITE;
/*!40000 ALTER TABLE `quotes_deleted` DISABLE KEYS */;
INSERT INTO `quotes_deleted` VALUES (1,'Tony Mathenge','Philosophical','It takes ONE\r\nTo know ONE - and all you need is love, love, LOVE',8),(2,'Andrew Mathenge','Song','This is one of the things,\r\nThat I wanted from life.\r\nOh baby, baby, baby oh',4);
/*!40000 ALTER TABLE `quotes_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tony','tony@email.com','ddc5f5e86d2f85e1b1ff763aff13ce0a'),(2,'andrew','andrew@email.com','d914e3ecf6cc481114a3f534a5faf90b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-11 19:09:03
