/*
 Navicat Premium Data Transfer

 Source Server         : Moravej
 Source Server Type    : SQLite
 Source Server Version : 3012001
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3012001
 File Encoding         : 65001

 Date: 17/03/2019 14:05:15
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for agri_activity_subject
-- ----------------------------
DROP TABLE IF EXISTS "agri_activity_subject";
CREATE TABLE "agri_activity_subject" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" text,
  "activity_type" integer,
  "unit" text,
  CONSTRAINT "activity_type" FOREIGN KEY ("activity_type") REFERENCES "agri_activity_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for agri_activity_type
-- ----------------------------
DROP TABLE IF EXISTS "agri_activity_type";
CREATE TABLE "agri_activity_type" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" text
);

-- ----------------------------
-- Table structure for agri_category
-- ----------------------------
DROP TABLE IF EXISTS "agri_category";
CREATE TABLE "agri_category" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" text,
  "parent_id" integer
);

-- ----------------------------
-- Table structure for agri_info_production
-- ----------------------------
DROP TABLE IF EXISTS "agri_info_production";
CREATE TABLE "agri_info_production" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "area_name" text,
  "bahrebardar_zeraie" integer,
  "bahrebardar_baghi" integer,
  "bahrebardar_dami" integer,
  "bahrebardar_zanboor" integer,
  "bahrebardar_toyoor" integer,
  "bahrebardar_natural" integer,
  "bahrebardar_shilat" integer,
  "bahrebardar_homejobs" integer,
  "bahrebardar_other" integer
);

-- ----------------------------
-- Table structure for agri_info_products
-- ----------------------------
DROP TABLE IF EXISTS "agri_info_products";
CREATE TABLE "agri_info_products" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "product_id" integer,
  "village_name" text,
  "bahrebardar" integer,
  "amount" text,
  "average" real,
  CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "agri_product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for agri_info_water
-- ----------------------------
DROP TABLE IF EXISTS "agri_info_water";
CREATE TABLE "agri_info_water" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "area_name" integer,
  "chah_amigh" integer,
  "chah_nime_amigh" integer,
  "ghanat" integer,
  "cheshme" integer,
  "roodkhaneh" integer,
  "other" integer,
  "modern_barani" real,
  "modern_ghatre" real,
  "modern_other" real
);

-- ----------------------------
-- Table structure for agri_people
-- ----------------------------
DROP TABLE IF EXISTS "agri_people";
CREATE TABLE "agri_people" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "code_melli" integer,
  "first_name" text,
  "last_name" text,
  "father_name" text,
  "sejel_id" integer,
  "birth_place" text,
  "birth_sodoor" text,
  "bith_date" text,
  "education_level" text,
  "education_field" text,
  "education_subfield" text,
  "duty_ostan" text,
  "duty_shahrestan" text,
  "duty_agri_center" text,
  "phone_mobile" integer,
  "phone_work" integer,
  "email" text,
  "responsibility" text,
  "type" text
);

-- ----------------------------
-- Table structure for agri_plan
-- ----------------------------
DROP TABLE IF EXISTS "agri_plan";
CREATE TABLE "agri_plan" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" text,
  "target" text,
  "actions_titles" text,
  "unit" text,
  "size" text,
  "place" text,
  "note" text
);

-- ----------------------------
-- Table structure for agri_product
-- ----------------------------
DROP TABLE IF EXISTS "agri_product";
CREATE TABLE "agri_product" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" text,
  "category_id" integer,
  CONSTRAINT "category_id" FOREIGN KEY ("category_id") REFERENCES "agri_category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for agri_report
-- ----------------------------
DROP TABLE IF EXISTS "agri_report";
CREATE TABLE "agri_report" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "date" integer,
  "duration" integer,
  "action_type" text,
  "action_volume" text,
  "action_place" text,
  "action_target" text,
  "action_result" text DEFAULT '',
  "action_issues" text,
  "manager_rating" integer,
  "manager_comment" text,
  "code_melli" integer,
  "product_id" integer,
  "action_subject_id" integer,
  CONSTRAINT "code_melli" FOREIGN KEY ("code_melli") REFERENCES "agri_people" ("code_melli") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "agri_product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "action_subject_id" FOREIGN KEY ("action_subject_id") REFERENCES "agri_activity_subject" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for agri_report_nezarat
-- ----------------------------
DROP TABLE IF EXISTS "agri_report_nezarat";
CREATE TABLE "agri_report_nezarat" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "code_melli" text,
  "code_melli_moravej" text,
  "code_melli_manager" text,
  "date" text,
  "place" text,
  "target" text,
  "issue" text,
  "result" text,
  "note" text,
  "manager_rating" text,
  "manager_comment" text,
  CONSTRAINT "code_melli_moravej" FOREIGN KEY ("code_melli_moravej") REFERENCES "agri_people" ("code_melli"),
  CONSTRAINT "code_melli_manager" FOREIGN KEY ("code_melli_manager") REFERENCES "agri_people" ("code_melli"),
  CONSTRAINT "code_melli_karshenas" FOREIGN KEY ("code_melli") REFERENCES "agri_people" ("code_melli")
);

-- ----------------------------
-- Table structure for agri_tarvij_network
-- ----------------------------
DROP TABLE IF EXISTS "agri_tarvij_network";
CREATE TABLE "agri_tarvij_network" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "madadkaran_tarviji" integer,
  "tashilgar_roostaie" integer,
  "tavoni_zeraie" integer,
  "clinic_giah" integer,
  "clinic_dam" integer,
  "moshavere_and_other" integer,
  "tavaoni_zanan" integer,
  "other_tashakol" integer,
  "abokhak_lab" integer,
  "sandogh_zanan" integer
);

-- ----------------------------
-- Table structure for agri_worker
-- ----------------------------
DROP TABLE IF EXISTS "agri_worker";
CREATE TABLE "agri_worker" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" text,
  "village" text,
  "education_level" text,
  "education_field" text,
  "activity_field" text,
  "phone_mobile" integer,
  "phone_home" integer
);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Auto increment value for agri_activity_subject
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_activity_type
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_category
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_info_production
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_info_products
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_info_water
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_people
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_plan
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_product
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_report
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_report_nezarat
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_tarvij_network
-- ----------------------------

-- ----------------------------
-- Auto increment value for agri_worker
-- ----------------------------

PRAGMA foreign_keys = true;
