-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2023 at 02:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_malpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `cd_branches`
--

CREATE TABLE `cd_branches` (
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cd_branches`
--

INSERT INTO `cd_branches` (`cd_branch_id`, `name`, `cd_brand_id`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'KFC Johar Town', 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `cd_branch_types`
--

CREATE TABLE `cd_branch_types` (
  `cd_branch_type_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_brands`
--

CREATE TABLE `cd_brands` (
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cd_brands`
--

INSERT INTO `cd_brands` (`cd_brand_id`, `name`, `cd_client_id`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'KFC', 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `cd_clients`
--

CREATE TABLE `cd_clients` (
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `city_id` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `client_role` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cd_clients`
--

INSERT INTO `cd_clients` (`cd_client_id`, `name`, `email`, `address`, `is_active`, `country_id`, `city_id`, `phone_no`, `client_role`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Faheem', 'fahim.bilal.ch@gmail.com', 'Lahore', 1, 'pakistan', 'Lahore', '03040891842', 'Admin', '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(2, 'umar', 'umar@gmail.com', 'Lahore', 1, 'pakistan', 'Lahore', '03040891842', 'Admin', '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `cd_client_groups`
--

CREATE TABLE `cd_client_groups` (
  `cd_client_group_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_customer_representatives`
--

CREATE TABLE `cd_customer_representatives` (
  `cd_customer_representative_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_demo_requests`
--

CREATE TABLE `cd_demo_requests` (
  `cd_demo_request_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_roles`
--

CREATE TABLE `cd_roles` (
  `cd_role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role_type` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cd_roles`
--

INSERT INTO `cd_roles` (`cd_role_id`, `name`, `description`, `role_type`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'CFO', 'Chief Financial Officer', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(2, 'Accounts Manager', 'Accounts Manager', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(3, 'Accounts Officer', 'Accounts Officer', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(4, 'Technical Support', 'Technical Support', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(5, 'Functional Support', 'Functional Support', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(6, 'Director', 'Director', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(7, 'Sales Manager', 'Sales Manager', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(8, 'Operation Manager', 'Operation Manager', 'super_admin_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(9, 'User Management', 'User Management', 'client_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(10, 'Inventory Manager', 'Inventory Manager', 'client_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(11, 'Customer Management', 'Customer Management', 'client_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(12, 'Pricing and Tax Manager', 'Pricing and Tax Manager', 'client_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(13, 'Sales Reporting', 'Sales Reporting', 'client_role', 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `cd_role_hiararchies`
--

CREATE TABLE `cd_role_hiararchies` (
  `cd_role_hiararchy_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_subscriptions`
--

CREATE TABLE `cd_subscriptions` (
  `cd_subscription_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_users`
--

CREATE TABLE `cd_users` (
  `cd_user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `actions` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cd_web_visitors`
--

CREATE TABLE `cd_web_visitors` (
  `cd_web_visitor_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gd_cities`
--

CREATE TABLE `gd_cities` (
  `gd_city_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gd_countries`
--

CREATE TABLE `gd_countries` (
  `gd_country_id` bigint(20) UNSIGNED NOT NULL,
  `gd_country_code` varchar(255) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gd_languages`
--

CREATE TABLE `gd_languages` (
  `gd_language_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gd_licenses`
--

CREATE TABLE `gd_licenses` (
  `gd_license_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gd_notifications`
--

CREATE TABLE `gd_notifications` (
  `gd_notification_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gd_regions`
--

CREATE TABLE `gd_regions` (
  `gd_region_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_add_ons`
--

CREATE TABLE `md_add_ons` (
  `md_add_on_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_banks`
--

CREATE TABLE `md_banks` (
  `md_bank_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_bank_accounts`
--

CREATE TABLE `md_bank_accounts` (
  `md_bank_account_id` bigint(20) UNSIGNED NOT NULL,
  `bank_account_id` varchar(255) NOT NULL,
  `tender_type` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_bill_of_materials`
--

CREATE TABLE `md_bill_of_materials` (
  `md_bill_of_material_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_chart_of_accounts`
--

CREATE TABLE `md_chart_of_accounts` (
  `md_chart_of_account_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_define_product_suppliers`
--

CREATE TABLE `md_define_product_suppliers` (
  `md_define_product_supplier_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_discounts`
--

CREATE TABLE `md_discounts` (
  `md_discount_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_drivers`
--

CREATE TABLE `md_drivers` (
  `md_driver_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_employee_roles`
--

CREATE TABLE `md_employee_roles` (
  `md_employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_employee_shifts`
--

CREATE TABLE `md_employee_shifts` (
  `md_employee_shift_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_employee_tables`
--

CREATE TABLE `md_employee_tables` (
  `md_employee_table_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_e_menu_groups`
--

CREATE TABLE `md_e_menu_groups` (
  `md_e_menu_group_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_e_menu_settings`
--

CREATE TABLE `md_e_menu_settings` (
  `md_e_menu_setting_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_inventory_stores`
--

CREATE TABLE `md_inventory_stores` (
  `md_inventory_store_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_item_groupings`
--

CREATE TABLE `md_item_groupings` (
  `md_item_grouping_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_item_groups`
--

CREATE TABLE `md_item_groups` (
  `md_item_group_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_item_prices`
--

CREATE TABLE `md_item_prices` (
  `md_item_price_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_kitchens`
--

CREATE TABLE `md_kitchens` (
  `md_kitchen_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_locators`
--

CREATE TABLE `md_locators` (
  `md_locator_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_menu_arrangments`
--

CREATE TABLE `md_menu_arrangments` (
  `md_menu_arrangment_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_offer_and_promotions`
--

CREATE TABLE `md_offer_and_promotions` (
  `md_offer_and_pormotion_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_production_requests`
--

CREATE TABLE `md_production_requests` (
  `md_production_request_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_products`
--

CREATE TABLE `md_products` (
  `md_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `md_product_category_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `md_products`
--

INSERT INTO `md_products` (`md_product_id`, `product_code`, `product_name`, `product_price`, `product_image`, `md_product_category_id`, `cd_client_id`, `cd_brand_id`, `cd_branch_id`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'r1', 'Rice', '400', '20230529053651.jpg', 1, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(2, 'r2', 'biryani', '500', '20230529053651.jpg', 1, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(3, 'ex1', 'Expresso', '250', '20230529053718.jpg', 2, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(4, 'cc1', 'Cup Cake', '590', '20230529053746.jpg', 3, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(5, 'sw1', 'Sandwich', '650', '20230529053815.jpg', 4, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(6, 'swm1', 'Sandwich mix', '700', '20230529053840.jpg', 5, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(7, 'd1', 'Drink', '200', '20230529053905.jpg', 6, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(8, 'f1', 'Fish', '1200', '20230529053929.jpg', 7, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(9, 'pz1', 'Pizza', '1400', '20230529053959.jpg', 8, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(10, 'gb1', 'Garlic Bread', '700', '20230529054031.jpg', 9, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(11, 'bj1', 'Blue Juice', '250', '20230529054055.jpg', 10, 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `md_product_categories`
--

CREATE TABLE `md_product_categories` (
  `md_product_category_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_code` varchar(255) NOT NULL,
  `product_category_name` varchar(255) NOT NULL,
  `product_category_description` varchar(255) DEFAULT NULL,
  `product_category_image` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `md_product_categories`
--

INSERT INTO `md_product_categories` (`md_product_category_id`, `product_category_code`, `product_category_name`, `product_category_description`, `product_category_image`, `cd_client_id`, `cd_brand_id`, `cd_branch_id`, `is_active`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'r1', 'Rice', 'Rice', '20230529053651.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(2, 'ex1', 'Expresso', 'Expresso', '20230529053718.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(3, 'cc1', 'Cup Cake', 'Cup Cake', '20230529053746.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(4, 'sw1', 'Sandwich', 'Sandwich', '20230529053815.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(5, 'swm1', 'Sandwich mix', 'Sandwich mix', '20230529053840.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(6, 'd1', 'Drink', 'Drink', '20230529053905.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(7, 'f1', 'Fish', 'Fish', '20230529053929.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(8, 'pz1', 'Pizza', 'Pizza', '20230529053959.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(9, 'gb1', 'Garlic Bread', 'Garlic Bread', '20230529054031.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14'),
(10, 'bj1', 'Blue Juice', 'Blue Juice', '20230529054055.jpg', 1, 1, 1, 1, '1', '1', '2023-07-14 06:45:14', '2023-07-14 06:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `md_product_groups`
--

CREATE TABLE `md_product_groups` (
  `md_product_group_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_product_requests`
--

CREATE TABLE `md_product_requests` (
  `md_product_request_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_raw_materials`
--

CREATE TABLE `md_raw_materials` (
  `md_raw_material_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_requests`
--

CREATE TABLE `md_requests` (
  `md_request_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_role_hierarchies`
--

CREATE TABLE `md_role_hierarchies` (
  `md_role_hierarchy_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_stations`
--

CREATE TABLE `md_stations` (
  `md_station_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_suppliers`
--

CREATE TABLE `md_suppliers` (
  `md_supplier_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_unit_of_measurements`
--

CREATE TABLE `md_unit_of_measurements` (
  `md_unit_of_measurement_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `md_ware_houses`
--

CREATE TABLE `md_ware_houses` (
  `md_ware_house_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_15_061504_create_td_dashboard_preferences_table', 1),
(7, '2023_06_15_061600_create_td_web_chats_table', 1),
(8, '2023_06_15_061713_create_gd_languages_table', 1),
(9, '2023_06_15_061824_create_gd_countries_table', 1),
(10, '2023_06_15_061850_create_gd_cities_table', 1),
(11, '2023_06_15_061906_create_gd_regions_table', 1),
(12, '2023_06_15_061942_create_gd_licenses_table', 1),
(13, '2023_06_15_062010_create_cd_clients_table', 1),
(14, '2023_06_15_062040_create_td_leads_table', 1),
(15, '2023_06_15_062119_create_cd_client_groups_table', 1),
(16, '2023_06_15_062204_create_cd_demo_requests_table', 1),
(17, '2023_06_15_062237_create_cd_web_visitors_table', 1),
(18, '2023_06_15_062303_create_gd_notifications_table', 1),
(19, '2023_06_15_062356_create_td_customer_tickets_table', 1),
(20, '2023_06_15_062425_create_cd_roles_table', 1),
(21, '2023_06_15_062440_create_cd_users_table', 1),
(22, '2023_06_15_062534_create_cd_role_hiararchies_table', 1),
(23, '2023_06_15_062652_create_cd_customer_representatives_table', 1),
(24, '2023_06_15_062736_create_cd_subscriptions_table', 1),
(25, '2023_06_15_062744_create_cd_brands_table', 1),
(26, '2023_06_15_062813_create_cd_branch_types_table', 1),
(27, '2023_06_15_062821_create_cd_branches_table', 1),
(28, '2023_06_15_062840_create_md_banks_table', 1),
(29, '2023_06_15_062858_create_md_bank_accounts_table', 1),
(30, '2023_06_15_062923_create_md_discounts_table', 1),
(31, '2023_06_15_062951_create_md_chart_of_accounts_table', 1),
(32, '2023_06_15_063027_create_td_payment_transactions_table', 1),
(33, '2023_06_15_063119_create_td_currency_conversio_rates_table', 1),
(34, '2023_06_15_063214_create_md_item_prices_table', 1),
(35, '2023_06_15_063259_create_md_offer_and_promotions_table', 1),
(36, '2023_06_15_063336_create_md_stations_table', 1),
(37, '2023_06_15_063643_create_md_products_table', 1),
(38, '2023_06_15_063809_create_md_item_groupings_table', 1),
(39, '2023_06_15_063931_create_md_add_ons_table', 1),
(40, '2023_06_15_064027_create_md_kitchens_table', 1),
(41, '2023_06_15_064050_create_md_inventory_stores_table', 1),
(42, '2023_06_15_064131_create_md_item_groups_table', 1),
(43, '2023_06_15_064449_create_md_menu_arrangments_table', 1),
(44, '2023_06_15_064526_create_md_e_menu_groups_table', 1),
(45, '2023_06_15_064541_create_md_e_menu_settings_table', 1),
(46, '2023_06_15_064610_create_md_employee_tables_table', 1),
(47, '2023_06_15_064659_create_md_employee_roles_table', 1),
(48, '2023_06_15_064741_create_md_role_hierarchies_table', 1),
(49, '2023_06_15_064809_create_md_employee_shifts_table', 1),
(50, '2023_06_15_064855_create_md_unit_of_measurements_table', 1),
(51, '2023_06_15_064937_create_md_ware_houses_table', 1),
(52, '2023_06_15_064957_create_md_locators_table', 1),
(53, '2023_06_15_065020_create_md_product_groups_table', 1),
(54, '2023_06_15_065035_create_md_raw_materials_table', 1),
(55, '2023_06_15_065110_create_md_bill_of_materials_table', 1),
(56, '2023_06_15_065215_create_md_production_requests_table', 1),
(57, '2023_06_15_065221_create_md_requests_table', 1),
(58, '2023_06_15_065314_create_td_store_adjustments_table', 1),
(59, '2023_06_15_065354_create_md_suppliers_table', 1),
(60, '2023_06_15_065457_create_td_purchase_orders_table', 1),
(61, '2023_06_15_065529_create_md_product_requests_table', 1),
(62, '2023_06_15_065559_create_td_store_transfers_table', 1),
(63, '2023_06_15_070207_create_md_define_product_suppliers_table', 1),
(64, '2023_06_15_070231_create_md_drivers_table', 1),
(65, '2023_06_15_070302_create_td_reservations_table', 1),
(66, '2023_06_15_070347_create_td_sale_orders_table', 1),
(67, '2023_06_21_065044_create_md_product_categories_table', 1),
(68, '2023_06_22_051837_create_td_sale_order_items_table', 1),
(69, '2023_06_23_104636_create_td_payment_details_table', 1),
(70, '2023_07_07_080709_create_td_tax_categories_table', 1),
(71, '2023_07_07_080732_create_td_tax_rates_table', 1),
(72, '2023_07_14_061459_create_td_currencies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_currencies`
--

CREATE TABLE `td_currencies` (
  `td_currency_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency_type` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_currency_conversio_rates`
--

CREATE TABLE `td_currency_conversio_rates` (
  `td_curreny_conversio_rate_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_customer_tickets`
--

CREATE TABLE `td_customer_tickets` (
  `td_customer_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_dashboard_preferences`
--

CREATE TABLE `td_dashboard_preferences` (
  `td_dashboard_preference_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_leads`
--

CREATE TABLE `td_leads` (
  `td_lead_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_payment_details`
--

CREATE TABLE `td_payment_details` (
  `td_payment_detail_id` bigint(20) UNSIGNED NOT NULL,
  `tender_type` varchar(255) NOT NULL,
  `payment_amount` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `td_sale_order_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `routing_number` varchar(255) DEFAULT NULL,
  `check_number` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `date_promised` date DEFAULT NULL,
  `credit_card` varchar(255) DEFAULT NULL,
  `credit_card_number` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_payment_transactions`
--

CREATE TABLE `td_payment_transactions` (
  `td_payment_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_purchase_orders`
--

CREATE TABLE `td_purchase_orders` (
  `td_purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_reservations`
--

CREATE TABLE `td_reservations` (
  `td_reservation_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_sale_orders`
--

CREATE TABLE `td_sale_orders` (
  `td_sale_order_id` bigint(20) UNSIGNED NOT NULL,
  `td_sale_order_code` varchar(255) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `cancel_comment` varchar(255) DEFAULT NULL,
  `card_holder_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` varchar(255) DEFAULT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_sale_order_items`
--

CREATE TABLE `td_sale_order_items` (
  `td_sale_order_item_id` bigint(20) UNSIGNED NOT NULL,
  `td_sale_order_id` bigint(20) UNSIGNED NOT NULL,
  `md_product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_store_adjustments`
--

CREATE TABLE `td_store_adjustments` (
  `td_store_adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_store_transfers`
--

CREATE TABLE `td_store_transfers` (
  `td_store_transfer_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_tax_categories`
--

CREATE TABLE `td_tax_categories` (
  `td_tax_category_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_tax_rates`
--

CREATE TABLE `td_tax_rates` (
  `td_tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `td_tax_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `valid_form` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `td_web_chats`
--

CREATE TABLE `td_web_chats` (
  `td_web_chat_id` bigint(20) UNSIGNED NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `cd_role_id` bigint(20) UNSIGNED NOT NULL,
  `actions` varchar(255) NOT NULL,
  `cd_client_id` bigint(20) UNSIGNED NOT NULL,
  `cd_brand_id` bigint(20) UNSIGNED NOT NULL,
  `cd_branch_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `cd_role_id`, `actions`, `cd_client_id`, `cd_brand_id`, `cd_branch_id`, `is_active`, `created_by`, `updated_by`, `token`, `pin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$emLxxUlL5sFl1cwg1Y9LRuWUG0j83ZcVV770eIl.DNAIUgaKBQXgu', 1, '1', 1, 1, 1, 1, '1', '1', NULL, NULL, NULL, '2023-07-14 06:45:15', '2023-07-14 06:45:15'),
(2, 'Faheem', 'faheem@gmail.com', NULL, '$2y$10$xGImvCXxRsFCjNp5yQ6CT.ZyjtMA6eAvWTCYn1jntvJWpq2PGL81.', 1, '1', 1, 1, 1, 1, '1', '1', NULL, NULL, NULL, '2023-07-14 06:45:15', '2023-07-14 06:45:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cd_branches`
--
ALTER TABLE `cd_branches`
  ADD PRIMARY KEY (`cd_branch_id`);

--
-- Indexes for table `cd_branch_types`
--
ALTER TABLE `cd_branch_types`
  ADD PRIMARY KEY (`cd_branch_type_id`);

--
-- Indexes for table `cd_brands`
--
ALTER TABLE `cd_brands`
  ADD PRIMARY KEY (`cd_brand_id`);

--
-- Indexes for table `cd_clients`
--
ALTER TABLE `cd_clients`
  ADD PRIMARY KEY (`cd_client_id`);

--
-- Indexes for table `cd_client_groups`
--
ALTER TABLE `cd_client_groups`
  ADD PRIMARY KEY (`cd_client_group_id`);

--
-- Indexes for table `cd_customer_representatives`
--
ALTER TABLE `cd_customer_representatives`
  ADD PRIMARY KEY (`cd_customer_representative_id`);

--
-- Indexes for table `cd_demo_requests`
--
ALTER TABLE `cd_demo_requests`
  ADD PRIMARY KEY (`cd_demo_request_id`);

--
-- Indexes for table `cd_roles`
--
ALTER TABLE `cd_roles`
  ADD PRIMARY KEY (`cd_role_id`);

--
-- Indexes for table `cd_role_hiararchies`
--
ALTER TABLE `cd_role_hiararchies`
  ADD PRIMARY KEY (`cd_role_hiararchy_id`);

--
-- Indexes for table `cd_subscriptions`
--
ALTER TABLE `cd_subscriptions`
  ADD PRIMARY KEY (`cd_subscription_id`);

--
-- Indexes for table `cd_users`
--
ALTER TABLE `cd_users`
  ADD PRIMARY KEY (`cd_user_id`);

--
-- Indexes for table `cd_web_visitors`
--
ALTER TABLE `cd_web_visitors`
  ADD PRIMARY KEY (`cd_web_visitor_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gd_cities`
--
ALTER TABLE `gd_cities`
  ADD PRIMARY KEY (`gd_city_id`);

--
-- Indexes for table `gd_countries`
--
ALTER TABLE `gd_countries`
  ADD PRIMARY KEY (`gd_country_id`);

--
-- Indexes for table `gd_languages`
--
ALTER TABLE `gd_languages`
  ADD PRIMARY KEY (`gd_language_id`);

--
-- Indexes for table `gd_licenses`
--
ALTER TABLE `gd_licenses`
  ADD PRIMARY KEY (`gd_license_id`);

--
-- Indexes for table `gd_notifications`
--
ALTER TABLE `gd_notifications`
  ADD PRIMARY KEY (`gd_notification_id`);

--
-- Indexes for table `gd_regions`
--
ALTER TABLE `gd_regions`
  ADD PRIMARY KEY (`gd_region_id`);

--
-- Indexes for table `md_add_ons`
--
ALTER TABLE `md_add_ons`
  ADD PRIMARY KEY (`md_add_on_id`);

--
-- Indexes for table `md_banks`
--
ALTER TABLE `md_banks`
  ADD PRIMARY KEY (`md_bank_id`);

--
-- Indexes for table `md_bank_accounts`
--
ALTER TABLE `md_bank_accounts`
  ADD PRIMARY KEY (`md_bank_account_id`);

--
-- Indexes for table `md_bill_of_materials`
--
ALTER TABLE `md_bill_of_materials`
  ADD PRIMARY KEY (`md_bill_of_material_id`);

--
-- Indexes for table `md_chart_of_accounts`
--
ALTER TABLE `md_chart_of_accounts`
  ADD PRIMARY KEY (`md_chart_of_account_id`);

--
-- Indexes for table `md_define_product_suppliers`
--
ALTER TABLE `md_define_product_suppliers`
  ADD PRIMARY KEY (`md_define_product_supplier_id`);

--
-- Indexes for table `md_discounts`
--
ALTER TABLE `md_discounts`
  ADD PRIMARY KEY (`md_discount_id`);

--
-- Indexes for table `md_drivers`
--
ALTER TABLE `md_drivers`
  ADD PRIMARY KEY (`md_driver_id`);

--
-- Indexes for table `md_employee_roles`
--
ALTER TABLE `md_employee_roles`
  ADD PRIMARY KEY (`md_employee_role_id`);

--
-- Indexes for table `md_employee_shifts`
--
ALTER TABLE `md_employee_shifts`
  ADD PRIMARY KEY (`md_employee_shift_id`);

--
-- Indexes for table `md_employee_tables`
--
ALTER TABLE `md_employee_tables`
  ADD PRIMARY KEY (`md_employee_table_id`);

--
-- Indexes for table `md_e_menu_groups`
--
ALTER TABLE `md_e_menu_groups`
  ADD PRIMARY KEY (`md_e_menu_group_id`);

--
-- Indexes for table `md_e_menu_settings`
--
ALTER TABLE `md_e_menu_settings`
  ADD PRIMARY KEY (`md_e_menu_setting_id`);

--
-- Indexes for table `md_inventory_stores`
--
ALTER TABLE `md_inventory_stores`
  ADD PRIMARY KEY (`md_inventory_store_id`);

--
-- Indexes for table `md_item_groupings`
--
ALTER TABLE `md_item_groupings`
  ADD PRIMARY KEY (`md_item_grouping_id`);

--
-- Indexes for table `md_item_groups`
--
ALTER TABLE `md_item_groups`
  ADD PRIMARY KEY (`md_item_group_id`);

--
-- Indexes for table `md_item_prices`
--
ALTER TABLE `md_item_prices`
  ADD PRIMARY KEY (`md_item_price_id`);

--
-- Indexes for table `md_kitchens`
--
ALTER TABLE `md_kitchens`
  ADD PRIMARY KEY (`md_kitchen_id`);

--
-- Indexes for table `md_locators`
--
ALTER TABLE `md_locators`
  ADD PRIMARY KEY (`md_locator_id`);

--
-- Indexes for table `md_menu_arrangments`
--
ALTER TABLE `md_menu_arrangments`
  ADD PRIMARY KEY (`md_menu_arrangment_id`);

--
-- Indexes for table `md_offer_and_promotions`
--
ALTER TABLE `md_offer_and_promotions`
  ADD PRIMARY KEY (`md_offer_and_pormotion_id`);

--
-- Indexes for table `md_production_requests`
--
ALTER TABLE `md_production_requests`
  ADD PRIMARY KEY (`md_production_request_id`);

--
-- Indexes for table `md_products`
--
ALTER TABLE `md_products`
  ADD PRIMARY KEY (`md_product_id`);

--
-- Indexes for table `md_product_categories`
--
ALTER TABLE `md_product_categories`
  ADD PRIMARY KEY (`md_product_category_id`);

--
-- Indexes for table `md_product_groups`
--
ALTER TABLE `md_product_groups`
  ADD PRIMARY KEY (`md_product_group_id`);

--
-- Indexes for table `md_product_requests`
--
ALTER TABLE `md_product_requests`
  ADD PRIMARY KEY (`md_product_request_id`);

--
-- Indexes for table `md_raw_materials`
--
ALTER TABLE `md_raw_materials`
  ADD PRIMARY KEY (`md_raw_material_id`);

--
-- Indexes for table `md_requests`
--
ALTER TABLE `md_requests`
  ADD PRIMARY KEY (`md_request_id`);

--
-- Indexes for table `md_role_hierarchies`
--
ALTER TABLE `md_role_hierarchies`
  ADD PRIMARY KEY (`md_role_hierarchy_id`);

--
-- Indexes for table `md_stations`
--
ALTER TABLE `md_stations`
  ADD PRIMARY KEY (`md_station_id`);

--
-- Indexes for table `md_suppliers`
--
ALTER TABLE `md_suppliers`
  ADD PRIMARY KEY (`md_supplier_id`);

--
-- Indexes for table `md_unit_of_measurements`
--
ALTER TABLE `md_unit_of_measurements`
  ADD PRIMARY KEY (`md_unit_of_measurement_id`);

--
-- Indexes for table `md_ware_houses`
--
ALTER TABLE `md_ware_houses`
  ADD PRIMARY KEY (`md_ware_house_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `td_currencies`
--
ALTER TABLE `td_currencies`
  ADD PRIMARY KEY (`td_currency_id`);

--
-- Indexes for table `td_currency_conversio_rates`
--
ALTER TABLE `td_currency_conversio_rates`
  ADD PRIMARY KEY (`td_curreny_conversio_rate_id`);

--
-- Indexes for table `td_customer_tickets`
--
ALTER TABLE `td_customer_tickets`
  ADD PRIMARY KEY (`td_customer_ticket_id`);

--
-- Indexes for table `td_dashboard_preferences`
--
ALTER TABLE `td_dashboard_preferences`
  ADD PRIMARY KEY (`td_dashboard_preference_id`);

--
-- Indexes for table `td_leads`
--
ALTER TABLE `td_leads`
  ADD PRIMARY KEY (`td_lead_id`);

--
-- Indexes for table `td_payment_details`
--
ALTER TABLE `td_payment_details`
  ADD PRIMARY KEY (`td_payment_detail_id`);

--
-- Indexes for table `td_payment_transactions`
--
ALTER TABLE `td_payment_transactions`
  ADD PRIMARY KEY (`td_payment_transaction_id`);

--
-- Indexes for table `td_purchase_orders`
--
ALTER TABLE `td_purchase_orders`
  ADD PRIMARY KEY (`td_purchase_order_id`);

--
-- Indexes for table `td_reservations`
--
ALTER TABLE `td_reservations`
  ADD PRIMARY KEY (`td_reservation_id`);

--
-- Indexes for table `td_sale_orders`
--
ALTER TABLE `td_sale_orders`
  ADD PRIMARY KEY (`td_sale_order_id`),
  ADD UNIQUE KEY `td_sale_orders_td_sale_order_code_unique` (`td_sale_order_code`);

--
-- Indexes for table `td_sale_order_items`
--
ALTER TABLE `td_sale_order_items`
  ADD PRIMARY KEY (`td_sale_order_item_id`);

--
-- Indexes for table `td_store_adjustments`
--
ALTER TABLE `td_store_adjustments`
  ADD PRIMARY KEY (`td_store_adjustment_id`);

--
-- Indexes for table `td_store_transfers`
--
ALTER TABLE `td_store_transfers`
  ADD PRIMARY KEY (`td_store_transfer_id`);

--
-- Indexes for table `td_tax_categories`
--
ALTER TABLE `td_tax_categories`
  ADD PRIMARY KEY (`td_tax_category_id`);

--
-- Indexes for table `td_tax_rates`
--
ALTER TABLE `td_tax_rates`
  ADD PRIMARY KEY (`td_tax_rate_id`);

--
-- Indexes for table `td_web_chats`
--
ALTER TABLE `td_web_chats`
  ADD PRIMARY KEY (`td_web_chat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cd_branches`
--
ALTER TABLE `cd_branches`
  MODIFY `cd_branch_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cd_branch_types`
--
ALTER TABLE `cd_branch_types`
  MODIFY `cd_branch_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_brands`
--
ALTER TABLE `cd_brands`
  MODIFY `cd_brand_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cd_clients`
--
ALTER TABLE `cd_clients`
  MODIFY `cd_client_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cd_client_groups`
--
ALTER TABLE `cd_client_groups`
  MODIFY `cd_client_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_customer_representatives`
--
ALTER TABLE `cd_customer_representatives`
  MODIFY `cd_customer_representative_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_demo_requests`
--
ALTER TABLE `cd_demo_requests`
  MODIFY `cd_demo_request_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_roles`
--
ALTER TABLE `cd_roles`
  MODIFY `cd_role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cd_role_hiararchies`
--
ALTER TABLE `cd_role_hiararchies`
  MODIFY `cd_role_hiararchy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_subscriptions`
--
ALTER TABLE `cd_subscriptions`
  MODIFY `cd_subscription_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_users`
--
ALTER TABLE `cd_users`
  MODIFY `cd_user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cd_web_visitors`
--
ALTER TABLE `cd_web_visitors`
  MODIFY `cd_web_visitor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_cities`
--
ALTER TABLE `gd_cities`
  MODIFY `gd_city_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_countries`
--
ALTER TABLE `gd_countries`
  MODIFY `gd_country_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_languages`
--
ALTER TABLE `gd_languages`
  MODIFY `gd_language_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_licenses`
--
ALTER TABLE `gd_licenses`
  MODIFY `gd_license_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_notifications`
--
ALTER TABLE `gd_notifications`
  MODIFY `gd_notification_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gd_regions`
--
ALTER TABLE `gd_regions`
  MODIFY `gd_region_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_add_ons`
--
ALTER TABLE `md_add_ons`
  MODIFY `md_add_on_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_banks`
--
ALTER TABLE `md_banks`
  MODIFY `md_bank_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_bank_accounts`
--
ALTER TABLE `md_bank_accounts`
  MODIFY `md_bank_account_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_bill_of_materials`
--
ALTER TABLE `md_bill_of_materials`
  MODIFY `md_bill_of_material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_chart_of_accounts`
--
ALTER TABLE `md_chart_of_accounts`
  MODIFY `md_chart_of_account_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_define_product_suppliers`
--
ALTER TABLE `md_define_product_suppliers`
  MODIFY `md_define_product_supplier_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_discounts`
--
ALTER TABLE `md_discounts`
  MODIFY `md_discount_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_drivers`
--
ALTER TABLE `md_drivers`
  MODIFY `md_driver_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_employee_roles`
--
ALTER TABLE `md_employee_roles`
  MODIFY `md_employee_role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_employee_shifts`
--
ALTER TABLE `md_employee_shifts`
  MODIFY `md_employee_shift_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_employee_tables`
--
ALTER TABLE `md_employee_tables`
  MODIFY `md_employee_table_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_e_menu_groups`
--
ALTER TABLE `md_e_menu_groups`
  MODIFY `md_e_menu_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_e_menu_settings`
--
ALTER TABLE `md_e_menu_settings`
  MODIFY `md_e_menu_setting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_inventory_stores`
--
ALTER TABLE `md_inventory_stores`
  MODIFY `md_inventory_store_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_item_groupings`
--
ALTER TABLE `md_item_groupings`
  MODIFY `md_item_grouping_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_item_groups`
--
ALTER TABLE `md_item_groups`
  MODIFY `md_item_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_item_prices`
--
ALTER TABLE `md_item_prices`
  MODIFY `md_item_price_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_kitchens`
--
ALTER TABLE `md_kitchens`
  MODIFY `md_kitchen_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_locators`
--
ALTER TABLE `md_locators`
  MODIFY `md_locator_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_menu_arrangments`
--
ALTER TABLE `md_menu_arrangments`
  MODIFY `md_menu_arrangment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_offer_and_promotions`
--
ALTER TABLE `md_offer_and_promotions`
  MODIFY `md_offer_and_pormotion_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_production_requests`
--
ALTER TABLE `md_production_requests`
  MODIFY `md_production_request_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_products`
--
ALTER TABLE `md_products`
  MODIFY `md_product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `md_product_categories`
--
ALTER TABLE `md_product_categories`
  MODIFY `md_product_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `md_product_groups`
--
ALTER TABLE `md_product_groups`
  MODIFY `md_product_group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_product_requests`
--
ALTER TABLE `md_product_requests`
  MODIFY `md_product_request_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_raw_materials`
--
ALTER TABLE `md_raw_materials`
  MODIFY `md_raw_material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_requests`
--
ALTER TABLE `md_requests`
  MODIFY `md_request_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_role_hierarchies`
--
ALTER TABLE `md_role_hierarchies`
  MODIFY `md_role_hierarchy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_stations`
--
ALTER TABLE `md_stations`
  MODIFY `md_station_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_suppliers`
--
ALTER TABLE `md_suppliers`
  MODIFY `md_supplier_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_unit_of_measurements`
--
ALTER TABLE `md_unit_of_measurements`
  MODIFY `md_unit_of_measurement_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `md_ware_houses`
--
ALTER TABLE `md_ware_houses`
  MODIFY `md_ware_house_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_currencies`
--
ALTER TABLE `td_currencies`
  MODIFY `td_currency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_currency_conversio_rates`
--
ALTER TABLE `td_currency_conversio_rates`
  MODIFY `td_curreny_conversio_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_customer_tickets`
--
ALTER TABLE `td_customer_tickets`
  MODIFY `td_customer_ticket_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_dashboard_preferences`
--
ALTER TABLE `td_dashboard_preferences`
  MODIFY `td_dashboard_preference_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_leads`
--
ALTER TABLE `td_leads`
  MODIFY `td_lead_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_payment_details`
--
ALTER TABLE `td_payment_details`
  MODIFY `td_payment_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_payment_transactions`
--
ALTER TABLE `td_payment_transactions`
  MODIFY `td_payment_transaction_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_purchase_orders`
--
ALTER TABLE `td_purchase_orders`
  MODIFY `td_purchase_order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_reservations`
--
ALTER TABLE `td_reservations`
  MODIFY `td_reservation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_sale_orders`
--
ALTER TABLE `td_sale_orders`
  MODIFY `td_sale_order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_sale_order_items`
--
ALTER TABLE `td_sale_order_items`
  MODIFY `td_sale_order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_store_adjustments`
--
ALTER TABLE `td_store_adjustments`
  MODIFY `td_store_adjustment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_store_transfers`
--
ALTER TABLE `td_store_transfers`
  MODIFY `td_store_transfer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_tax_categories`
--
ALTER TABLE `td_tax_categories`
  MODIFY `td_tax_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_tax_rates`
--
ALTER TABLE `td_tax_rates`
  MODIFY `td_tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_web_chats`
--
ALTER TABLE `td_web_chats`
  MODIFY `td_web_chat_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
