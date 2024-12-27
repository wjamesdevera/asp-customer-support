-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ticket_db
CREATE DATABASE IF NOT EXISTS `ticket_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ticket_db`;

-- Dumping structure for table ticket_db.comments_tbl
CREATE TABLE IF NOT EXISTS `comments_tbl` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ticket_db.comments_tbl: ~7 rows (approximately)
INSERT INTO `comments_tbl` (`comment_id`, `user_id`, `ticket_id`, `comment`, `created_at`, `updated_at`) VALUES
	(2, 19, 3, 'same problem', '2024-12-27 04:48:24', '2024-12-27 04:48:24'),
	(32, 19, 3, 'same problem', '2024-12-27 08:35:12', '2024-12-27 08:35:12'),
	(33, 19, 3, 'Hello', '2024-12-27 08:45:13', '2024-12-27 08:45:13'),
	(34, 12, 15, 'Hello', '2024-12-27 12:24:48', '2024-12-27 12:24:48'),
	(35, 12, 15, 'Hello', '2024-12-27 12:24:49', '2024-12-27 12:24:49'),
	(36, 19, 15, 'Hello', '2024-12-27 12:26:45', '2024-12-27 12:26:45'),
	(37, 19, 15, 'Did you get a chance to open a new thread on the Fabric community?', '2024-12-27 12:27:03', '2024-12-27 12:27:03');

-- Dumping structure for table ticket_db.tickets_tbl
CREATE TABLE IF NOT EXISTS `tickets_tbl` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ticket_db.tickets_tbl: ~9 rows (approximately)
INSERT INTO `tickets_tbl` (`ticket_id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(3, 1, 'Mounting OneDrive as Network Drive is no longer working', 'I have always been mounting OneDrive as Network Drive by adding "https://d.docs.live.net/CID "\n\nHowever, this method is not working suddenly. It keeps sending me message "Access Denied. Before opening files in this location, you must first add the website to your trusted sites list, browse to the web site, and select the option to login automatically."\n\nAdding d.docs.live.net to trusted sites is not working.\n\nAnyone is experiencing the same issue? And what was your solution?\n', '2024-12-11 08:29:11', '2024-12-11 08:29:11'),
	(4, 1, 'Connect from Azure VM or AKS to Azure Storage using IP restricted SAS token', 'Hi,\n\nI am trying to connect to an Azure Storage using a SAS token which has an allowed IP from a container within an AKS cluster using a NAT gateway or a virtual machine (not routed through NAT).\n\nWhen using either the NAT gateway IP address from the container in AKS or the VM IP I get the following error:\n', '2024-12-11 08:32:34', '2024-12-11 08:32:34'),
	(5, 1, 'openai.RateLimitError - Unable to use Azure Open AI for multi modal input', 'I am using Azure Open AI (gpt-4o) model. With simple text input, the result is returning fine. When provided with image input (multi modal), to extract the data from image it throws error of ratelimiterror. I am currently using Free Trail version. I hope this will not impact the usage of multi modal input. Error below "openai.RateLimitError: Error code: 429 - {\'error\': {\'code\': \'429\', \'message\': \'Requests to the ChatCompletions_Create Operation under Azure OpenAI API version 2024-08-01-preview have exceeded token rate limit of your current AIServices S0 pricing tier. Please retry after 86400 seconds. Please contact Azure support service if you would like to further increase the default rate limit.\'}}"', '2024-12-23 18:29:48', '2024-12-23 18:29:48'),
	(6, 1, 'Cannot Change Read-Only Status of Folder for Saving Files in Excel VBA on Windows 11 Pro.', 'I\'m running Win 11 Pro, Microsoft® Excel® for Microsoft 365 MSO (Version 2412 Build 16.0.18324.20092) 64-bit. I am having a problem saving a file using VBA now using the code below, although the macro used to work without a problem. ActiveWorkbook.SaveAs Filename:=toPaths(i), FileFormat:=xlCSVUTF8, _', '2024-12-23 18:35:56', '2024-12-23 18:35:56'),
	(11, 15, 'I am unable to create index in Azure AI search using C#', 'I have followed below git repo to create index in Azure AI Search (Line 231 - 307) https://github.com/Azure/azure-search-vector-samples/blob/main/demo-dotnet/DotNetVectorDemo/Program.cs\nI am not using SemanticSearch so removed code from Line 266 - 283', '2024-12-26 16:29:23', '2024-12-26 16:29:23'),
	(12, 15, 'signup.azure.com error - We’re unable to validate your phone number', 'signup.azure.com error - We’re unable to validate your phone number', '2024-12-26 16:30:55', '2024-12-26 16:30:55'),
	(13, 15, 'How to troubleshoot the VPN Connectivity issue in Microsoft Surcface Pro (11th Edition)?', 'Hello,Recently i have purchased microsoft newsurface pro (11 Edition) windows 11 home copilot with ARM based processor .I installed the forticlient VPN on the device.However,I am unable to establish a connection to the VPN.\nSteps taken So Far:\n1.Checked my internet connection(works fine).\n2.Reinstalled the Forticlient VPN application\n3.Verified the VPN credentials and settings\nDespite these steps,the issue persists.\nRequest:\nplease assist me in troubleshooting the VPN Connectivity issue.Let me Know if additional system logs or information are required to resolve the problem.', '2024-12-26 16:32:20', '2024-12-26 16:32:20'),
	(14, 19, 'MSSQL 2022 - SSISDB ETL returning "...failed with the following error: "An error occurred in the Microsoft .NET Framework while trying to load assembl', 'Full error from the Integration Catalog in question:\n\nSQL Load Queue List into Object:Error: Executing the query "EXEC [My PROC name]" failed with the following error: "An error occurred in the Microsoft .NET Framework while trying to load assembly id 65536. The server may be running out of resources, or the assembly may not be trusted. Run the query again, or check documentation to see how to solve the assembly trust issues. For more information about this error:\n\nSystem.IO.FileLoadException: Could not load file or assembly \'clr, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\' or one of its dependencies. An error relating to security occurred. (Exception from HRESULT: 0x8013150A)\n\nSystem.IO.FileLoadException:\n\nat System.Reflection.RuntimeAssembly._nLoad(AssemblyName fileName, String codeBase, Evidence assemblySecurity, RuntimeAssembly locationHint, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean throwOnFileNotFound, Boolean forIntrospection, Boolean suppressSecurityChecks)\n\nat System.Reflection.RuntimeAssembly.InternalLoadAssemblyName(AssemblyName assemblyRef, Evidence assemblySecurity, RuntimeAssembly reqAssembly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean throwOnFileNotFound, Boolean forIntrospection, Boolean suppressSecurityChecks)\n\nat System.Reflection.RuntimeAssembly.InternalLoad(String assemblyString, Evidence assemblySecurity, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean forIntrospection)\n\nat System.Reflection.RuntimeAssembly.InternalLoad(String assemblyString, Evidence assemblySecurity, StackCrawlMark& stackMark, Boolean forIntrospection)\n\nat System.Reflection.Assembly.Load(String assemblyString)\n\n". Possible failure reasons: Problems with the query, "ResultSet" property not set correctly, parameters not set correctly, or connection not established correctly.\n\nI have done the following: - Changed DB owner to \'SA\'\n\n    Set CLR Enabled\n    Set CLR Security On\n    Set SSISDB Trustworthy on\n\nSQL: ALTER DATABASE SSISDB SET TRUSTWORTHY ON;', '2024-12-26 18:17:35', '2024-12-26 18:17:35'),
	(15, 12, 'Power BI: Azure AD single sign-on (SSO) through the data gateway is disabled for this organization', 'Hi,\n\nWe have installed Azure synapse Analytics workspace in a Private endpoint and created a Power BI subnet inside the VNet which is hosting the Synapse dedicated pool. Now we have deployed the VNet gateway and created connection but when we try to enable the Power BI Direct query connection in the Connections tab by enabling the single singon I get this message and I am not sure how to enable it. the message is "Azure AD single sign-on (SSO) through the data gateway is disabled for this organization " and it does not give a chance to enable single sign-on.\n\nAny clue!!\n\nRegards\n\nRajaniesh', '2024-12-27 12:24:42', '2024-12-27 12:24:42');

-- Dumping structure for table ticket_db.users_tbl
CREATE TABLE IF NOT EXISTS `users_tbl` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT '"Anonymous"',
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ticket_db.users_tbl: ~13 rows (approximately)
INSERT INTO `users_tbl` (`user_id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'Winfrey', NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'Winfrey', NULL, NULL, NULL, '2024-12-10 10:26:18', '2024-12-10 10:26:18'),
	(3, 'Wilson', NULL, NULL, NULL, '2024-12-10 10:26:31', '2024-12-10 10:26:31'),
	(4, 'Wesley', NULL, NULL, NULL, '2024-12-10 10:27:05', '2024-12-10 10:27:05'),
	(5, 'Wesley', NULL, NULL, NULL, '2024-12-10 10:43:45', '2024-12-10 10:43:45'),
	(6, 'Wesley', NULL, NULL, NULL, '2024-12-10 10:47:30', '2024-12-10 10:47:30'),
	(7, 'Wesley', 'Winfrey', 'wjamesdevera@gmail.com', 'password123', '2024-12-10 10:48:05', '2024-12-10 10:48:05'),
	(8, 'Winfrey', 'De Vera', 'wjamesdevera@gmail.com', 'AB+ckj7lCEZw4a4GD668+tGmbw70czuy4a89Ad5n+aEsW0pR1ty+hTrWE2jUvlTu/g==', '2024-12-11 05:23:06', '2024-12-11 05:23:06'),
	(9, 'Winfrey', 'De Vera', 'wjamesdevera@gmail.com', 'AJDWhAryjQmrsOBvH+IA5oJkCH3Pq1duOybph3WRk67UZmNHSHEMz/Gz7S73U5It0Q==', '2024-12-11 05:24:48', '2024-12-11 05:24:48'),
	(10, 'Winfrey', NULL, NULL, NULL, '2024-12-11 07:34:04', '2024-12-11 07:34:04'),
	(12, 'Margaret', 'Dela Cerna', 'margaret.delacerna@gmail.com', 'AKut677ZAu+XVl9IMEdkjnHQF4KaTa+QqMOM9wFPlNyxnEm4kUrXQZZwJ9UF9Q3MsA==', '2024-12-22 16:03:23', '2024-12-22 16:03:23'),
	(18, 'Winfrey James', 'De Vera', 'admin123@gmail.com', 'AG1bjAmAKzvuSHVKR1e1So+9Dnbm/X7DsG/dz/lYhG9T9qGlGOYudwtcTTpmEdFlPg==', '2024-12-26 18:10:21', '2024-12-26 18:10:21'),
	(19, 'Winfrey', 'De Vera', 'admin@gmail.com', 'AD55DIslqb8U4OzOXZ65z9YuOTWHT32os9xQe8p0DhImY/oWy7QYX34MLQBk66inFA==', '2024-12-26 18:16:28', '2024-12-26 18:16:28');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
