-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ai_knowledge_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '绠＄悊鍛業D',
  `username` varchar(50) NOT NULL COMMENT '绠＄悊鍛樼敤鎴峰悕',
  `password` varchar(100) NOT NULL COMMENT '瀵嗙爜',
  `role` varchar(20) DEFAULT 'admin' COMMENT '瑙掕壊',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='绠＄悊鍛樿〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `admin_conversation`
--

DROP TABLE IF EXISTS `admin_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '浼氳瘽ID',
  `admin_id` bigint NOT NULL COMMENT '鍏宠仈鐨勭鐞嗗憳ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '??????' COMMENT '??????',
  `is_pinned` tinyint(1) DEFAULT '0' COMMENT '鏄惁缃《',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '浼氳瘽鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绠＄悊鍛樹細璇濊〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `admin_message`
--

DROP TABLE IF EXISTS `admin_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '娑堟伅ID',
  `conversation_id` bigint NOT NULL COMMENT '鍏宠仈浼氳瘽ID',
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瑙掕壊锛坲ser/assistant锛?,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '??????',
  `sources` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '鍙傝€冩潵婧愶紙JSON鏍煎紡锛?,
  `task_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'unknown' COMMENT '浠诲姟绫诲瀷锛坈hitchat/knowledge_qa/admin_copilot/knowledge_inspection/unknown锛?,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '娑堟伅鍙戦€佹椂闂?,
  PRIMARY KEY (`id`),
  KEY `idx_conversation_id` (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='绠＄悊鍛樻秷鎭〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `agent_run`
--

DROP TABLE IF EXISTS `agent_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_run` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '涓婚敭ID',
  `run_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '杩愯鍞竴鏍囪瘑',
  `trace_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversation_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鍏宠仈鐨勪細璇滻D',
  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '鐢ㄦ埛ID',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '杩愯鐘舵€侊細pending/running/success/failed',
  `goal` text COLLATE utf8mb4_unicode_ci,
  `start_time` datetime NOT NULL COMMENT '寮€濮嬫椂闂?,
  `end_time` datetime DEFAULT NULL COMMENT '缁撴潫鏃堕棿',
  `input` text COLLATE utf8mb4_unicode_ci COMMENT '杈撳叆鍐呭',
  `output` text COLLATE utf8mb4_unicode_ci COMMENT '杈撳嚭鍐呭',
  `error_message` text COLLATE utf8mb4_unicode_ci COMMENT '閿欒淇℃伅锛堝鏋滆繍琛屽け璐ワ級',
  `error_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '璁板綍鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_run_id` (`run_id`) COMMENT '鎸夎繍琛孖D绱㈠紩',
  KEY `idx_status` (`status`) COMMENT '鎸夌姸鎬佺储寮?,
  KEY `idx_conversation_id` (`conversation_id`) COMMENT '鎸変細璇滻D绱㈠紩',
  KEY `idx_start_time` (`start_time`) COMMENT '鎸夊紑濮嬫椂闂寸储寮?
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Agent杩愯璁板綍琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `agent_step`
--

DROP TABLE IF EXISTS `agent_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_step` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '涓婚敭ID',
  `run_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎵€灞炶繍琛孖D',
  `step_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姝ラ鍚嶇О',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姝ラ鐘舵€侊細pending/running/success/failed',
  `input` text COLLATE utf8mb4_unicode_ci COMMENT '姝ラ杈撳叆',
  `output` text COLLATE utf8mb4_unicode_ci COMMENT '姝ラ杈撳嚭',
  `error_message` text COLLATE utf8mb4_unicode_ci COMMENT '閿欒淇℃伅锛堝鏋滄楠ゅけ璐ワ級',
  `start_time` datetime NOT NULL COMMENT '姝ラ寮€濮嬫椂闂?,
  `end_time` datetime DEFAULT NULL COMMENT '姝ラ缁撴潫鏃堕棿',
  `created_at` datetime NOT NULL COMMENT '璁板綍鍒涘缓鏃堕棿',
  `duration_ms` bigint DEFAULT NULL,
  `tool_call_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_run_id` (`run_id`) COMMENT '鎸夎繍琛孖D绱㈠紩',
  KEY `idx_step_name` (`step_name`) COMMENT '鎸夋楠ゅ悕绉扮储寮?,
  KEY `idx_status` (`status`) COMMENT '鎸夌姸鎬佺储寮?,
  KEY `idx_start_time` (`start_time`) COMMENT '鎸夊紑濮嬫椂闂寸储寮?
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Agent鎵ц姝ラ琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '浼氳瘽ID',
  `user_id` bigint NOT NULL COMMENT '鍏宠仈鐨勭敤鎴稩D',
  `title` varchar(255) DEFAULT '鏂板缓浼氳瘽' COMMENT '浼氳瘽鏍囬',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '浼氳瘽鍒涘缓鏃堕棿',
  `is_pinned` tinyint(1) DEFAULT '0' COMMENT '鏄惁缃《',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='浼氳瘽琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `conversation_context`
--

DROP TABLE IF EXISTS `conversation_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_context` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `conversation_id` bigint NOT NULL COMMENT '瀵硅瘽ID',
  `user_id` bigint DEFAULT NULL COMMENT '鐢ㄦ埛ID',
  `summary` text COMMENT '瀵硅瘽鎽樿锛堥暱鏈熻蹇嗭級',
  `embedding` text COMMENT '瀵硅瘽鍚戦噺锛圝SON鏍煎紡锛岀敤浜庣浉浼煎璇濇绱級',
  `window_size` int DEFAULT '10' COMMENT '涓婁笅鏂囩獥鍙ｅぇ灏?,
  `importance_score` double DEFAULT '0.5' COMMENT '閲嶈鎬ц瘎鍒嗭紙0-1锛?,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏈€鍚庢洿鏂版椂闂?,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_conversation_id` (`conversation_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_importance_score` (`importance_score`),
  KEY `idx_update_time` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='瀵硅瘽涓婁笅鏂囪〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `doc_summary`
--

DROP TABLE IF EXISTS `doc_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_summary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `doc_id` bigint NOT NULL COMMENT '鏂囨。ID',
  `summary` text COMMENT '鏂囨。鎽樿',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_doc_id` (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏂囨。鎽樿琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `doc_view_log`
--

DROP TABLE IF EXISTS `doc_view_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_view_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `doc_id` bigint NOT NULL COMMENT '鏂囨。ID',
  `user_id` bigint DEFAULT NULL COMMENT '鐢ㄦ埛ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鏌ョ湅鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_doc_id` (`doc_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏂囨。鏌ョ湅鏃ュ織琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `intermediate_conclusion`
--

DROP TABLE IF EXISTS `intermediate_conclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intermediate_conclusion` (
  `id` varchar(64) NOT NULL,
  `run_id` varchar(64) NOT NULL,
  `step_id` varchar(64) NOT NULL,
  `conclusion_type` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `confidence` decimal(5,4) DEFAULT '0.0000',
  `sources` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_run_id` (`run_id`),
  KEY `idx_step_id` (`step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `knowledge_category`
--

DROP TABLE IF EXISTS `knowledge_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鍒嗙被ID',
  `name` varchar(50) NOT NULL COMMENT '鍒嗙被鍚嶇О',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鐭ヨ瘑搴撳垎绫昏〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `knowledge_chunk`
--

DROP TABLE IF EXISTS `knowledge_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_chunk` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `doc_id` bigint NOT NULL COMMENT '鏉ユ簮鏂囨。ID',
  `chunk_text` text COMMENT '鏂囨。鐗囨鍐呭',
  `chunk_index` int DEFAULT '0' COMMENT '鍒囩墖椤哄簭',
  `page_number` int DEFAULT '1' COMMENT '椤电爜',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_doc_id` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏂囨。鍒囩墖琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `knowledge_doc`
--

DROP TABLE IF EXISTS `knowledge_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_doc` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏂囨。ID',
  `doc_name` varchar(255) NOT NULL COMMENT '鏂囨。鍚嶇О',
  `file_path` varchar(500) NOT NULL COMMENT '鏂囨。瀛樺偍璺緞',
  `category_id` bigint DEFAULT NULL COMMENT '鍒嗙被ID',
  `status` varchar(20) DEFAULT 'PENDING' COMMENT '鏂囨。瑙ｆ瀽鐘舵€侊紙PENDING:瑙ｆ瀽涓? COMPLETED:瑙ｆ瀽瀹屾垚, FAILED:瑙ｆ瀽澶辫触锛?,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鏂囨。涓婁紶鏃堕棿',
  `error_message` text COMMENT '瑙ｆ瀽澶辫触鐨勯敊璇師鍥?,
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鐭ヨ瘑搴撴枃妗ｈ〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '娑堟伅ID',
  `conversation_id` bigint NOT NULL COMMENT '鍏宠仈浼氳瘽ID',
  `role` varchar(20) NOT NULL COMMENT '瑙掕壊锛坲ser/assistant锛?,
  `content` text NOT NULL COMMENT '娑堟伅鍐呭',
  `sources` text COMMENT '鏉ユ簮JSON',
  `task_type` varchar(50) DEFAULT 'unknown' COMMENT '浠诲姟绫诲瀷锛歝hitchat/knowledge_qa/admin_copilot/knowledge_inspection/unknown',
  `importance_score` double DEFAULT '0.5' COMMENT '娑堟伅閲嶈鎬ц瘎鍒嗭紙0-1锛?,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '娑堟伅鍙戦€佹椂闂?,
  `feedback_type` varchar(20) DEFAULT NULL COMMENT '鍙嶉绫诲瀷锛坙ike/dislike锛?,
  `feedback_time` datetime DEFAULT NULL COMMENT '鍙嶉鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_conversation_id` (`conversation_id`),
  KEY `idx_feedback_type` (`feedback_type`)
) ENGINE=InnoDB AUTO_INCREMENT=925 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='娑堟伅琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `message_feedback_stats`
--

DROP TABLE IF EXISTS `message_feedback_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_feedback_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `message_id` bigint NOT NULL COMMENT '鍏宠仈娑堟伅ID',
  `feedback_type` varchar(20) NOT NULL COMMENT '鍙嶉绫诲瀷',
  `user_id` bigint DEFAULT NULL COMMENT '鍙嶉鐢ㄦ埛ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍙嶉鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_feedback_type` (`feedback_type`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='娑堟伅鍙嶉缁熻琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `title` varchar(255) NOT NULL COMMENT '閫氱煡鏍囬',
  `content` text COMMENT '閫氱煡鍐呭',
  `file_path` varchar(500) DEFAULT NULL COMMENT '闄勪欢璺緞',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '鍙戝竷鏃堕棿',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '鏄惁鏈夋晥 1:鏈夋晥 0:鏃犳晥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='浼佷笟閫氱煡琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `qa_log`
--

DROP TABLE IF EXISTS `qa_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鏃ュ織ID',
  `user_id` bigint DEFAULT NULL COMMENT '鍏宠仈鐨勭敤鎴稩D',
  `question` text NOT NULL COMMENT '鐢ㄦ埛鎻愰棶',
  `answer` text NOT NULL COMMENT 'AI 鍥炵瓟',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '璁板綍鏃堕棿',
  `feedback_type` varchar(20) DEFAULT NULL COMMENT '鍙嶉绫诲瀷锛坙ike/dislike锛?,
  `feedback_time` datetime DEFAULT NULL COMMENT '鍙嶉鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='闂瓟鏃ュ織琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `qa_unanswered`
--

DROP TABLE IF EXISTS `qa_unanswered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_unanswered` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '涓婚敭ID',
  `question` varchar(500) NOT NULL COMMENT '闂鍐呭',
  `count` int DEFAULT '1' COMMENT '鎻愰棶娆℃暟',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '棣栨鎻愰棶鏃堕棿',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '鏈€鍚庢洿鏂版椂闂?,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鏈懡涓棶棰樿〃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `tool_call`
--

DROP TABLE IF EXISTS `tool_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_call` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '涓婚敭ID',
  `tool_call_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宸ュ叿璋冪敤鍞竴鏍囪瘑',
  `run_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎵€灞濧gent杩愯ID',
  `tool_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宸ュ叿鍚嶇О',
  `input_params` text COLLATE utf8mb4_unicode_ci COMMENT '杈撳叆鍙傛暟锛圝SON鏍煎紡锛?,
  `output` text COLLATE utf8mb4_unicode_ci COMMENT '杈撳嚭缁撴灉锛圝SON鏍煎紡锛?,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎵ц鐘舵€侊細pending/success/failed',
  `duration_ms` bigint DEFAULT NULL COMMENT '鎵ц鏃堕暱锛堟绉掞級',
  `error_message` text COLLATE utf8mb4_unicode_ci COMMENT '閿欒淇℃伅锛堝鏋滄墽琛屽け璐ワ級',
  `timestamp` datetime NOT NULL COMMENT '鎵ц鏃堕棿',
  `created_at` datetime NOT NULL COMMENT '璁板綍鍒涘缓鏃堕棿',
  PRIMARY KEY (`id`),
  KEY `idx_run_id` (`run_id`) COMMENT '鎸夎繍琛孖D绱㈠紩',
  KEY `idx_status` (`status`) COMMENT '鎸夌姸鎬佺储寮?,
  KEY `idx_tool_name` (`tool_name`) COMMENT '鎸夊伐鍏峰悕绉扮储寮?,
  KEY `idx_timestamp` (`timestamp`) COMMENT '鎸夋墽琛屾椂闂寸储寮?
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='宸ュ叿璋冪敤璁板綍琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐢ㄦ埛ID',
  `username` varchar(50) DEFAULT NULL COMMENT '鐢ㄦ埛鍚?,
  `phone` varchar(20) NOT NULL COMMENT '鎵嬫満鍙?,
  `password` varchar(100) NOT NULL COMMENT '瀵嗙爜',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '娉ㄥ唽鏃堕棿',
  `status` int DEFAULT '1' COMMENT '鐘舵€侊細1-姝ｅ父锛?-灏佺',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='鐢ㄦ埛琛?;
/*!40101 SET character_set_client = @saved_cs_client */;

--
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15 12:56:48
