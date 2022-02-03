-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 03 fév. 2022 à 11:22
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `formations_v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `uploader_id` varchar(20) NOT NULL,
  `class_id` varchar(20) DEFAULT 'unfiltered',
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `session_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `attachments`
--

INSERT INTO `attachments` (`id`, `title`, `remarks`, `uploader_id`, `class_id`, `file_name`, `enc_name`, `session_id`, `date`, `branch_id`, `created_at`, `updated_at`) VALUES
(12, 'Finance', '', '2', '2', 'Finance_,_Banque_et_Assurance_mode_hybrid.pdf', '54601b04a21780196e8035337950b476.pdf', 3, '2021-12-10', 1, '2021-12-10 17:17:28', '2021-12-10 18:17:28');

-- --------------------------------------------------------

--
-- Structure de la table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `school_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `stu_generate` tinyint(3) DEFAULT '0',
  `stu_username_prefix` varchar(255) NOT NULL,
  `stu_default_password` varchar(255) NOT NULL,
  `grd_generate` tinyint(3) DEFAULT '0',
  `grd_username_prefix` varchar(255) NOT NULL,
  `grd_default_password` varchar(255) NOT NULL,
  `teacher_restricted` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `branch`
--

INSERT INTO `branch` (`id`, `name`, `school_name`, `email`, `mobileno`, `currency`, `symbol`, `city`, `state`, `address`, `stu_generate`, `stu_username_prefix`, `stu_default_password`, `grd_generate`, `grd_username_prefix`, `grd_default_password`, `teacher_restricted`, `created_at`, `updated_at`) VALUES
(1, 'UCA', 'UCA', 'faissal.elfid@gmail.com', '0682484660', 'MAD', 'MAD', 'Marrakech', '', 'FSTG, marrakech', 0, '', '', 0, '', '', 1, '2021-11-04 19:15:46', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_numeric` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `class`
--

INSERT INTO `class` (`id`, `name`, `name_numeric`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 'Licence', '2', '2021-11-07 14:40:43', NULL, 1),
(2, 'Master', '', '2021-11-09 19:03:27', NULL, 1),
(3, 'FORMATIONS QUALIFIANTES ET CERTIFIANTES', '', '2021-11-09 19:03:47', NULL, 1),
(4, 'DIPLÔME UNIVERSITAIRE MÉDECINE', '', '2021-11-09 19:04:04', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `custom_field`
--

DROP TABLE IF EXISTS `custom_field`;
CREATE TABLE IF NOT EXISTS `custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_to` varchar(50) DEFAULT NULL,
  `field_label` varchar(100) NOT NULL,
  `default_value` text,
  `field_type` enum('text','textarea','dropdown','date','checkbox','number','url','email') NOT NULL,
  `required` varchar(5) NOT NULL DEFAULT 'false',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `show_on_table` varchar(5) DEFAULT NULL,
  `field_order` int(11) NOT NULL,
  `bs_column` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `custom_field`
--

INSERT INTO `custom_field` (`id`, `form_to`, `field_label`, `default_value`, `field_type`, `required`, `status`, `show_on_table`, `field_order`, `bs_column`, `branch_id`, `created_at`) VALUES
(1, 'online_admission', 'Nationalité', '', 'text', '1', 1, '1', 2, 6, 1, '2021-11-09 17:24:33'),
(2, 'online_admission', 'Code Postale', '', 'number', '1', 1, '1', 1, 6, 1, '2021-11-09 17:26:23'),
(3, 'online_admission', 'CIN/Passport', '', 'text', '1', 1, '1', 3, 12, 1, '2021-11-09 19:29:11'),
(4, 'online_admission', 'Situation Familiale', 'Fonctionnaire,Salarié(e),Retraité(e),Sans Emploi', 'dropdown', '1', 1, '1', 4, 6, 1, '2021-11-09 19:31:26'),
(5, 'online_admission', 'Domaine d\'Activité', 'Agroalimentaire,Banque / Assurance,BTP / Matériaux de construction,Tourisme', 'dropdown', '1', 1, '1', 5, 6, 1, '2021-11-09 19:33:19');

-- --------------------------------------------------------

--
-- Structure de la table `custom_fields_values`
--

DROP TABLE IF EXISTS `custom_fields_values`;
CREATE TABLE IF NOT EXISTS `custom_fields_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldid` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `custom_fields_values`
--

INSERT INTO `custom_fields_values` (`id`, `relid`, `field_id`, `value`) VALUES
(1, 2, 2, '30000'),
(2, 2, 1, 'Marrocain'),
(3, 2, 3, 'Z235468'),
(4, 2, 4, 'salari_e'),
(5, 2, 5, 'agroalimentaire'),
(6, 3, 2, '30000'),
(7, 3, 1, 'aa'),
(8, 3, 3, 'aa'),
(9, 3, 4, 'salarie_e'),
(10, 3, 5, 'banque_assurance'),
(11, 9, 2, '30000'),
(12, 9, 1, 'aa'),
(13, 9, 3, 'aa'),
(14, 9, 4, 'retraite_e'),
(15, 9, 5, 'btp_materiaux_de_construction'),
(16, 10, 2, '30000'),
(17, 10, 1, 'aa'),
(18, 10, 3, 'aa'),
(19, 10, 4, 'salarie_e'),
(20, 10, 5, 'agroalimentaire'),
(21, 11, 2, '30000'),
(22, 11, 1, 'aa'),
(23, 11, 3, 'aa'),
(24, 11, 4, 'fonctionnaire'),
(25, 11, 5, 'banque_assurance'),
(26, 12, 2, '30000'),
(27, 12, 1, 'a@gmail.com'),
(28, 12, 3, 'aa'),
(29, 12, 4, 'salarie_e'),
(30, 12, 5, 'agroalimentaire'),
(31, 13, 2, '30000'),
(32, 13, 1, 'a@gmail.com'),
(33, 13, 3, 'aa'),
(34, 13, 4, 'salarie_e'),
(35, 13, 5, 'agroalimentaire'),
(36, 14, 2, '30000'),
(37, 14, 1, 'a'),
(38, 14, 3, 'a'),
(39, 14, 4, 'retraite_e'),
(40, 14, 5, 'tourisme'),
(41, 15, 2, '30000'),
(42, 15, 1, 'Marocaine'),
(43, 15, 3, 'z123589'),
(44, 15, 4, 'fonctionnaire'),
(45, 15, 5, 'agroalimentaire'),
(46, 16, 2, '30000'),
(47, 16, 1, 'marocaine'),
(48, 16, 3, 'K12338'),
(49, 16, 4, 'fonctionnaire'),
(50, 16, 5, 'agroalimentaire');

-- --------------------------------------------------------

--
-- Structure de la table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
CREATE TABLE IF NOT EXISTS `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `tags`) VALUES
(1, 'account_registered', '{institute_name}, {name}, {login_username}, {password}, {user_role}, {login_url}'),
(2, 'forgot_password', '{institute_name}, {username}, {email}, {reset_url}'),
(3, 'change_password', '{institute_name}, {name}, {email}, {password}'),
(4, 'new_message_received', '{institute_name}, {recipient}, {message}, {message_url}'),
(5, 'payslip_generated', '{institute_name}, {username}, {month_year}, {payslip_url}'),
(6, 'award', '{institute_name}, {winner_name}, {award_name}, {gift_item}, {award_reason}, {given_date}'),
(7, 'leave_approve', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(8, 'leave_reject', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(9, 'advance_salary_approve', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(10, 'advance_salary_reject', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(11, 'apply_online_admission', '{institute_name}, {admission_id}, {applicant_name}, {applicant_mobile}, {class}, {section}, {apply_date}, {payment_url}, {admission_copy_url}, {paid_amount}'),
(12, 'student_admission', '{institute_name}, {academic_year}, {admission_date}, {admission_no}, {roll}, {category}, {student_name}, {student_mobile}, {class}, {section}, {login_username}, {password}, {login_url}');

-- --------------------------------------------------------

--
-- Structure de la table `email_templates_details`
--

DROP TABLE IF EXISTS `email_templates_details`;
CREATE TABLE IF NOT EXISTS `email_templates_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template_body` text NOT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '1',
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
CREATE TABLE IF NOT EXISTS `enroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `roll` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` tinyint(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_about`
--

DROP TABLE IF EXISTS `front_cms_about`;
CREATE TABLE IF NOT EXISTS `front_cms_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `about_image` varchar(255) NOT NULL,
  `elements` mediumtext NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_about`
--

INSERT INTO `front_cms_about` (`id`, `title`, `subtitle`, `page_title`, `content`, `banner_image`, `about_image`, `elements`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Guide', 'Le candidat doit choisir une formation, et suivre les indications suivantes :', 'About Us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut volutpat rutrum eros amet sollicitudin interdum. Suspendisse pulvinar, velit nec pharetra interdum, ante tellus ornare mi, et mollis tellus neque vitae elit. Mauris adipiscing mauris fringilla turpis interdum sed pulvinar nisi malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n                        </p>\r\n                        <p>\r\n                            Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula. Mauris sit amet neque nec nunc gravida. \r\n                        </p>\r\n                        <div class=\"row\">\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                    <li><a href=\"#\">Dermitology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>', 'about1.jpg', 'about1.png', '{\"cta_title\":\"Get in touch to join our community\",\"button_text\":\"Contact Our Office\",\"button_url\":\"contact\"}', '', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_admission`
--

DROP TABLE IF EXISTS `front_cms_admission`;
CREATE TABLE IF NOT EXISTS `front_cms_admission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `page_title` varchar(255) DEFAULT NULL,
  `terms_conditions_title` varchar(255) DEFAULT NULL,
  `terms_conditions_description` text NOT NULL,
  `fee_elements` text,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_admission`
--

INSERT INTO `front_cms_admission` (`id`, `title`, `description`, `page_title`, `terms_conditions_title`, `terms_conditions_description`, `fee_elements`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Pré-inscription.', '<p>La pré-inscription pour les diplômes (Licence Professionnelle D\'UNIVERSITÉ et Master D\'UNIVERSITÉ)</p>\r\n', 'S\'inscrire', 'Important', '<h5 class=\"alert alert-danger\" style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; border-radius: 4px; text-align: center;\"><b>Important:</b>Toute pré-candidature non conforme au dossier physique du candidat sera automatiquement&nbsp;<span class=\"animated infinite flash\" style=\"animation-iteration-count: infinite; color: red;\"><strong>rejetée.</strong></span></h5>', '[]', 'admission1.jpg', 'UCA - S\'inscrire formations continues', 'Formations continues uca', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_admitcard`
--

DROP TABLE IF EXISTS `front_cms_admitcard`;
CREATE TABLE IF NOT EXISTS `front_cms_admitcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) DEFAULT NULL,
  `templete_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_admitcard`
--

INSERT INTO `front_cms_admitcard` (`id`, `page_title`, `templete_id`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Admit Card', 1, 'admit_card1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_certificates`
--

DROP TABLE IF EXISTS `front_cms_certificates`;
CREATE TABLE IF NOT EXISTS `front_cms_certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_certificates`
--

INSERT INTO `front_cms_certificates` (`id`, `page_title`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Certificates', 'certificates1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_contact`
--

DROP TABLE IF EXISTS `front_cms_contact`;
CREATE TABLE IF NOT EXISTS `front_cms_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_title` varchar(255) DEFAULT NULL,
  `box_description` varchar(500) DEFAULT NULL,
  `box_image` varchar(255) DEFAULT NULL,
  `form_title` varchar(355) DEFAULT NULL,
  `address` varchar(355) DEFAULT NULL,
  `phone` varchar(355) DEFAULT NULL,
  `email` varchar(355) DEFAULT NULL,
  `submit_text` varchar(355) NOT NULL,
  `map_iframe` text,
  `page_title` varchar(255) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_contact`
--

INSERT INTO `front_cms_contact` (`id`, `box_title`, `box_description`, `box_image`, `form_title`, `address`, `phone`, `email`, `submit_text`, `map_iframe`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Contactez-nous', '.', 'contact-info-box1.png', 'Une question ? N\'hésitez pas !', 'Av Abdelkrim Khattabi, B.P. 511 - 40000 -\r\nMarrakech', '(+212) 524 437 741,\r\n(+212) 524 434 814', 'ucacom@uca.ma', 'Envoyer', '<iframe width=\"100%\" height=\"350\" id=\"gmap_canvas\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3396.6675755640954!2d-8.021606684846386!3d31.642950981329214!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xdafee9c5c13471b%3A0x2cc2ac4063ddf13c!2sUniversit%C3%A9%20Cadi%20Ayyad%20(Pr%C3%A9sidence%2C%20Marrakech)!5e0!3m2!1sfr!2sma!4v1636403069074!5m2!1sfr!2sma\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\"></iframe>', 'Contactez-nous', 'contact1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_faq`
--

DROP TABLE IF EXISTS `front_cms_faq`;
CREATE TABLE IF NOT EXISTS `front_cms_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_faq`
--

INSERT INTO `front_cms_faq` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Frequently Asked Questions', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>\r\n\r\n<p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</p>', 'Faq', 'faq1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_faq_list`
--

DROP TABLE IF EXISTS `front_cms_faq_list`;
CREATE TABLE IF NOT EXISTS `front_cms_faq_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_faq_list`
--

INSERT INTO `front_cms_faq_list` (`id`, `title`, `description`, `branch_id`) VALUES
(1, 'Any Information you provide on applications for disability, life or accidental insurance ?', '<p>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\r\n</p>\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>\r\n<li>Sed do eiusmod tempor incididunt ut labore et dolore magna aliq.</li>\r\n<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco quat. It is a long established fact.</li>\r\n<li>That a reader will be distracted by the readable content of a page when looking at its layout.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>\r\n<li>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</li>\r\n<li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n<li>Readable content of a page when looking at its layout.</li>\r\n<li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n<li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n</ul>', 1),
(2, 'Readable content of a page when looking at its layout ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(3, 'Opposed to using \'Content here, content here\', making it look like readable English ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(4, 'Readable content of a page when looking at its layout ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(5, 'What types of documents are required to travel?', '<p><strong>Lorem ipsum</strong> dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis. Sea ocurreret principes ne. At nonumy aperiri pri, nam quodsi copiosae intellegebat et, ex deserunt euripidis usu. Per ad ullum lobortis. Duo volutpat imperdiet ut, postea salutatus imperdiet ut per, ad utinam debitis invenire has.</p>\r\n\r\n<ol>\r\n	<li>labores explicari qui</li>\r\n	<li>labores explicari qui</li>\r\n	<li>labores explicari quilabores explicari qui</li>\r\n	<li>labores explicari qui</li>\r\n</ol>', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_home`
--

DROP TABLE IF EXISTS `front_cms_home`;
CREATE TABLE IF NOT EXISTS `front_cms_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elements` mediumtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_home`
--

INSERT INTO `front_cms_home` (`id`, `title`, `subtitle`, `item_type`, `description`, `elements`, `branch_id`, `active`) VALUES
(1, 'Formations continues', 'UCA', 'wellcome', 'Bienvenue sur le site de formation continue de l\'université UCA', '{\"image\":\"wellcome1.png\"}', 1, 1),
(2, 'FORMATION CONTINUE DU PERSONNEL DE L\'UCA', NULL, 'teachers', 'La mission du Centre de Formation Continue de l\'UCA est d\'organiser, gérer et coordonner les actions de formation continue de l’Université et assurer leur suivi de concert avec les diverses composantes de l’université et ses partenaires.', '{\"teacher_start\":\"0\",\"image\":\"featured-parallax1.jpg\"}', 1, 1),
(3, 'POURQUOI NOUS CHOISIR', NULL, 'services', '...', '', 1, 1),
(4, 'Request for a free Education Class', 'Medical Services', 'cta', '', '{\"mobile_no\":\"+2484-398-8987\",\"button_text\":\"Request Now\",\"button_url\":\"http:\\/\\/localhost\\/multi_pro\\/home\\/admission\\/\"}', 1, 0),
(5, 'Bienvenue sur le site officiel de  <span>Formation Continue</span> de UCA.', NULL, 'slider', '.', '{\"position\":\"c-left\",\"button_text1\":\"Voir plus de formations ...\",\"button_url1\":\"#\",\"button_text2\":\"UCA\",\"button_url2\":\"https.uca.ma\",\"image\":\"home-slider-1636124220.jpg\"}', 1, 1),
(6, 'Un colloque <span>national</span> :', NULL, 'slider', 'L\'esprit d\'indépendance et ses perspectives à la lumière des nouvelles transformations internationales', '{\"position\":\"c-left\",\"button_text1\":\"Plus d\'informations ...\",\"button_url1\":\"https:\\/\\/www.uca.ma\\/fr\\/news\\/23932\",\"button_text2\":\"UCA News\",\"button_url2\":\"https:\\/\\/www.uca.ma\\/fr\\/news\",\"image\":\"home-slider-1638440940.jpg\"}', 1, 1),
(7, 'Formation', NULL, 'features', 'Formation qualifiantes et certifiantes', '{\"button_text\":\"Read More\",\"button_url\":\"http:\\/\\/localhost\\/uca_v2\\/home\\/page\\/formations\",\"icon\":\"fab fa-studiovinari\"}', 1, 1),
(8, 'Licence', NULL, 'features', 'Licence professionnelle d\'université.', '{\"button_text\":\"Read More\",\"button_url\":\"http:\\/\\/localhost\\/uca_v2\\/home\\/page\\/formations\",\"icon\":\"fas fa-book-reader\"}', 1, 1),
(9, 'Master', NULL, 'features', 'Master professionnel d\'université.', '{\"button_text\":\"Read More\",\"button_url\":\"http:\\/\\/localhost\\/uca_v2\\/home\\/page\\/formations\",\"icon\":\"fas fa-graduation-cap\"}', 1, 1),
(10, 'DUM', NULL, 'features', 'Diplôme universitaire médecine.', '{\"button_text\":\"Read More\",\"button_url\":\"http:\\/\\/localhost\\/uca_v2\\/home\\/page\\/formations\",\"icon\":\"fas fa-pills\"}', 1, 1),
(11, 'Témoignage', NULL, 'testimonial', '...', '', 1, 1),
(12, 'Plus de 150 formations pluridisciplinaires vous attendent :', NULL, 'statistics', 'Dans le cadre de la mise en œuvre du programme d\'urgence, l\'Université Cadi Ayyad renforce son offre de formations par des filières adaptées aux besoins de l\'économie nationale.', '{\"image\":\"counter-parallax1.jpg\",\"widget_title_1\":\"Professeurs certifi\\u00e9s\",\"widget_icon_1\":\"fas fa-user-tie\",\"type_1\":\"teacher\",\"widget_title_2\":\"Etudiants\",\"widget_icon_2\":\"fas fa-user-graduate\",\"type_2\":\"student\",\"widget_title_3\":\"Cat\\u00e9gorie\",\"widget_icon_3\":\"fas fa-graduation-cap\",\"type_3\":\"class\",\"widget_title_4\":\"Fili\\u00e8re\",\"widget_icon_4\":\"fas fa-award\",\"type_4\":\"section\"}', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_home_seo`
--

DROP TABLE IF EXISTS `front_cms_home_seo`;
CREATE TABLE IF NOT EXISTS `front_cms_home_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_home_seo`
--

INSERT INTO `front_cms_home_seo` (`id`, `page_title`, `meta_keyword`, `meta_description`, `branch_id`) VALUES
(1, 'UCA', 'Home Page', 'Université Cadi Ayyad ', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_menu`
--

DROP TABLE IF EXISTS `front_cms_menu`;
CREATE TABLE IF NOT EXISTS `front_cms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `open_new_tab` int(11) NOT NULL DEFAULT '0',
  `ext_url` tinyint(3) NOT NULL DEFAULT '0',
  `ext_url_address` text,
  `publish` tinyint(3) NOT NULL,
  `system` tinyint(3) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_menu`
--

INSERT INTO `front_cms_menu` (`id`, `title`, `alias`, `ordering`, `parent_id`, `open_new_tab`, `ext_url`, `ext_url_address`, `publish`, `system`, `branch_id`, `created_at`) VALUES
(1, 'Home', 'index', 1, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(3, 'Teachers', 'teachers', 2, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(4, 'About Us', 'about', 4, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(5, 'FAQ', 'faq', 5, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(6, 'Online Admission', 'admission', 6, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(8, 'Pages', 'pages', 8, 0, 0, 1, '#', 1, 1, 0, '2019-08-09 12:18:54'),
(15, 'Formations', 'formations', 2, 0, 0, 0, '', 1, 0, 1, '2021-11-08 19:25:09'),
(16, 'Contact Us', 'contact', 9, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54');

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_menu_visible`
--

DROP TABLE IF EXISTS `front_cms_menu_visible`;
CREATE TABLE IF NOT EXISTS `front_cms_menu_visible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `parent_id` varchar(11) DEFAULT NULL,
  `ordering` varchar(20) DEFAULT NULL,
  `invisible` tinyint(2) NOT NULL DEFAULT '1',
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_menu_visible`
--

INSERT INTO `front_cms_menu_visible` (`id`, `name`, `menu_id`, `parent_id`, `ordering`, `invisible`, `branch_id`) VALUES
(2, NULL, 8, NULL, NULL, 1, 1),
(3, NULL, 9, NULL, NULL, 1, 1),
(4, NULL, 10, NULL, NULL, 1, 1),
(5, NULL, 13, NULL, NULL, 1, 1),
(6, NULL, 14, NULL, NULL, 1, 1),
(7, NULL, 3, NULL, NULL, 1, 1),
(8, 'Acceuil', 1, '0', '1', 0, 1),
(9, 'Évènement', 2, '0', '5', 1, 1),
(10, 'S\'inscrire', 6, '0', '3', 0, 1),
(11, 'Guide', 4, '0', '4', 1, 1),
(12, 'Contactez-nous', 7, '0', '9', 0, 1),
(13, NULL, 5, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_pages`
--

DROP TABLE IF EXISTS `front_cms_pages`;
CREATE TABLE IF NOT EXISTS `front_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_title`, `content`, `menu_id`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`, `created_at`) VALUES
(1, 'Formations continues', '<h2 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0);margin-bottom: 20px\"><u>Listes des formations continues</u></h2><h2 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0);\"><u>\r\n</u></h2><h3 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;\"><font color=\"#ff0000\">Master</font></h3><h2><p style=\"margin-left: 50px;\"><span style=\"font-size: 14px; letter-spacing: normal;\"><span style=\"font-size: 18px;\">Actuariat et risk management</span><span style=\"white-space: pre; font-size: 18px;\">	</span></span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 14px; letter-spacing: normal;\"><span style=\"font-size: 18px;\">Management des ressources Humaines</span><span style=\"white-space: pre; font-size: 18px;\">	</span></span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 14px; letter-spacing: normal;\"><span style=\"font-size: 18px;\">Stratégie et Marketing des services</span><span style=\"white-space: pre; font-size: 18px;\">	</span></span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 14px; letter-spacing: normal;\"><span style=\"font-size: 18px;\">Ingénierie Génie Civil Environnement et qualité</span><span style=\"white-space: pre; font-size: 18px;\">	</span></span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 14px; letter-spacing: normal;\"><span style=\"font-size: 18px;\">Management Qualité Hygiène Sécurité et Environnement</span><span style=\"white-space: pre; font-size: 18px;\">	</span></span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 14px; letter-spacing: normal;\"><span style=\"font-size: 18px;\">Ingénierie des Systèmes Distribués et Cloud Computing</span><span style=\"white-space: pre; font-size: 18px;\">	</span></span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 18px; letter-spacing: normal;\">المنازعات القانونية</span></p><p style=\"margin-left: 50px;\"><span style=\"font-size: 18px; letter-spacing: normal;\"><br></span></p></h2><h3 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;\"><font color=\"#ff0000\">Licence</font></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Finance , Banque et Assurance mode hybrid</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Data sciences appliquées en management et economie</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">logistique de distrubition et supply chain managemenet</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\"><br></span></h3><h3 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;\"><font color=\"#ff0000\">Formation continue</font></h3><h3 style=\"margin-left: 50px;\"><span style=\"color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; font-size: 18px;\">﻿</span><span style=\"font-size: 18px;\">Tutorat de langues étrangéres<font style=\"\"><br></font></span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Transport et logistique</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Community et revenue management touristique</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Préparation à l\'agrégation</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Accessibilité physique des personnes en situation d\'handicap</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Marketing digital</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\">Pédagogie unversitaire</span></h3><h3 style=\"margin-left: 50px;\"><span style=\"font-size: 18px;\"><br></span></h3><h3 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;\"><font color=\"#ff0000\">Diplôme universitaire médecine</font></h3><h3 style=\"font-family: Arial, Helvetica, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;\"><span style=\"font-size: 18px;\">﻿...</span><font color=\"#ff0000\"><br></font></h3>', 15, 'page_15.jpg', '', '', 1, '2021-11-08 19:26:40');

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_services`
--

DROP TABLE IF EXISTS `front_cms_services`;
CREATE TABLE IF NOT EXISTS `front_cms_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `parallax_image` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_services`
--

INSERT INTO `front_cms_services` (`id`, `title`, `subtitle`, `parallax_image`, `branch_id`) VALUES
(1, 'Get Well Soon', 'Our Best <span>Services</span>', 'service_parallax1.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_services_list`
--

DROP TABLE IF EXISTS `front_cms_services_list`;
CREATE TABLE IF NOT EXISTS `front_cms_services_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_services_list`
--

INSERT INTO `front_cms_services_list` (`id`, `title`, `description`, `icon`, `branch_id`) VALUES
(2, 'Formations riches et variés.', '...', 'fas fa-book-open', 1),
(3, 'Soyez un leader industriel', '...', 'fas fa-industry', 1),
(4, 'Cours de programmation', '...', 'fas fa-code', 1),
(5, 'Langues étrangères', '...', 'fas fa-language', 1),
(7, 'Formation continue', '...', 'fab fa-studiovinari', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_setting`
--

DROP TABLE IF EXISTS `front_cms_setting`;
CREATE TABLE IF NOT EXISTS `front_cms_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_title` varchar(255) NOT NULL,
  `url_alias` varchar(255) DEFAULT NULL,
  `cms_active` tinyint(4) NOT NULL DEFAULT '0',
  `online_admission` tinyint(4) NOT NULL DEFAULT '0',
  `theme` varchar(255) NOT NULL,
  `captcha_status` varchar(20) NOT NULL,
  `recaptcha_site_key` varchar(255) NOT NULL,
  `recaptcha_secret_key` varchar(255) NOT NULL,
  `address` varchar(350) NOT NULL,
  `mobile_no` varchar(60) NOT NULL,
  `fax` varchar(60) NOT NULL,
  `receive_contact_email` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `copyright_text` varchar(255) NOT NULL,
  `fav_icon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `footer_about_text` varchar(300) NOT NULL,
  `working_hours` varchar(300) NOT NULL,
  `facebook_url` varchar(100) NOT NULL,
  `twitter_url` varchar(100) NOT NULL,
  `youtube_url` varchar(100) NOT NULL,
  `google_plus` varchar(100) NOT NULL,
  `linkedin_url` varchar(100) NOT NULL,
  `pinterest_url` varchar(100) NOT NULL,
  `instagram_url` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_setting`
--

INSERT INTO `front_cms_setting` (`id`, `application_title`, `url_alias`, `cms_active`, `online_admission`, `theme`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `address`, `mobile_no`, `fax`, `receive_contact_email`, `email`, `copyright_text`, `fav_icon`, `logo`, `footer_about_text`, `working_hours`, `facebook_url`, `twitter_url`, `youtube_url`, `google_plus`, `linkedin_url`, `pinterest_url`, `instagram_url`, `branch_id`) VALUES
(1, 'Formations continues', 'uca', 1, 1, 'red', 'disable', '', '', 'Av Abdelkrim Khattabi, B.P. 511 - 40000 -', '(+212) 524 437 741   / (+212) 524 434 814', '(+212) 5 24 43 44 94', 'contact@uca.ma', 'ucacom@uca.ma', 'Copyright © 2021 <span>IRISI Student</span>. All Rights Reserved.', 'fav_icon1.png', 'logo1.png', 'CONTACT', '<span>Heures de travail : </span>  Lundi au Vendredi - 8AM - 18PM', 'https://facebook.com', 'https://twitter.com', 'https://youtube.com', 'https://google.com', 'https://linkedin.com', 'https://pinterest.com', 'https://instagram.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_teachers`
--

DROP TABLE IF EXISTS `front_cms_teachers`;
CREATE TABLE IF NOT EXISTS `front_cms_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_teachers`
--

INSERT INTO `front_cms_teachers` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Teachers', 'teachers1.jpg', 'Ramom - School Management System With CMS', 'Ramom  Teachers Page', 1);

-- --------------------------------------------------------

--
-- Structure de la table `front_cms_testimonial`
--

DROP TABLE IF EXISTS `front_cms_testimonial`;
CREATE TABLE IF NOT EXISTS `front_cms_testimonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(355) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rank` int(5) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `front_cms_testimonial`
--

INSERT INTO `front_cms_testimonial` (`id`, `name`, `surname`, `image`, `description`, `rank`, `branch_id`, `created_by`, `created_at`) VALUES
(1, 'Pr. Moulay Lhassan HBID', 'Président de l\'Université Cadi Ayyad', 'user-1638441233.jpg', 'L’Université Cadi Ayyad (UCA) est l’une des universités publiques leaders à l’échelle nationale et régionale. Elle a veillé, depuis sa création en 1978, à assurer pleinement son rôle dans la création et la transmission du savoir, et à se démarquer dans la recherche et l’innovation. Au fil des années, elle s’est dotée d’autres structures qui ont renforcé davantage le paysage de l’enseignement supérieur.', 1, 1, 2, '2019-08-23 12:26:42'),
(2, 'Hanane FARIS', 'Etudiante', 'user-1638441356.jpg', 'Je ne savais pas si j’allais m’habituer à ma nouvelle vie étudiante et j’ai eu peur de me sentir rejetée par mes collègues ou par les étudiants dans ma résidence. Et j’avais surtout peur de ne pas réussir mes examens à cause de mon faible niveau de français car je passais les examens comme une étudiante normale.', 4, 1, 2, '2019-08-23 12:26:42'),
(3, 'R.ABDELGHANI BELLOUQUID', 'L’Université Cadi Ayyad', 'user-1638441364.jpg', 'L’UNIVERSITÉ CADI AYYAD ET SES CHERCHEURS FEU PR.ABDELGHANI BELLOUQUID ET LE PR.NASRRDDINE YOUBI PRIMÉS LORS DU \"RESEARCH EXCELLENCE DAY 2019\", MERCREDI 3 JUILLET 2019 À RABAT.', 5, 1, 2, '2019-08-23 12:26:42');

-- --------------------------------------------------------

--
-- Structure de la table `global_settings`
--

DROP TABLE IF EXISTS `global_settings`;
CREATE TABLE IF NOT EXISTS `global_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(255) NOT NULL,
  `institution_code` varchar(255) NOT NULL,
  `reg_prefix` varchar(255) NOT NULL,
  `institute_email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `sms_service_provider` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `translation` varchar(100) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `animations` varchar(100) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `date_format` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `cron_secret_key` varchar(255) DEFAULT NULL,
  `preloader_backend` tinyint(1) NOT NULL DEFAULT '1',
  `cms_default_branch` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `global_settings`
--

INSERT INTO `global_settings` (`id`, `institute_name`, `institution_code`, `reg_prefix`, `institute_email`, `address`, `mobileno`, `currency`, `currency_symbol`, `sms_service_provider`, `session_id`, `translation`, `footer_text`, `animations`, `timezone`, `date_format`, `facebook_url`, `twitter_url`, `linkedin_url`, `youtube_url`, `cron_secret_key`, `preloader_backend`, `cms_default_branch`, `created_at`, `updated_at`) VALUES
(1, 'UCA', 'UCA-', 'on', 'ramom@example.com', '', '0682484660', 'USD', '$', 'disabled', 3, 'french', '© 2021 UCA - Developed by an IRISI student', 'fadeInUp', 'Africa/Casablanca', 'd.M.Y', '', '', '', '', '32f718f60201187a044830845e34deb0', 1, 1, '2018-10-22 09:07:49', '2020-05-01 22:37:06');

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `arabic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `french` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1159 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `word`, `english`, `arabic`, `french`) VALUES
(1, 'language', 'Language', 'لغة', 'La langue'),
(2, 'attendance_overview', 'Attendance Overview', 'نظرة عامة على الحضور', 'Aperçu de la fréquentation'),
(3, 'annual_fee_summary', 'Annual Fee Summary', 'ملخص الرسوم السنوية', 'Résumé des frais annuels'),
(4, 'my_annual_attendance_overview', 'My Annual Attendance Overview', 'حضري السنوي نظرة عامة', 'Mon assiduité annuelle'),
(5, 'schedule', 'Schedule', 'جداول', 'des horaires'),
(6, 'student_admission', 'Student Admission', 'قبول الطلاب', 'Admission des étudiants'),
(7, 'returned', 'Returned', 'عاد', 'Revenu'),
(8, 'user_name', 'User Name', 'اسم المستخدم', 'Nom d\'utilisateur'),
(9, 'rejected', 'Rejected', 'مرفوض', 'Rejeté'),
(10, 'route_name', 'Route Name', 'اسم المسار', 'Nom de l\'itinéraire'),
(11, 'route_fare', 'Route Fare', 'الطريق الأجرة', 'Tarif d\'itinéraire'),
(12, 'edit_route', 'Edit Route', 'تحرير المسار', 'Modifier la route'),
(13, 'this_value_is_required', 'This value is required.', 'هذه القيمة مطلوبة', 'Cette valeur est requise'),
(14, 'vehicle_no', 'Vehicle No', 'السيارة لا', 'Numéro de véhicule'),
(15, 'insurance_renewal_date', 'Insurance Renewal Date', 'تاريخ تجديد التأمين', 'Date de renouvellement de l&#39;assurance'),
(16, 'driver_name', 'Driver Name', 'اسم السائق', 'Nom du conducteur'),
(17, 'driver_license', 'Driver License', 'رخصة قيادة', 'Permis de conduire'),
(18, 'select_route', 'Select Route', 'حدد الطريق', 'Sélectionnez l\'itinéraire'),
(19, 'edit_vehicle', 'Edit Vehicle', 'تحرير السيارة', 'Modifier le véhicule'),
(20, 'add_students', 'Add Students', ' إضافة الطلاب', 'Ajouter des étudiants'),
(21, 'vehicle_number', 'Vehicle Number', 'عدد المركبات', 'Numéro de véhicule'),
(22, 'select_route_first', 'Select Route First', 'حدد الطريق أولا', 'Sélectionnez l\'itinéraire d\'abord'),
(23, 'transport_fee', 'Transport Fee', 'مصاريف الشحن', 'Frais de transport'),
(24, 'control', 'Control', 'مراقبة', 'contrôle'),
(25, 'set_students', 'Set Students', 'تعيين الطلاب', 'Mettre les élèves'),
(26, 'hostel_list', 'Hostel List', 'قائمة نزل', 'Liste d\'auberges'),
(27, 'watchman_name', 'Watchman Name', 'اسم الحارس', 'Nom du gardien'),
(28, 'hostel_address', 'Hostel Address', 'عنوان الفندق', 'Adresse de l\'auberge'),
(29, 'edit_hostel', 'Edit Hostel', 'تحرير نزل', 'Modifier hostel'),
(30, 'room_name', 'Room Name', 'اسم الغرفة', 'Nom de la salle'),
(31, 'no_of_beds', 'No Of Beds', 'عدد الأسرة', 'Nombre de lits'),
(32, 'select_hostel_first', 'Select Hostel First', 'حدد نزل أولا', 'Sélectionnez l\'auberge en premier'),
(33, 'remaining', 'Remaining', 'متبق', 'Restant'),
(34, 'hostel_fee', 'Hostel Fee', 'رسوم النزل', 'Tarif de l\'auberge'),
(35, 'accountant_list', 'Accountant List', 'قائمة المحاسبين', 'Liste comptable'),
(36, 'students_fees', 'Students Fees', 'رسوم الطلاب', 'Frais d\'étudiants'),
(37, 'fees_status', 'Fees Status', 'حالة الرسوم', 'Statut des frais'),
(38, 'books', 'Books', 'الكتب', 'livres'),
(39, 'home_page', 'Home Page', 'الصفحة الرئيسية', 'Page d\'accueil'),
(40, 'collected', 'Collected', 'جمع', 'collecté'),
(41, 'student_mark', 'Student Mark', 'علامة الطالب', 'Marque étudiante'),
(42, 'select_exam_first', 'Select Exam First', 'حدد الامتحان أولا', 'Sélectionnez l\'examen en premier'),
(43, 'transport_details', 'Transport Details', 'تفاصيل النقل', 'Détails de transport'),
(44, 'no_of_teacher', 'No of Teacher', 'لا المعلم', 'Nombre de professeurs'),
(45, 'basic_details', 'Basic Details', 'تفاصيل أساسية', 'Détails de base'),
(46, 'fee_progress', 'Fee Progress', 'رسوم التقدم', 'Progression des frais'),
(47, 'word', 'Word', 'كلمة', 'mot'),
(48, 'book_category', 'Book Category', 'فئة الكتاب', 'Catégorie livre'),
(49, 'driver_phone', 'Driver Phone', 'سائق الهاتف', 'Driver Phone'),
(50, 'invalid_csv_file', 'Invalid / Corrupted CSV File', 'ملف كسف غير صالح / معطل', 'fichier CSV invalide / corrompu'),
(51, 'requested_book_list', 'Requested Book List', 'طلب قائمة الكتب', 'Liste de livres demandée'),
(52, 'request_status', 'Request Status', 'حالة الطلب', 'Statut de demande'),
(53, 'book_request', 'Book Request', 'طلب الكتاب', 'Demande de livre'),
(54, 'logout', 'Logout', 'الخروج', 'Connectez - Out'),
(55, 'select_payment_method', 'Select Payment Method', 'اختار طريقة الدفع', 'Sélectionnez le mode de paiement'),
(56, 'select_method', 'Select Method', 'حدد الطريقة', 'Méthode choisie'),
(57, 'payment', 'Payment', 'دفع', 'Paiement'),
(58, 'filter', 'Filter', 'منقي', 'Filtre'),
(59, 'status', 'Status', 'الحالة', 'statut'),
(60, 'paid', 'Paid', 'دفع', 'Payé'),
(61, 'unpaid', 'Unpaid', 'غير مدفوع', 'Non payé'),
(62, 'method', 'Method', 'طريقة', 'la méthode'),
(63, 'cash', 'Cash', 'السيولة النقدية', 'Argent liquide'),
(64, 'check', 'Check', 'الاختيار', 'Vérifier'),
(65, 'card', 'Card', 'بطاقة', 'Carte'),
(66, 'payment_history', 'Payment History', 'تاريخ الدفع', 'historique de paiement'),
(67, 'category', 'Category', 'فئة', 'Catégorie'),
(68, 'book_list', 'Book List', 'قائمة الكتب', 'Liste de livres'),
(69, 'author', 'Author', 'مؤلف', 'Auteur'),
(70, 'price', 'Price', 'السعر', 'Prix'),
(71, 'available', 'Available', 'متاح', 'Disponible'),
(72, 'unavailable', 'Unavailable', 'غير متوفره', 'Indisponible'),
(73, 'transport_list', 'Transport List', 'قائمة النقل', 'Liste des transports'),
(74, 'edit_transport', 'Edit Transport', 'تحرير النقل', 'Modifier Transport'),
(75, 'hostel_name', 'Hostel Name', 'اسم المهجع', 'Nom Dortoir'),
(76, 'number_of_room', 'Hostel Of Room', 'عدد الغرف', 'Nombre de chambres'),
(77, 'yes', 'Yes', 'نعم فعلا', 'Oui'),
(78, 'no', 'No', 'لا', 'Non'),
(79, 'messages', 'Messages', 'رسائل', 'messages'),
(80, 'compose', 'Compose', 'إرسال رسالة جديدة', 'Ecrire un nouveau message'),
(81, 'recipient', 'Recipient', 'مستلم', 'Bénéficiaire'),
(82, 'select_a_user', 'Select A User', 'تحديد مستخدم', 'Sélectionnez un utilisateur'),
(83, 'send', 'Send', 'إرسال', 'Envoyer'),
(84, 'global_settings', 'Global Settings', 'اعدادات النظام', 'Les paramètres du système'),
(85, 'currency', 'Currency', 'عملة', 'Devise'),
(86, 'system_email', 'System Email', 'نظام البريد الإلكتروني', 'système Email'),
(87, 'create', 'Create', 'خلق', 'créer'),
(88, 'save', 'Save', 'حفظ', 'sauvegarder'),
(89, 'file', 'File', 'ملف', 'Fichier'),
(90, 'theme_settings', 'Theme Settings', 'إعدادات موضوع', 'Réglage des thèmes'),
(91, 'default', 'Default', 'افتراضي', 'Défaut'),
(92, 'select_theme', 'Select Theme', 'اختر الموضوع', 'Sélectionne un thème'),
(93, 'upload_logo', 'Upload Logo', 'تحميل الشعار', 'Télécharger Logo'),
(94, 'upload', 'Upload', 'تحميل', 'Télécharger'),
(95, 'remember', 'Remember', 'تذكر', 'Rappelles toi'),
(96, 'not_selected', 'Not Selected', 'لم يتم اختياره', 'Non séléctionné'),
(97, 'disabled', 'Disabled', 'معاق', 'désactivé'),
(98, 'inactive_account', 'Inactive Account', 'حساب غير نشط', 'Compte inactif'),
(99, 'update_translations', 'Update Translations', 'تحديث الترجمات', 'actualiser les traductions'),
(100, 'language_list', 'Language List', 'قائمة لغة', 'Liste des langues'),
(101, 'option', 'Option', 'خيار', 'Option'),
(102, 'edit_word', 'Edit Word', 'تحرير الكلمة', 'modifier le mot'),
(103, 'update_profile', 'Update Profile', 'تحديث الملف', 'Mettre à jour le profil'),
(104, 'current_password', 'Current Password', 'كلمة السر الحالية', 'Mot de passe actuel'),
(105, 'new_password', 'New Password', 'كلمة السر الجديدة', 'nouveau mot de passe'),
(106, 'login', 'Login', 'تسجيل الدخول', 'S\'identifier'),
(107, 'reset_password', 'Reset Password', 'اعادة تعيين كلمة السر', 'réinitialiser le mot de passe'),
(108, 'present', 'Present', 'حاضر', 'Présent'),
(109, 'absent', 'Absent', 'غائب', 'Absent'),
(110, 'update_attendance', 'Update Attendance', 'تحديث الحضور', 'Mise à jour de présence'),
(111, 'undefined', 'Undefined', 'غير محدد', 'Indéfini'),
(112, 'back', 'Back', 'الى الخلف', 'Arrière'),
(113, 'save_changes', 'Save Changes', 'حفظ التغيرات', 'Sauvegarder les modifications'),
(114, 'uploader', 'Uploader', 'رافع', 'Uploader'),
(115, 'download', 'Download', 'تحميل', 'Télécharger'),
(116, 'remove', 'Remove', 'إزالة', 'Retirer'),
(117, 'print', 'Print', 'طباعة', 'Impression'),
(118, 'select_file_type', 'Select File Type', 'حدد نوع الملف', 'Sélectionner le type de fichier'),
(119, 'excel', 'Excel', 'تفوق', 'Exceller'),
(120, 'other', 'Other', 'آخر', 'Autre'),
(121, 'students_of_class', 'Students Of Class', 'طلبة الدرجة', 'Les élèves du niveau'),
(122, 'marks_obtained', 'Marks Obtained', 'العلامات التي يحصل', 'Notes obtenues'),
(123, 'attendance_for_class', 'Attendance For Class', 'الحضور لفئة', 'Participation Pour la classe'),
(124, 'receiver', 'Receiver', 'المتلقي', 'Récepteur'),
(125, 'please_select_receiver', 'Please Select Receiver', 'الرجاء الإختيار استقبال', 'S\'il vous plaît Sélectionnez Receiver'),
(126, 'session_changed', 'Session Changed', 'جلسة تغيير', 'session Changed'),
(127, 'exam_marks', 'Exam Marks', 'علامات الامتحان', 'Marques d\'examen'),
(128, 'total_mark', 'Total Mark', 'عدد الأقسام', 'total Mark'),
(129, 'mark_obtained', 'Mark Obtained', 'علامة حصل', 'Mark Obtenu'),
(130, 'invoice/payment_list', 'Invoice / Payment List', 'فاتورة / قائمة دفع', 'Facture / Liste de paiement'),
(131, 'obtained_marks', 'Obtained Marks', 'العلامات التي تم الحصول عليها', 'Les notes obtenues'),
(132, 'highest_mark', 'Highest Mark', 'أعلى الأقسام', 'le plus élevé Mark'),
(133, 'grade', 'Grade (GPA)', 'درجة', 'Qualité'),
(134, 'dashboard', 'Dashboard', 'لوحة القيادة', 'Tableau de bord'),
(135, 'student', 'Student', 'طالب علم', 'Élève'),
(136, 'rename', 'Rename', 'إعادة تسمية', 'rebaptiser'),
(137, 'class', 'Class', 'صف مدرسي', 'Les diplômes '),
(138, 'teacher', 'Teacher', 'مدرس', 'Professeur'),
(139, 'parents', 'Parents', 'الآباء', 'Des parents'),
(140, 'subject', 'Subject', 'موضوع', 'Sujet'),
(141, 'student_attendance', 'Student Attendance', 'حضور الطالب', 'Participation des étudiants'),
(142, 'exam_list', 'Exam List', 'قائمة الامتحان', 'Liste d\'examen'),
(143, 'grades_range', 'Grades Range', 'مجموعة الدرجات', 'Gamme de notes'),
(144, 'loading', 'Loading', 'جار التحميل', 'chargement'),
(145, 'library', 'Library', 'مكتبة', 'Bibliothèque'),
(146, 'hostel', 'Hostel', 'المهجع', 'Dortoir'),
(147, 'events', 'Events', 'اللافتة', 'Tableau d\'affichage'),
(148, 'message', 'Message', 'الرسالة', 'Message'),
(149, 'translations', 'Translations', 'ترجمة', 'traductions'),
(150, 'account', 'Account', 'حساب', 'Compte'),
(151, 'selected_session', 'Selected Session', 'جلسة مختارة', 'session sélectionnée'),
(152, 'change_password', 'Change Password', 'تغيير كلمة السر', 'Changer le mot de passe'),
(153, 'section', 'Section', 'قسم', 'Filière'),
(154, 'edit', 'Edit', 'تحرير', 'modifier'),
(155, 'delete', 'Delete', 'حذف', 'Effacer'),
(156, 'cancel', 'Cancel', 'إلغاء', 'Annuler'),
(157, 'parent', 'Parent', 'أصل', 'Parent'),
(158, 'attendance', 'Attendance', 'الحضور', 'Présence'),
(159, 'addmission_form', 'Admission Form', 'شكل القبول', 'Formulaire d\'admission'),
(160, 'name', 'Name', 'اسم', 'Nom'),
(161, 'select', 'Select', 'اختار', 'Sélectionner'),
(162, 'roll', 'Roll', 'لفة', 'Roulent'),
(163, 'birthday', 'Date Of Birth', 'تاريخ الميلاد', 'Anniversaire'),
(164, 'gender', 'Gender', 'جنس', 'Le genre'),
(165, 'male', 'Male', 'ذكر', 'Mâle'),
(166, 'female', 'Female', 'أنثى', 'Femelle'),
(167, 'address', 'Address', 'عنوان', 'Adresse'),
(168, 'phone', 'Phone', 'هاتف', 'Téléphone'),
(169, 'email', 'Email', 'البريد الإلكتروني', 'Email'),
(170, 'password', 'Password', 'كلمه السر', 'Mot de passe'),
(171, 'transport_route', 'Transport Route', 'النقل الطريق', 'Transport Route'),
(172, 'photo', 'Photo', 'صورة فوتوغرافية', 'photo'),
(173, 'select_class', 'Select Class', 'حدد فئة', 'Sélectionnez un diplôme'),
(174, 'username_password_incorrect', 'Username Or Password Is Incorrect', 'اسم المستخدم أو كلمة المرور غير صحيحة', 'L\'identifiant ou le mot de passe est incorrect'),
(175, 'select_section', 'Select Section', 'حدد القسم', 'Sélectionnez une filière'),
(176, 'options', 'Options', 'خيارات', 'options de'),
(177, 'mark_sheet', 'Mark Sheet', 'ورقة علامة', 'Mark Sheet'),
(178, 'profile', 'Profile', 'الملف الشخصي', 'Profil'),
(179, 'select_all', 'Select All', 'اختر الكل', 'Sélectionner tout'),
(180, 'select_none', 'Select None', 'حدد بلا', 'Ne rien sélectionner'),
(181, 'average', 'Average', 'متوسط', 'Moyenne'),
(182, 'transfer', 'Transfer', 'تحويل', 'transfert'),
(183, 'edit_teacher', 'Edit Teacher', 'تحرير المعلم', 'Modifier enseignant'),
(184, 'sex', 'Sex', 'جنس', 'Sexe'),
(185, 'marksheet_for', 'Marksheet For', 'ورقة علامة ل', 'Marquer les feuilles pour'),
(186, 'total_marks', 'Total Marks', 'مجموع الدرجات', 'total de points'),
(187, 'parent_phone', 'Parent Phone', 'الأم الهاتف', 'Parent téléphone'),
(188, 'subject_author', 'Subject Author', 'الموضوع المؤلف', 'Sujet Auteur'),
(189, 'update', 'Update', 'تحديث', 'Mettre à jour'),
(190, 'class_list', 'Class List', 'قائمة الطبقة', 'Liste des diplômes '),
(191, 'class_name', 'Class Name', 'اسم الطبقة', 'Niveau'),
(192, 'name_numeric', 'Name Numeric', 'اسم الرقمية', 'Nom numérique'),
(193, 'select_teacher', 'Select Teacher', 'حدد المعلم', 'Sélectionnez ce professeur'),
(194, 'edit_class', 'Edit Class', 'تحرير الفئة', 'Modifier le nom du niveau'),
(195, 'section_name', 'Section Name', 'اسم القسم', 'Nom de la filière'),
(196, 'add_section', 'Add Section', 'إضافة مقطع', 'Ajouter une filière'),
(197, 'subject_list', 'Subject List', 'قائمة الموضوع', 'Liste Sujet'),
(198, 'subject_name', 'Subject Name', 'اسم الموضوع', 'Nom Sujet'),
(199, 'edit_subject', 'Edit Subject', 'تحرير الموضوع', 'Modifier Objet'),
(200, 'day', 'Day', 'يوم', 'journée'),
(201, 'starting_time', 'Starting Time', 'ابتداء من الوقت', 'Heure de départ'),
(202, 'hour', 'Hour', 'ساعة', 'Heure'),
(203, 'minutes', 'Minutes', 'دقيقة', 'Minutes'),
(204, 'ending_time', 'Ending Time', 'إنهاء الوقت', 'Fin Temps'),
(205, 'select_subject', 'Select Subject', 'حدد الموضوع', 'Sélectionnez Objet'),
(206, 'select_date', 'Select Date', 'حدد التاريخ', 'Sélectionnez date'),
(207, 'select_month', 'Select Month', 'اختر الشهر', 'Sélectionnez un mois'),
(208, 'select_year', 'Select Year', 'اختر السنة', 'Sélectionnez Année'),
(209, 'add_language', 'Add Language', 'إضافة لغة', 'ajouter une langue'),
(210, 'exam_name', 'Exam Name', 'اسم الامتحان', 'Nom d\'examen'),
(211, 'date', 'Date', 'تاريخ', 'date'),
(212, 'comment', 'Comment', 'التعليق', 'Commentaire'),
(213, 'edit_exam', 'Edit Exam', 'تحرير امتحان', 'Modifier examen'),
(214, 'grade_list', 'Grade List', 'قائمة الصف', 'Liste de grade'),
(215, 'grade_name', 'Grade Name', 'اسم الصف', 'Nom de grade'),
(216, 'grade_point', 'Grade Point', 'الصف نقطة', 'grade point'),
(217, 'select_exam', 'Select Exam', 'حدد الامتحان', 'Sélectionnez Exam'),
(218, 'students', 'Students', 'الطلاب', 'Élèves'),
(219, 'subjects', 'Subjects', 'المواضيع', 'Sujets'),
(220, 'total', 'Total', 'مجموع', 'Total'),
(221, 'select_academic_session', 'Select Academic Session', 'حدد الدورة الأكاديمية', 'Séance scolaire sélectionnée'),
(222, 'invoice_informations', 'Invoice Informations', 'معلومات الفاتورة', 'Informations de facturation'),
(223, 'title', 'Title', 'عنوان', 'Titre'),
(224, 'description', 'Description', 'وصف', 'La description'),
(225, 'payment_informations', 'Payment Informations', 'معلومات الدفع', 'Informations de paiement'),
(226, 'view_invoice', 'View Invoice', 'عرض الفاتورة', 'Voir la facture'),
(227, 'payment_to', 'Payment To', 'دفع ل', 'Paiement à'),
(228, 'bill_to', 'Bill To', 'فاتورة الى', 'Facturer'),
(229, 'total_amount', 'Total Amount', 'المبلغ الإجمالي', 'Montant total'),
(230, 'paid_amount', 'Paid Amount', 'المبلغ المدفوع', 'Montant payé'),
(231, 'due', 'Due', 'بسبب', 'Dû'),
(232, 'amount_paid', 'Amount Paid', 'المبلغ المدفوع', 'Le montant payé'),
(233, 'payment_successfull', 'Payment has been successful', 'دفع النجاح', 'Paiement Successfull'),
(234, 'add_invoice/payment', 'Add Invoice/payment', 'إضافة فاتورة / دفع', 'Ajouter Facture / paiement'),
(235, 'invoices', 'Invoices', 'الفواتير', 'factures'),
(236, 'action', 'Action', 'عمل', 'action'),
(237, 'required', 'Required', 'مطلوب', 'Obligatoire'),
(238, 'info', 'Info', 'معلومات', 'Info'),
(239, 'month', 'Month', '\r\nشهر', 'mois'),
(240, 'details', 'Details', 'تفاصيل', 'Détails'),
(241, 'new', 'New', 'الجديد', 'Nouveau'),
(242, 'reply_message', 'Reply Message', 'رسالة الرد', 'Réponse au message'),
(243, 'message_sent', 'Message Sent', 'تم الارسال', ''),
(244, 'search', 'Search', 'بحث', 'chercher'),
(245, 'religion', 'Religion', 'دين', 'Religion'),
(246, 'blood_group', 'Blood group', 'فصيلة الدم', 'groupe sanguin'),
(247, 'database_backup', 'Database Backup', 'قاعدة بيانات النسخ الاحتياطي', 'Sauvegarde de base de données'),
(248, 'search', 'Search', 'بحث', 'chercher'),
(249, 'payments_history', 'Fees Pay / Invoice', 'رسوم الدفع / الفاتورة', 'honoraires payer / facture'),
(250, 'message_restore', 'Message Restore', 'استعادة الرسائل', 'Restauration de message'),
(251, 'write_new_message', 'Write New Message', 'إرسال رسالة جديدة', 'Ecrire un nouveau message'),
(252, 'attendance_sheet', 'Attendance Sheet', 'ورقة الحضور', 'Feuille de présence'),
(253, 'holiday', 'Holiday', 'يوم الاجازة', 'Vacances'),
(254, 'exam', 'Exam', 'امتحان', 'Examen'),
(255, 'successfully', 'Successfully', 'بنجاح', 'Avec succès'),
(256, 'admin', 'Admin', 'مشرف', 'Admin'),
(257, 'inbox', 'Inbox', 'صندوق الوارد', 'Boîte de réception'),
(258, 'sent', 'Sent', 'أرسلت', 'Envoyé'),
(259, 'important', 'Important', 'مهم', 'Important'),
(260, 'trash', 'Trash', 'قمامة، يدمر، يهدم', 'Poubelle'),
(261, 'error', 'Unsuccessful', 'غير ناجحة', 'Infructueux'),
(262, 'sessions_list', 'Sessions List', 'قائمة الجلسات', 'Liste des sessions'),
(263, 'session_settings', 'Session Settings', 'إعدادات الجلسة', 'Paramètres de la session'),
(264, 'add_designation', 'Add Designation', 'إضافة تسمية', 'Ajouter une désignation'),
(265, 'users', 'Users', 'المستخدمين', 'Utilisateurs'),
(266, 'librarian', 'Librarian', 'أمين المكتبة', 'Bibliothécaire'),
(267, 'accountant', 'Accountant', 'محاسب', 'Comptable'),
(268, 'academics', 'Academics', 'مؤسسيا', 'institutionnellement'),
(269, 'employees_attendance', 'Employees Attendance', 'حضور الموظفين', 'Participation des employés'),
(270, 'set_exam_term', 'Set Exam Term', 'تعيين مدة الامتحان', 'Terminer l\'examen'),
(271, 'set_attendance', 'Set Attendance', 'تعيين الحضور', 'Assurer la fréquentation'),
(272, 'marks', 'Marks', 'علامات', 'Des notes'),
(273, 'books_category', 'Books Category', 'فئة الكتاب', 'Catégorie de livres'),
(274, 'transport', 'Transport', 'المواصلات', 'Transport'),
(275, 'fees', 'Fees', 'رسوم', 'honoraires'),
(276, 'fees_allocation', 'Fees Allocation', 'توزيع الرسوم', 'répartition des frais'),
(277, 'fee_category', 'Fee Category', 'فئة الرسوم', 'Catégorie tarifaire'),
(278, 'report', 'Report', 'أبلغ عن', 'rapport'),
(279, 'employee', 'Employee', 'الموظفين', 'employés'),
(280, 'invoice', 'Invoice', 'فاتورة', 'facture d\'achat'),
(281, 'event_catalogue', 'Event Catalogue', 'كتالوج الأحداث', 'Catalogue des événements'),
(282, 'total_paid', 'Total Paid', 'مجموع المبالغ المدفوعة', 'Total payé'),
(283, 'total_due', 'Total Due', 'الاجمالي المستحق', 'Total dû'),
(284, 'fees_collect', 'Fees Collect', 'تحصيل الرسوم', 'Frais collectés'),
(285, 'total_school_students_attendance', 'Total School Students Attendance', 'مجموع طلاب المدارس الحضور', 'Participation totale des étudiants'),
(286, 'overview', 'Overview', 'نظرة عامة', 'Aperçu'),
(287, 'currency_symbol', 'Currency Symbol', 'رمز العملة', 'symbole de la monnaie'),
(288, 'enable', 'Enable', 'مكن', 'Activer'),
(289, 'disable', 'Disable', 'تعطيل', 'Désactiver'),
(290, 'payment_settings', 'Payment Settings', 'إعدادات الدفع', 'Paramètres de paiement'),
(291, 'student_attendance_report', 'Student Attendance Report', 'تقرير حضور الطالب', 'Rapport de présence étudiante'),
(292, 'attendance_type', 'Attendance Type', 'نوع الحضور', 'Type de présence'),
(293, 'late', 'Late', 'متأخر', 'En retard'),
(294, 'employees_attendance_report', 'Employees Attendance Report', 'الموظفين تقرير الحضور', 'Rapport de présence des employés'),
(295, 'attendance_report_of', 'Attendance Report Of', 'تقرير الحضور من', 'Rapport de présence de'),
(296, 'fee_paid_report', 'Fee Paid Report', 'الرسوم المدفوعة التقرير', 'Rapport payé payé'),
(297, 'invoice_no', 'Invoice No', 'رقم الفاتورة', 'Facture non'),
(298, 'payment_mode', 'Payment Mode', 'طريقة الدفع', 'mode de paiement'),
(299, 'payment_type', 'Payment Type', 'نوع الدفع', 'type de paiement'),
(300, 'done', 'Done', 'فعله', 'terminé'),
(301, 'select_fee_category', 'Select Fee Category', 'حدد فئة الرسوم', 'Sélectionner la catégorie tarifaire'),
(302, 'discount', 'Discount', 'خصم', 'remise'),
(303, 'enter_discount_amount', 'Enter Discount Amount', 'أدخل مبلغ الخصم', 'Saisir un montant d\'escompte'),
(304, 'online_payment', 'Online Payment', 'الدفع عن بعد', 'Paiement à distance'),
(305, 'student_name', 'Student Name', 'أسم الطالب', 'nom d\'étudiant'),
(306, 'invoice_history', 'Invoice History', 'تاريخ الفاتورة', 'Historique des factures'),
(307, 'discount_amount', 'Discount Amount', 'مقدار الخصم', 'Montant de l\'escompte'),
(308, 'invoice_list', 'Invoice List', 'قائمة الفاتورة', 'Liste des factures'),
(309, 'partly_paid', 'Partly Paid', 'تدفع جزئيا', 'En partie payé'),
(310, 'fees_list', 'Fees List', 'قائمة الرسوم', 'Liste des frais'),
(311, 'voucher_id', 'Voucher ID', 'معرف القسيمة', 'Id de bon'),
(312, 'transaction_date', 'Transaction Date', 'تاريخ الصفقة', 'transaction date'),
(313, 'admission_date', 'Admission Date', 'تاريخ القبول', 'admission date'),
(314, 'user_status', 'User Status', 'حالة المستخدم', 'Statut de l\'utilisateur'),
(315, 'nationality', 'Nationality', 'جنسية', 'nationalité'),
(316, 'register_no', 'Register No', 'سجل رقم', 'Inscrivez-vous non'),
(317, 'first_name', 'First Name', 'الاسم الاول', 'Prénom'),
(318, 'last_name', 'Last Name', 'الكنية', 'nom de famille'),
(319, 'state', 'State', 'حالة', 'Etat'),
(320, 'transport_vehicle_no', 'Transport Vehicle No', 'رقم مركبة النقل', 'Véhicule de transport no'),
(321, 'percent', 'Percent', 'نسبه مئويه', 'pour cent'),
(322, 'average_result', 'Average Result', 'متوسط ​​النتيجة', 'Résultat moyen'),
(323, 'student_category', 'Student Category', 'طالب', 'Catégorie étudiante'),
(324, 'category_name', 'Category Name', 'اسم التصنيف', 'Nom de catégorie'),
(325, 'category_list', 'Category List', 'قائمة الفئات', 'Liste des catégories'),
(326, 'please_select_student_first', 'Please Select Students First', 'يرجى اختيار الطلاب أولا', 'S\'il vous plaît sélectionner les étudiants de première'),
(327, 'designation', 'Designation', 'تعيين', 'La désignation'),
(328, 'qualification', 'Qualification', 'المؤهل', 'Qualification'),
(329, 'account_deactivated', 'Account Deactivated', 'تم إلغاء تنشيط الحساب', 'Compte désactivé'),
(330, 'account_activated', 'Account Activated', 'تم تنشيط الحساب', 'Compte activé'),
(331, 'designation_list', 'Designation List', 'قائمة التعيين', 'Liste de désignation'),
(332, 'joining_date', 'Joining Date', 'تاريخ الانضمام', 'Date d\'inscription'),
(333, 'relation', 'Relation', 'علاقة', 'Relation'),
(334, 'father_name', 'Father Name', 'اسم الأب', 'nom du père'),
(335, 'librarian_list', 'Librarian List', 'قائمة أمين المكتبة', 'Liste des bibliothécaires'),
(336, 'class_numeric', 'Class Numeric', 'فئة رقمية', 'Classe Numérique'),
(337, 'maximum_students', 'Maximum Students', 'الحد الأقصى للطلاب', 'Maximum d\'étudiants'),
(338, 'class_room', 'Class Room', 'قاعة الدراسة', 'Salle de classe'),
(339, 'pass_mark', 'Pass Mark', 'علامة المرور', 'moyenne'),
(340, 'exam_time', 'Exam Time (Min)', 'وقت الامتحان', 'Temps d\'examen (min)'),
(341, 'time', 'Time', 'زمن', 'temps'),
(342, 'subject_code', 'Subject Code', 'رمز الموضوع', 'Code du sujet'),
(343, 'full_mark', 'Full Mark', 'درجة كاملة', 'Pleine marque'),
(344, 'subject_type', 'Subject Type', 'نوع الموضوع', 'Type de sujet'),
(345, 'date_of_publish', 'Date Of Publish', 'تاريخ النشر', 'Date de publication'),
(346, 'file_name', 'File Name', 'اسم الملف', 'Nom de fichier'),
(347, 'students_list', 'Students List', 'قائمة الطلاب', 'Liste des étudiants'),
(348, 'start_date', 'Start Date', 'تاريخ البدء', 'Date de début'),
(349, 'end_date', 'End Date', 'تاريخ الانتهاء', 'End Date'),
(350, 'term_name', 'Term Name', 'اسم المدى', 'Nom du terme'),
(351, 'grand_total', 'Grand Total', 'المبلغ الإجمالي', 'Grand Total'),
(352, 'result', 'Result', 'نتيجة', 'Résultat'),
(353, 'books_list', 'Books List', 'قائمة الكتب', 'Liste des livres'),
(354, 'book_isbn_no', 'Book ISBN No', 'كتاب رقم إيسبن رقم', 'Livre numéro ISBN'),
(355, 'total_stock', 'Total Stock', 'إجمالي الأسهم', 'Total Stock'),
(356, 'issued_copies', 'Issued Copies', 'تم إصدار نسخ', 'Copies émises'),
(357, 'publisher', 'Publisher', 'الناشر', 'éditeur'),
(358, 'books_issue', 'Books Issue', 'كتاب المسألة', 'Problème de livre'),
(359, 'user', 'User', 'المستعمل', 'Utilisateur'),
(360, 'fine', 'Fine', 'غرامة', 'Bien'),
(361, 'pending', 'Pending', 'قيد الانتظار', 'en attendant'),
(362, 'return_date', 'Return Date', 'تاريخ العودة', 'date de retour'),
(363, 'accept', 'Accept', 'قبول', 'Acceptez'),
(364, 'reject', 'Reject', 'رفض', 'rejeter'),
(365, 'issued', 'Issued', 'نشر', 'Publié'),
(366, 'return', 'Return', 'إرجاع', 'Revenir'),
(367, 'renewal', 'Renewal', 'تجديد', 'renouvellement'),
(368, 'fine_amount', 'Fine Amount', 'كمية غرامة', 'Montant fin'),
(369, 'password_mismatch', 'Password Mismatch', 'عدم تطابق كلمة المرور', 'Incompatibilité de mot de passe'),
(370, 'settings_updated', 'Settings Update', 'تحديث الإعدادات', 'Mise à jour de paramètres'),
(371, 'pass', 'Pass', 'البشري', 'passer'),
(372, 'event_to', 'Event To', 'الحدث ل', 'Événement à'),
(373, 'all_users', 'All Users', 'جميع المستخدمين', 'tous les utilisateurs'),
(374, 'employees_list', 'Employees List', 'قائمة الموظفين', 'Liste des employés'),
(375, 'on', 'On', 'على', 'sur'),
(376, 'timezone', 'Timezone', 'وحدة زمنية', 'fuseau horaire'),
(377, 'get_result', 'Get Result', 'الحصول على نتيجة', 'Obtenir un résultat'),
(378, 'apply', 'Apply', 'تطبيق', 'appliquer'),
(379, 'hrm', 'Human Resource', 'الموارد البشرية', 'ressource humaine'),
(380, 'payroll', 'Payroll', 'كشف رواتب', 'paie'),
(381, 'salary_assign', 'Salary Assign', 'مراقبة الرواتب', 'Contrôle des salaires'),
(382, 'employee_salary', 'Payment Salary', 'دفع الراتب', 'Salaire de paiement'),
(383, 'application', 'Application', 'الوضعية', 'application'),
(384, 'award', 'Award', 'جائزة', 'prix'),
(385, 'basic_salary', 'Basic Salary', 'راتب اساسي', 'salaire de base'),
(386, 'employee_name', 'Employee Name', 'اسم الموظف', 'Nom de l\'employé'),
(387, 'name_of_allowance', 'Name Of Allowance', 'اسم البدل', 'nom de l\'allocation'),
(388, 'name_of_deductions', 'Name Of Deductions', 'اسم الاستقطاعات', 'Nom des déductions'),
(389, 'all_employees', 'All Employees', 'كل الموظفين', 'tous les employés'),
(390, 'total_allowance', 'Total Allowance', 'مجموع المخصصات', 'Allocation totale'),
(391, 'total_deduction', 'Total Deductions', 'مجموع الخصومات', 'le total des déductions'),
(392, 'net_salary', 'Net Salary', 'صافي الراتب', 'salaire net'),
(393, 'payslip', 'Payslip', 'قسيمة الدفع', 'Payslip'),
(394, 'days', 'Days', 'أيام', 'journées'),
(395, 'category_name_already_used', 'Category Name Already Used', 'اسم الفئة المستخدمة من قبل', 'Nom de la catégorie déjà utilisé'),
(396, 'leave_list', 'Leave List', 'قائمة الإجازات', 'Laisser liste'),
(397, 'leave_category', 'Leave Category', 'ترك الفئة', 'Laisser la catégorie'),
(398, 'applied_on', 'Applied On', 'تطبيق على', 'appliqué sur'),
(399, 'accepted', 'Accepted', 'قبلت', 'accepté'),
(400, 'leave_statistics', 'Leave Statistics', 'وترك الإحصاءات', 'Quitter les statistiques'),
(401, 'leave_type', 'Leave Type', 'نوع الإجازة', 'Type de permission'),
(402, 'reason', 'Reason', 'السبب', 'raison'),
(403, 'close', 'Close', 'أغلق', 'Fermer'),
(404, 'give_award', 'Give Award', 'إعطاء الجائزة', 'Donner un prix'),
(405, 'list', 'List', 'قائمة', 'liste'),
(406, 'award_name', 'Award Name', 'اسم الجائزة', 'nom de l\'attribution'),
(407, 'gift_item', 'Gift Item', 'هدية البند', 'Objet cadeau'),
(408, 'cash_price', 'Cash Price', 'سعر الصرف', 'Prix ​​en espèces'),
(409, 'award_reason', 'Award Reason', 'جائزة السبب', 'Raison de récompense'),
(410, 'given_date', 'Given Date', 'تاريخ معين', 'Date donnée'),
(411, 'apply_leave', 'Apply Leave', 'تطبيق الإجازة', 'Postuler'),
(412, 'leave_application', 'Leave Application', 'اترك التطبيق', 'laisser l\'application'),
(413, 'allowances', 'Allowances', 'البدلات', 'Allocations'),
(414, 'add_more', 'Add More', 'أضف المزيد', 'ajouter plus'),
(415, 'deductions', 'Deductions', 'الخصومات', 'Déductions'),
(416, 'salary_details', 'Salary Details', 'تفاصيل الراتب', 'Détails de salaire'),
(417, 'salary_month', 'Salary Month', 'راتب شهر', 'Mois de salaire'),
(418, 'leave_data_update_successfully', 'Leave Data Updated Successfully', 'ترك البيانات تحديثها بنجاح', 'Laisser les données mises à jour avec succès'),
(419, 'fees_history', 'Fees History', 'تاريخ الرسوم', 'Historique des frais'),
(420, 'bank_name', 'Bank Name', 'اسم البنك', 'Nom de banque'),
(421, 'branch', 'Branch', 'فرع شجرة', 'branche'),
(422, 'bank_address', 'Bank Address', 'عنوان البنك', 'adresse de la banque'),
(423, 'ifsc_code', 'IFSC Code', 'رمز إفسك', 'IFSC code'),
(424, 'account_no', 'Account No', 'رقم الحساب', 'n ° de compte'),
(425, 'add_bank', 'Add Bank', 'إضافة بنك', 'Ajouter une banque'),
(426, 'account_name', 'Account Holder', 'أسم الحساب', 'nom du compte'),
(427, 'database_backup_completed', 'Database Backup Completed', 'اكتمل قاعدة بيانات النسخ الاحتياطي', 'Sauvegarde de base de données terminée'),
(428, 'restore_database', 'Restore Database', 'استعادة قاعدة البيانات', 'Restaurer la base de données'),
(429, 'template', 'Template', 'قالب', 'modèle'),
(430, 'time_and_date', 'Time And Date', 'الوقت و التاريخ', 'heure et date'),
(431, 'everyone', 'Everyone', 'كل واحد', 'toutes les personnes'),
(432, 'invalid_amount', 'Invalid Amount', 'مبلغ غير صحيح', 'montant invalide'),
(433, 'leaving_date_is_not_available_for_you', 'Leaving Date Is Not Available For You', 'ترك التاريخ غير متاح لك', 'la date de sortie n\'est pas disponible pour vous'),
(434, 'animations', 'Animations', 'الرسوم المتحركة', 'animations'),
(435, 'email_settings', 'Email Settings', 'إعدادات البريد الإلكتروني', 'Paramètres de messagerie'),
(436, 'deduct_month', 'Deduct Month', 'خصم الشهر', 'déduire le mois'),
(437, 'no_employee_available', 'No Employee Available', 'لا يتوفر موظف', 'Aucun employé disponible'),
(438, 'advance_salary_application_submitted', 'Advance Salary Application Submitted', 'تم تقديم طلب الراتب المتقدم', 'Demande de salaire anticipé soumise'),
(439, 'date_format', 'Date Format', 'صيغة التاريخ', 'date format'),
(440, 'id_card_generate', 'ID Card Generate', 'بطاقة الهوية تولد', 'Carte d\'identité générer'),
(441, 'issue_salary', 'Issue Salary', 'إصدار الراتب', 'question salariale'),
(442, 'advance_salary', 'Advance Salary', 'راتب مقدما', 'avance sur salaire'),
(443, 'logo', 'Logo', 'شعار', 'logo'),
(444, 'book_request', 'Book Request', 'طلب الكتاب', 'demande de livre'),
(445, 'reporting', 'Reporting', 'التقارير', 'rapport'),
(446, 'paid_salary', 'Paid Salary', 'الراتب المدفوع', 'salaire payé'),
(447, 'due_salary', 'Due Salary', 'الراتب', 'salaire dû'),
(448, 'route', 'Route', 'طريق', 'Route'),
(449, 'academic_details', 'Academic Details', 'التفاصيل الأكاديمية', 'détails académiques'),
(450, 'guardian_details', 'Guardian Details', 'التفاصيل الأكاديمية', 'détails académiques'),
(451, 'due_amount', 'Due Amount', 'مبلغ مستحق', 'montant dû'),
(452, 'fee_due_report', 'Fee Due Report', 'تقرير الرسوم المستحقة', 'rapport dû'),
(453, 'other_details', 'Other Details', 'تفاصيل أخرى', 'Autres détails'),
(454, 'last_exam_report', 'Last Exam Report', 'تقرير الاختبار الأخير', 'Dernier rapport d&#39;examen'),
(455, 'book_issued', 'Book Issued', ' كتاب صدر', 'Livre publié'),
(456, 'interval_month', 'Interval 30 Days', 'الفاصل الزمني 30 يومًا', 'Intervalle 30 jours'),
(457, 'attachments', 'Attachments', 'مرفقات', 'Les pièces jointes'),
(458, 'fees_payment', 'Fees Payment', 'دفع الرسوم', 'Paiement des frais'),
(459, 'fees_summary', 'Fees Summary', 'ملخص الرسوم', 'Résumé des frais'),
(460, 'total_fees', 'Total Fees', 'الرسوم الكلية', 'Total des frais'),
(461, 'weekend_attendance_inspection', 'Weekend Attendance Inspection', 'فحص الحضور في عطلة نهاية الاسبوع', 'Weekend Attendance Inspection'),
(462, 'book_issued_list', 'Book Issued List', 'كتاب صدر قائمة', 'Liste des livres publiés'),
(463, 'lose_your_password', 'Lose Your Password?', '?تفقد كلمة المرور الخاصة بك', 'Perdre votre mot de passe?'),
(464, 'all_branch_dashboard', 'All Branch Dashboard', 'كل لوحة فرع', 'Tableau de bord de toutes les branches'),
(465, 'academic_session', 'Academic Session', 'الدورة الأكاديمية', 'Session académique'),
(466, 'all_branches', 'All Branches', 'كل الفروع', 'Heures supplémentaires'),
(467, 'admission', 'Admission', 'قبول', 'admission'),
(468, 'create_admission', 'Create Admission', 'إنشاء القبول', 'Créer une entrée'),
(469, 'multiple_import', 'Multiple Import', 'استيراد متعدد', 'Importation multiple'),
(470, 'student_details', 'Student Details', 'تفاصيل الطالب', 'Détails de l\'étudiant'),
(471, 'student_list', 'Student List', 'قائمة الطلاب', 'Liste des étudiants'),
(472, 'login_deactivate', 'Login Deactivate', 'تسجيل الدخول', 'Comptes désactivés'),
(473, 'parents_list', 'Parents List', 'قائمة الوالدين', 'Liste de parents'),
(474, 'add_parent', 'Add Parent', 'أضف الوالد', 'Ajouter un parent'),
(475, 'employee_list', 'Employee List', 'قائمة موظف', 'Liste des employés'),
(476, 'add_department', 'Add Department', 'أضف قسم', 'Ajouter un département'),
(477, 'add_employee', 'Add Employee', 'إضافة موظف', 'Ajouter un employé'),
(478, 'salary_template', 'Salary Template', 'قالب الراتب', 'Modèle de salaire'),
(479, 'salary_payment', 'Salary Payment', 'دفع المرتبات', 'Paiement du salaire'),
(480, 'payroll_summary', 'Payroll Summary', 'ملخص الرواتب', 'Résumé de la paie'),
(481, 'academic', 'Academic', 'أكاديمي', 'Académique'),
(482, 'control_classes', 'Control Classes', 'فئات التحكم', 'Contrôle de niveau'),
(483, 'assign_class_teacher', 'Assign Class Teacher', 'تعيين معلم الصف', 'Attribuer un enseignant de classe'),
(484, 'class_assign', 'Class Assign', 'تعيين فئة', 'Affectation de classe'),
(485, 'assign', 'Assign', 'تعيين', 'Attribuer'),
(486, 'promotion', 'Promotion', 'ترقية وظيفية', 'Promotion'),
(487, 'attachments_book', 'Attachments Book', 'كتاب المرفقات', 'Livre des pièces jointes'),
(488, 'upload_content', 'Upload Content', 'تحميل المحتوى', 'Télécharger le contenu'),
(489, 'attachment_type', 'Attachment Type', 'نوع المرفق', 'Type de pièce jointe'),
(490, 'exam_master', 'Exam Master', 'الامتحان ماجستير', 'Maître d\'examen'),
(491, 'exam_hall', 'Exam Hall', 'قاعة الامتحان', 'Salle d\'examen'),
(492, 'mark_entries', 'Mark Entries', 'إدخالات مارك', 'Marquer les entrées'),
(493, 'tabulation_sheet', 'Tabulation Sheet', 'ورقة الجدولة', 'Feuille de tabulation'),
(494, 'supervision', 'Supervision', 'إشراف', 'Supervision'),
(495, 'hostel_master', 'Hostel Master', 'نزل ماستر', 'Hostel Master'),
(496, 'hostel_room', 'Hostel Room', 'غرفة نزل', 'Chambre d\'auberge'),
(497, 'allocation_report', 'Allocation Report', 'تقرير التخصيص', 'Rapport d\'allocation'),
(498, 'route_master', 'Route Master', 'سيد الطريق', 'Route Master'),
(499, 'vehicle_master', 'Vehicle Master', 'سيد السيارة', 'Véhicule maître'),
(500, 'stoppage', 'Stoppage', 'إضراب', 'Arrêt'),
(501, 'assign_vehicle', 'Assign Vehicle', 'تخصيص مركبة', 'Assigner un véhicule'),
(502, 'reports', 'Reports', 'تقارير', 'Rapports'),
(503, 'books_entry', 'Books Entry', 'دخول الكتب', 'Entrée de livres'),
(504, 'event_type', 'Event Type', 'نوع الحدث', 'Event Type'),
(505, 'add_events', 'Add Events', 'إضافة أحداث', 'Ajouter des événements'),
(506, 'student_accounting', 'Student Accounting', 'محاسبة الطلاب', 'Comptabilité des étudiants'),
(507, 'create_single_invoice', 'Create Single Invoice', 'إنشاء فاتورة واحدة', 'Créer une facture unique'),
(508, 'create_multi_invoice', 'Create Multi Invoice', 'إنشاء متعدد الفاتورة', 'Créer une facture multiple'),
(509, 'summary_report', 'Summary Report', 'تقرير ملخص', 'Rapport sommaire'),
(510, 'office_accounting', 'Office Accounting', 'محاسبة المكتب', 'Comptabilité de bureau'),
(511, 'under_group', 'Under Group', 'تحت المجموعة', 'Sous groupe'),
(512, 'bank_account', 'Bank Account', 'حساب البنك', 'Compte bancaire'),
(513, 'ledger_account', 'Ledger Account', 'حساب دفتر الأستاذ', 'Compte général'),
(514, 'create_voucher', 'Create Voucher', 'إنشاء قسيمة', 'Créer votre bon'),
(515, 'day_book', 'Day Book', 'كتاب اليوم', 'Livre de jour'),
(516, 'cash_book', 'Cash Book', 'كتاب النقدية', 'Livre de caisse'),
(517, 'bank_book', 'Bank Book', 'كتاب البنك', 'Livret de banque'),
(518, 'ledger_book', 'Ledger Book', 'دفتر الأستاذ', 'Livre de grand livre'),
(519, 'trial_balance', 'Trial Balance', 'ميزان المراجعة', 'Balance de vérification'),
(520, 'settings', 'Settings', 'الإعدادات', 'Réglages'),
(521, 'sms_settings', 'Sms Settings', 'إعدادات الرسائل القصيرة', 'Paramètres Sms'),
(522, 'cash_book_of', 'Cash Book Of', 'كتاب النقدية من', 'Livre de caisse de'),
(523, 'by_cash', 'By Cash', 'نقدا', 'En espèces'),
(524, 'by_bank', 'By Bank', 'عن طريق البنك', 'Par banque'),
(525, 'total_strength', 'Total Strength', 'القوة الكلية', 'Force totale'),
(526, 'teachers', 'Teachers', 'معلمون', 'Enseignants'),
(527, 'student_quantity', 'Student Quantity', 'كمية الطالب', 'Quantité d\'étudiant'),
(528, 'voucher', 'Voucher', 'قسيمة', 'Bon'),
(529, 'total_number', 'Total Number', 'মোট সংখ্যা', 'Nombre total'),
(530, 'total_route', 'Total Route', 'الطريق الإجمالي', 'Total Route'),
(531, 'total_room', 'Total Room', 'مجموع الغرفة', 'Chambre totale'),
(532, 'amount', 'Amount', 'كمية', 'Montant'),
(533, 'branch_dashboard', 'Branch Dashboard', 'لوحة تحكم الفرع', 'Tableau de bord de branche'),
(534, 'branch_list', 'Branch List', 'قائمة الفرع', 'Liste de branche'),
(535, 'create_branch', 'Create Branch', 'إنشاء فرع', 'Créer une branche'),
(536, 'branch_name', 'Branch Name', 'اسم الفرع', 'Nom de la filiale'),
(537, 'school_name', 'School Name', 'اسم المدرسة', 'Nom de l\'école'),
(538, 'mobile_no', 'Mobile No', 'رقم الموبايل', 'Mobile No'),
(539, 'symbol', 'Symbol', 'رمز', 'symbole'),
(540, 'city', 'City', 'مدينة', 'Ville'),
(541, 'academic_year', 'Academic Year', 'السنة الأكاديمية', 'Année académique'),
(542, 'select_branch_first', 'First Select The Branch', 'أولا اختر الفرع', 'D\'abord, sélectionnez la branche'),
(543, 'select_class_first', 'Select Class First', 'اختر الفئة الأولى', 'Sélectionnez la classe d\'abord'),
(544, 'select_country', 'Select Country', 'حدد الدولة', 'Choisissez le pays'),
(545, 'mother_tongue', 'Mother Tongue', 'اللغة الأم', 'Langue maternelle'),
(546, 'caste', 'Caste', 'الطائفة', 'Caste'),
(547, 'present_address', 'Present Address', 'العنوان الحالي', 'Adresse actuelle'),
(548, 'permanent_address', 'Permanent Address', 'العنوان الثابت', 'Permanent Address'),
(549, 'profile_picture', 'Profile Picture', 'الصوره الشخصيه', 'Image de profil'),
(550, 'login_details', 'Login Details', 'تفاصيل تسجيل الدخول', 'détails de connexion'),
(551, 'retype_password', 'Retype Password', 'أعد إدخال كلمة السر', 'Retaper le mot de passe'),
(552, 'occupation', 'Occupation', 'الاحتلال', 'Ocupación'),
(553, 'income', 'Income', 'الإيرادات', 'Ingresos'),
(554, 'education', 'Education', 'التعليم', 'Éducation'),
(555, 'first_select_the_route', 'First Select The Route', 'أولا اختر الطريق', 'Sélectionnez d\'abord l\'itinéraire'),
(556, 'hostel_details', 'Hostel Details', 'تفاصيل النزل', 'Détails de l\'hôtel'),
(557, 'first_select_the_hostel', 'First Select The Hostel', 'প্রথম ছাত্রাবাস নির্বাচন', 'd\'abord sélectionner l\'hôtel'),
(558, 'previous_school_details', 'Previous School Details', 'تفاصيل المدرسة السابقة', 'Privilege School Détails'),
(559, 'book_name', 'Book Name', 'اسم الكتاب', 'Nom du livre'),
(560, 'select_ground', 'Select Ground', 'اختر الأرض', 'sélectionnez Ground'),
(561, 'import', 'Import', 'استيراد', 'Importation'),
(562, 'add_student_category', 'Add Student Category', 'إضافة فئة الطالب', 'Ajouter une catégorie d\'étudiant'),
(563, 'id', 'Id', '', 'Id'),
(564, 'edit_category', 'Edit Category', 'تحرير الفئة', 'Modifier la catégorie'),
(565, 'deactivate_account', 'Deactivate Account', 'تعطيل الحساب', 'Désactiver le compte'),
(566, 'all_sections', 'All Sections', 'كل الأقسام', 'toutes les filières'),
(567, 'authentication_activate', 'Authentication Activate', 'تفعيل المصادقة', 'Authentification Activer'),
(568, 'department', 'Department', ' قسم، أقسام', 'département'),
(569, 'salary_grades', 'Salary Grades', 'راتب', 'Note salariale'),
(570, 'overtime', 'Overtime Rate (Per Hour)', 'معدل العمل الإضافي (لكل ساعة)', 'taux des heures supplémentaires (à l\'heure)'),
(571, 'salary_grade', 'Salary Grade', 'راتب', 'Note salariale'),
(572, 'payable_type', 'Payable Type', 'نوع الدفع', 'Payable Type'),
(573, 'edit_type', 'Edit Type', 'تحرير النوع', 'Τύπος επεξεργασίας'),
(574, 'role', 'Role', 'وظيفة', 'Rôle'),
(575, 'remuneration_info_for', 'Remuneration Info For', 'الأجور معلومات عن', 'Information de rémunération pour'),
(576, 'salary_paid', 'Salary Paid', 'الراتب المدفوع', 'Salaire payé'),
(577, 'salary_unpaid', 'Salary Unpaid', 'الراتب غير مدفوع', 'Salaire impayé'),
(578, 'pay_now', 'Pay Now', 'ادفع الآن', 'Payez maintenant'),
(579, 'employee_role', 'Employee Role', 'دور الموظف', 'Rôle de l\'employé'),
(580, 'create_at', 'Create At', 'خلق في', 'Créer à'),
(581, 'select_employee', 'Select Employee', 'اختر الموظف', 'Sélectionnez un employé'),
(582, 'review', 'Review', 'إعادة النظر', 'revisión'),
(583, 'reviewed_by', 'Reviewed By', 'تمت مراجعته من قبل', 'Revu par'),
(584, 'submitted_by', 'Submitted By', 'المقدمة من قبل', 'Proposé par'),
(585, 'employee_type', 'Employee Type', 'نوع موظف', 'Type d\'employé'),
(586, 'approved', 'Approved', 'وافق', 'Approuvé'),
(587, 'unreviewed', 'Unreviewed', 'غير مراجع', 'Non revu'),
(588, 'creation_date', 'Creation Date', 'تاريخ الإنشاء', 'Creation Date'),
(589, 'no_information_available', 'No Information Available', 'لا توجد معلومات متاحة', 'Pas d\'information disponible'),
(590, 'continue_to_payment', 'Continue To Payment', 'مواصلة الدفع', 'Continuer au paiement'),
(591, 'overtime_total_hour', 'Overtime Total Hour', 'الساعة الاجمالية', 'Heures totales supplémentaires'),
(592, 'overtime_amount', 'Overtime Amount', 'مبلغ العمل الإضافي', 'Heures supplémentaires'),
(593, 'remarks', 'Remarks', 'تعليق', 'Remarque'),
(594, 'view', 'View', 'رأي', 'Vue'),
(595, 'leave_appeal', 'Leave Appeal', 'اترك الاستئناف', 'Laisser appel'),
(596, 'create_leave', 'Create Leave', 'خلق إجازة', 'Créer un congé'),
(597, 'user_role', 'User Role', 'دور المستخدم', 'Rôle de l\'utilisateur'),
(598, 'date_of_start', 'Date Of Start', 'تاريخ البدء', 'Date de début'),
(599, 'date_of_end', 'Date Of End', 'تاريخ النهاية', 'Date de fin'),
(600, 'winner', 'Winner', 'الفائز', 'Gagnantविजेता'),
(601, 'select_user', 'Select User', 'اختر المستخدم', 'Sélectionnez un utilisateur'),
(602, 'create_class', 'Create Class', 'إنشاء فصل دراسي', 'Créer un niveau'),
(603, 'class_teacher_allocation', 'Class Teacher Allocation', 'تخصيص معلم الصف', 'Affectation des enseignants de classe'),
(604, 'class_teacher', 'Class Teacher', 'معلم الصف', 'Professeur de classe'),
(605, 'create_subject', 'Create Subject', 'إنشاء موضوع', 'Créer un sujet'),
(606, 'select_multiple_subject', 'Select Multiple Subject', 'حدد موضوعًا متعددًا', 'Sélectionnez plusieurs sujets'),
(607, 'teacher_assign', 'Teacher Assign', 'تعيين المعلم', 'Affectation des enseignants'),
(608, 'teacher_assign_list', 'Teacher Assign List', 'قائمة تعيين المعلم', 'Liste d\'affectation des enseignants'),
(609, 'select_department_first', 'Select Department First', 'حدد القسم أولاً', 'Sélectionnez d\'abord le département'),
(610, 'create_book', 'Create Book', 'إنشاء كتاب', 'Créer un livre'),
(611, 'book_title', 'Book Title', 'عنوان كتاب', 'Titre de livre'),
(612, 'cover', 'Cover', 'التغطية', 'Couverture'),
(613, 'edition', 'Edition', 'الإصدار', 'Édition'),
(614, 'isbn_no', 'ISBN No', 'رقم ISBN', 'ISBN Non'),
(615, 'purchase_date', 'Purchase Date', 'تاريخ الشراء', 'Purchase Date'),
(616, 'cover_image', 'Cover Image', 'صورة الغلاف', 'Cover Image'),
(617, 'book_issue', 'Book Issue', 'إصدار الكتاب', 'Numéro de livre'),
(618, 'date_of_issue', 'Date Of Issue', 'تاريخ المسألة', 'Date d&#39;Emission'),
(619, 'date_of_expiry', 'Date Of Expiry', 'تاريخ الانتهاء', 'Date d\'expiration'),
(620, 'select_category_first', 'Select Category First', 'حدد الفئة الأولى', 'Sélectionnez d\'abord la catégorie'),
(621, 'type_name', 'Type Name', 'أكتب اسم', 'Nom du type'),
(622, 'type_list', 'Type List', 'قائمة الأنواع', 'Liste des types'),
(623, 'icon', 'Icon', 'أيقونة', 'Icône'),
(624, 'event_list', 'Event List', 'قائمة الأحداث', 'Liste des événements'),
(625, 'create_event', 'Create Event', 'انشاء حدث', 'Créer un évènement'),
(626, 'type', 'Type', 'نوع', 'Type'),
(627, 'audience', 'Audience', 'الجمهور', 'Audience'),
(628, 'created_by', 'Created By', 'انشأ من قبل', 'Créé par'),
(629, 'publish', 'Publish', 'ينشر', 'Publier'),
(630, 'everybody', 'Everybody', 'الجميع', 'Tout le monde'),
(631, 'selected_class', 'Selected Class', 'فئة مختارة', 'Classe sélectionnée'),
(632, 'selected_section', 'Selected Section', 'القسم المختار', 'Filière sélectionnée'),
(633, 'information_has_been_updated_successfully', 'Information Has Been Updated Successfully', 'تم تحديث المعلومات بنجاح', 'Les informations ont été mises à jour avec succès'),
(634, 'create_invoice', 'Create Invoice', 'إنشاء فاتورة', 'Créer une facture'),
(635, 'invoice_entry', 'Invoice Entry', 'إدخال الفاتورة', 'Saisie de facture'),
(636, 'quick_payment', 'Quick Payment', 'دفع سريع', 'Paiement rapide'),
(637, 'write_your_remarks', 'Write Your Remarks', 'اكتب ملاحظاتك', 'Écrivez vos remarques'),
(638, 'reset', 'Reset', 'إعادة تعيين', 'Réinitialiser'),
(639, 'fees_payment_history', 'Fees Payment History', 'تاريخ دفع الرسوم', 'Historique des paiements'),
(640, 'fees_summary_report', 'Fees Summary Report', 'تقرير ملخص الرسوم', 'Rapport sommaire des frais'),
(641, 'add_account_group', 'Add Account Group', 'إضافة مجموعة حساب', 'Ajouter un groupe de comptes'),
(642, 'account_group', 'Account Group', 'جماعة حساب', 'Compte de groupe'),
(643, 'account_group_list', 'Account Group List', 'قائمة مجموعة الحساب', 'Liste des groupes de comptes'),
(644, 'mailbox', 'Mailbox', 'صندوق بريد', 'Boites aux lettres'),
(645, 'refresh_mail', 'Refresh Mail', 'تحديث البريد', 'Refresh Mail'),
(646, 'sender', 'Sender', 'مرسل', 'expéditeur'),
(647, 'general_settings', 'General Settings', 'الاعدادات العامة', 'réglages généraux'),
(648, 'institute_name', 'Institute Name', 'اسم المعهد', 'Nom de l&#39;Institut'),
(649, 'institution_code', 'Institution Code', 'رمز المؤسسة', 'Institution Code'),
(650, 'sms_service_provider', 'Sms Service Provider', 'مزود خدمة الرسائل القصيرة', 'Fournisseur de services SMS'),
(651, 'footer_text', 'Footer Text', 'نص التذييل', 'Texte de pied de page'),
(652, 'payment_control', 'Payment Control', 'مراقبة الدفع', 'Contrôle des paiements'),
(653, 'sms_config', 'Sms Config', 'تكوين الرسائل القصيرة', 'Config Sms'),
(654, 'sms_triggers', 'Sms Triggers', 'مشغلات الرسائل القصيرة', 'Déclencheurs SMS'),
(655, 'authentication_token', 'Authentication Token', 'رمز المصادقة', 'Jeton d\'authentification'),
(656, 'sender_number', 'Sender Number', 'رقم المرسل', 'Numéro d\'expéditeur'),
(657, 'username', 'Username', 'اسم المستخدم', 'Nom d\'utilisateur'),
(658, 'api_key', 'Api Key', 'مفتاح API', 'Clé API'),
(659, 'authkey', 'Authkey', 'Authkey', 'Authkey'),
(660, 'sender_id', 'Sender Id', 'معرف الإرسال', 'Identifiant de l\'expéditeur'),
(661, 'sender_name', 'Sender Name', 'اسم المرسل', 'Nom de l\'expéditeur'),
(662, 'hash_key', 'Hash Key', 'مفتاح التجزئة', 'Touche dièse'),
(663, 'notify_enable', 'Notify Enable', 'إعلام تمكين', 'Notify Enable'),
(664, 'exam_attendance', 'Exam Attendance', 'حضور الامتحان', 'Participation aux examens'),
(665, 'exam_results', 'Exam Results', 'نتائج الامتحانات', 'Résultats d\'examen'),
(666, 'email_config', 'Email Config', 'تكوين البريد الإلكتروني', 'Email Config'),
(667, 'email_triggers', 'Email Triggers', 'مشغلات البريد الإلكتروني', 'Déclencheurs de messagerie'),
(668, 'account_registered', 'Account Registered', 'تم تسجيل الحساب', 'Compte enregistré'),
(669, 'forgot_password', 'Forgot Password', 'هل نسيت كلمة المرور', 'Mot de passe oublié'),
(670, 'new_message_received', 'New Message Received', 'تم تلقي رسالة جديدة', 'Nouveau message reçu'),
(671, 'payslip_generated', 'Payslip Generated', 'تم إنشاء Payslip', 'Fiche de paie générée'),
(672, 'leave_approve', 'Leave Approve', 'اترك الموافقة', 'Laisser approuver'),
(673, 'leave_reject', 'Leave Reject', 'اترك رفض', 'Laisser rejeter'),
(674, 'advance_salary_approve', 'Leave Reject', 'اترك رفض', 'Laisser rejeter'),
(675, 'advance_salary_reject', 'Advance Salary Reject', 'رفض الراتب المسبق', 'Rejet de salaire anticipé'),
(676, 'add_session', 'Add Session', 'إضافة جلسة', 'Ajouter une session'),
(677, 'session', 'Session', 'جلسة', 'Session'),
(678, 'created_at', 'Created At', 'أنشئت في', 'Créé à'),
(679, 'sessions', 'Sessions', 'الجلسات', 'Sessions'),
(680, 'flag', 'Flag', 'العلم', 'Drapeau'),
(681, 'stats', 'Stats', 'احصائيات', 'Statistiques'),
(682, 'updated_at', 'Updated At', 'تم التحديث في', 'Mis à jour à'),
(683, 'flag_icon', 'Flag Icon', 'رمز العلم', 'Icône de drapeau'),
(684, 'password_restoration', 'Password Restoration', 'استعادة كلمة المرور', 'Restauration du mot de passe'),
(685, 'forgot', 'Forgot', 'نسيت', 'Oublié'),
(686, 'back_to_login', 'Back To Login', 'العودة لتسجيل الدخول', 'Retour connexion'),
(687, 'database_list', 'Database List', 'قائمة قاعدة البيانات', 'Liste des bases de données'),
(688, 'create_backup', 'Create Backup', 'انشئ نسخة احتياطية', 'Créer une sauvegarde'),
(689, 'backup', 'Backup', 'دعم', 'Sauvegarde'),
(690, 'backup_size', 'Backup Size', 'حجم النسخ الاحتياطي', 'Taille de sauvegarde'),
(691, 'file_upload', 'File Upload', 'تحميل الملف', 'Téléchargement de fichiers'),
(692, 'parents_details', 'Parents Details', 'تفاصيل الوالدين', 'Détails des parents'),
(693, 'social_links', 'Social Links', 'روابط اجتماعية', 'Liens sociaux'),
(694, 'create_hostel', 'Create Hostel', 'إنشاء نزل', 'Créer une auberge'),
(695, 'allocation_list', 'Allocation List', 'قائمة التخصيص', 'Allocation List'),
(696, 'payslip_history', 'Payslip History', 'سجل الدفع', 'Historique des fiches de paie'),
(697, 'my_attendance_overview', 'My Attendance Overview', 'نظرة عامة على الحضور', 'Présentation de My Attendance'),
(698, 'total_present', 'Total Present', 'المجموع الحالي', 'Total présent'),
(699, 'total_absent', 'Total Absent', 'المجموع الكلي', 'Total Absent'),
(700, 'total_late', 'Total Late', 'المجموع المتأخر', 'Total en retard'),
(701, 'class_teacher_list', 'Class Teacher List', 'قائمة مدرس الفصل', 'Liste des enseignants de classe'),
(702, 'section_control', 'Section Control', 'التحكم بالقسم', 'Filière côntrole'),
(703, 'capacity ', 'Capacity', 'سعة', 'Capacité'),
(704, 'request', 'Request', 'طلب', 'Demande'),
(705, 'salary_year', 'Salary Year', 'سنة الراتب', 'Année de salaire'),
(706, 'create_attachments', 'Create Attachments', 'إنشاء المرفقات', 'Créer des pièces jointes');
INSERT INTO `languages` (`id`, `word`, `english`, `arabic`, `french`) VALUES
(707, 'publish_date', 'Publish Date', 'تاريخ النشر', 'Publish Date'),
(708, 'attachment_file', 'Attachment File', 'ملف المرفق', 'Fichier joint'),
(709, 'age', 'Age', 'عمر', 'Âge'),
(710, 'student_profile', 'Student Profile', 'الملف الشخصي للطالب', 'Profil étudiant'),
(711, 'authentication', 'Authentication', 'المصادقة', 'Authentification'),
(712, 'parent_information', 'Parent Information', 'معلومات الوالدين', 'Parent Information'),
(713, 'full_marks', 'Full Marks', 'علامات كاملة', 'La totalité des points'),
(714, 'passing_marks', 'Passing Marks', 'علامات النجاح', 'Marques de passage'),
(715, 'highest_marks', 'Highest Marks', 'أعلى العلامات', 'Marques les plus élevées'),
(716, 'unknown', 'Unknown', 'مجهول', 'Inconnue'),
(717, 'unpublish', 'Unpublish', 'غير منشور', 'Annuler la publication'),
(718, 'login_authentication_deactivate', 'Login Authentication Deactivate', 'إلغاء تنشيط مصادقة تسجيل الدخول', 'Authentification de connexion désactivée'),
(719, 'employee_profile', 'Employee Profile', 'ملف تعريف الموظف', 'Profil d\'employé'),
(720, 'employee_details', 'Employee Details', 'تفاصيل الموظف', 'Détails de l\'employé'),
(721, 'salary_transaction', 'Salary Transaction', 'معاملة الراتب', 'Transaction salariale'),
(722, 'documents', 'Documents', 'مستندات', 'Documents'),
(723, 'actions', 'Actions', 'أجراءات', 'Actions'),
(724, 'activity', 'Activity', 'نشاط', 'Activité'),
(725, 'department_list', 'Department List', 'قائمة الأقسام', 'Liste des départements'),
(726, 'manage_employee_salary', 'Manage Employee Salary', 'إدارة راتب الموظف', 'Gérer le salaire des employés'),
(727, 'the_configuration_has_been_updated', 'The Configuration Has Been Updated', 'تم تحديث التكوين', 'La configuration a été mise à jour'),
(728, 'add', 'Add', 'أضف', 'Ajouter'),
(729, 'create_exam', 'Create Exam', 'إنشاء امتحان', 'Créer un examen'),
(730, 'term', 'Term', 'مصطلح', 'Terme'),
(731, 'add_term', 'Add Term', 'إضافة مصطلح', 'Ajouter un terme'),
(732, 'create_grade', 'Create Grade', 'إنشاء تقدير', 'Créer une note'),
(733, 'mark_starting', 'Mark Starting', 'علامة البداية', 'Mark Starting'),
(734, 'mark_until', 'Mark Until', 'ضع علامة حتى', 'Marquer jusqu\'à'),
(735, 'room_list', 'Room List', 'قائمة غرفة', 'Liste des chambres'),
(736, 'room', 'Room', 'غرفة', 'Chambre'),
(737, 'route_list', 'Route List', 'قائمة المسار', 'Liste des itinéraires'),
(738, 'create_route', 'Create Route', 'إنشاء طريق', 'Créer un itinéraire'),
(739, 'vehicle_list', 'Vehicle List', 'قائمة المركبات', 'Liste des véhicules'),
(740, 'create_vehicle', 'Create Vehicle', 'إنشاء مركبة', 'Créer un véhicule'),
(741, 'stoppage_list', 'Stoppage List', 'قائمة التوقف', 'Liste des arrêts'),
(742, 'create_stoppage', 'Create Stoppage', 'إنشاء توقف', 'Créer un arrêt'),
(743, 'stop_time', 'Stop Time', 'وقت التوقف', 'Temps d\'arrêt'),
(744, 'employee_attendance', 'Employee Attendance', 'حضور الموظف', 'Présence des employés'),
(745, 'attendance_report', 'Attendance Report', 'حضور الموظف', 'Présence des employés'),
(746, 'opening_balance', 'Opening Balance', 'الرصيد الافتتاحي', 'Solde d\'ouverture'),
(747, 'add_opening_balance', 'Add Opening Balance', 'إضافة رصيد افتتاحي', 'Ajouter un solde d\'ouverture'),
(748, 'credit', 'Credit', 'ائتمان', 'Crédit'),
(749, 'debit', 'Debit', 'مدين', 'Débit'),
(750, 'opening_balance_list', 'Opening Balance List', 'قائمة الرصيد الافتتاحي', 'liste des soldes d\'ouverture'),
(751, 'voucher_list', 'Voucher List', 'قائمة القسائم', 'Liste des bons'),
(752, 'voucher_head', 'Voucher Head', 'رئيس قسيمة', 'Tête de bon'),
(753, 'payment_method', 'Payment Method', 'طريقة الدفع او السداد', 'Mode de paiement'),
(754, 'credit_ledger_account', 'Credit Ledger Account', 'حساب دفتر الأستاذ الائتماني', 'Compte de crédit'),
(755, 'debit_ledger_account', 'Debit Ledger Account', 'حساب دفتر الأستاذ المدين', 'Compte du livre de débit'),
(756, 'voucher_no', 'Voucher No', 'رقم القسيمة', 'Numéro de bon'),
(757, 'balance', 'Balance', 'توازن', 'Équilibre'),
(758, 'event_details', 'Event Details', 'تفاصيل الحدث', 'Détails de l\'évènement'),
(759, 'welcome_to', 'Welcome To', 'مرحبا بك في', 'Bienvenue à'),
(760, 'report_card', 'Report Card', 'بطاقة تقرير', 'Bulletin scolaire'),
(761, 'online_pay', 'Online Pay', 'الدفع عبر الإنترنت', 'Paiement en ligne'),
(762, 'annual_fees_summary', 'Annual Fees Summary', 'ملخص الرسوم السنوية', 'Résumé des frais annuels'),
(763, 'my_children', 'My Children', 'أطفالي', 'Mes enfants'),
(764, 'assigned', 'Assigned', 'تعيين', 'Attribué'),
(765, 'confirm_password', 'Confirm Password', 'تأكيد كلمة المرور', 'Confirmez le mot de passe'),
(766, 'searching_results', 'Searching Results', 'نتائج البحث', 'Résultats de la recherche'),
(767, 'information_has_been_saved_successfully', 'Information Has Been Saved Successfully', 'تم حفظ المعلومات بنجاح', 'Les informations ont été enregistrées avec succès'),
(768, 'information_deleted', 'The information has been successfully deleted', 'تم حذف المعلومات بنجاح', 'L\'information a été supprimée avec succès'),
(769, 'deleted_note', '*Note : This data will be permanently deleted', '* ملاحظة: سيتم حذف هذه البيانات نهائيًا', '* Remarque: ces données seront définitivement supprimées.'),
(770, 'are_you_sure', 'Are You Sure?', 'هل أنت واثق؟', 'Êtes-vous sûr?'),
(771, 'delete_this_information', 'Do You Want To Delete This Information?', 'هل تريد حذف هذه المعلومات؟', 'Voulez-vous supprimer cette information?'),
(772, 'yes_continue', 'Yes, Continue', 'نعم ، استمر', 'Oui, continuez'),
(773, 'deleted', 'Deleted', 'تم الحذف', 'Effacé'),
(774, 'collect', 'Collect', 'تجميع', 'Collecte'),
(775, 'school_setting', 'School Setting', 'إعداد المدرسة', 'Milieu scolaire'),
(776, 'set', 'Set', 'جلس', 'Ensemble'),
(777, 'quick_view', 'Quick View', 'نظرة سريعة', 'Aperçu rapide'),
(778, 'due_fees_invoice', 'Due Fees Invoice', 'فاتورة رسوم مستحقة', 'Facture due'),
(779, 'my_application', 'My Application', 'طلبي', 'Mon application'),
(780, 'manage_application', 'Manage Application', 'إدارة الطلب', 'Gérer l\'application'),
(781, 'leave', 'Leave', 'غادر', 'Laisser'),
(782, 'live_class_rooms', 'Live Class Rooms', 'غرف الصف المباشر', 'Salles de cours en direct'),
(783, 'homework', 'Homework', 'واجب منزلي', 'Devoirs'),
(784, 'evaluation_report', 'Evaluation Report', 'تقرير التقييم', 'Rapport d\'évaluation'),
(785, 'exam_term', 'Exam Term', 'مصطلح الامتحان', 'Durée de l\'examen'),
(786, 'distribution', 'Distribution', 'توزيع', 'Distribution'),
(787, 'exam_setup', 'Exam Setup', 'إعداد الامتحان', 'Configuration de l\'examen'),
(788, 'sms', 'Sms', '', ''),
(789, 'fees_type', 'Fees Type', 'نوع الرسوم', 'Type de frais'),
(790, 'fees_group', 'Fees Group', 'مجموعة الرسوم', 'Groupe de frais'),
(791, 'fine_setup', 'Fine Setup', 'الإعداد الجيد', 'Configuration fine'),
(792, 'fees_reminder', 'Fees Reminder', 'تذكير بالرسوم', 'Rappel des frais'),
(793, 'new_deposit', 'New Deposit', 'وديعة جديدة', 'Nouveau dépôt'),
(794, 'new_expense', 'New Expense', 'نفقة جديدة', 'Nouvelle dépense'),
(795, 'all_transactions', 'All Transactions', 'كل الحركات المالية', 'toutes transactions'),
(796, 'head', 'Head', 'رئيس', 'Tête'),
(797, 'fees_reports', 'Fees Reports', 'تقارير الرسوم', 'Rapports sur les frais'),
(798, 'fees_report', 'Fees Report', 'تقرير الرسوم', 'Rapport sur les frais'),
(799, 'receipts_report', 'Receipts Report', 'تقرير الإيصالات', 'Rapport sur les reçus'),
(800, 'due_fees_report', 'Due Fees Report', 'تقرير الرسوم المستحقة', 'Rapport sur les frais dus'),
(801, 'fine_report', 'Fine Report', 'تقرير جيد', 'Beau rapport'),
(802, 'financial_reports', 'Financial Reports', 'تقارير مالية', 'Rapports financiers'),
(803, 'statement', 'Statement', 'بيان', 'Déclaration'),
(804, 'repots', 'Repots', '', ''),
(805, 'expense', 'Expense', 'مصروف', 'Frais'),
(806, 'transitions', 'Transitions', 'الانتقالات', 'Transitions'),
(807, 'sheet', 'Sheet', 'ورقة', 'Feuille'),
(808, 'income_vs_expense', 'Income Vs Expense', 'الدخل مقابل المصاريف', 'Revenu contre dépenses'),
(809, 'attendance_reports', 'Attendance Reports', 'تقارير الحضور', 'Rapports de présence'),
(810, 'examination', 'Examination', 'فحص', 'Examen'),
(811, 'school_settings', 'School Settings', 'إعدادات المدرسة', 'Paramètre d\'UCA'),
(812, 'role_permission', 'Role Permission', 'إذن الدور', 'Autorisation de rôle'),
(813, 'cron_job', 'Cron Job', 'وظيفة كرون', 'Tâche planifiée'),
(814, 'custom_field', 'Custom Field', 'حقل مخصص', 'Champ personnalisé'),
(815, 'enter_valid_email', 'Enter Valid Email', 'أدخل بريدًا إلكترونيًا صالحًا', 'Entrez une adresse email valide'),
(816, 'lessons', 'Lessons', 'الدروس', 'Cours'),
(817, 'live_class', 'Live Class', 'فئة حية', 'Cours en direct'),
(818, 'sl', 'Sl', '', ''),
(819, 'meeting_id', 'Meeting ID', 'فئة حية', 'Cours en direct'),
(820, 'start_time', 'Start Time', '', ''),
(821, 'end_time', 'End Time', '', ''),
(822, 'zoom_meeting_id', 'Zoom Meeting Id', 'تكبير / تصغير معرف الاجتماع', 'Zoom ID de réunion'),
(823, 'zoom_meeting_password', 'Zoom Meeting Password', 'تكبير كلمة مرور الاجتماع', 'Zoom sur le mot de passe de la réunion'),
(824, 'time_slot', 'Time Slot', 'فسحة زمنية', 'Créneau horaire'),
(825, 'send_notification_sms', 'Send Notification Sms', 'إرسال رسالة إعلام', 'Envoyer des SMS de notification'),
(826, 'host', 'Host', 'مضيف', 'Hôte'),
(827, 'school', 'School', 'مدرسة', 'École'),
(828, 'accounting_links', 'Accounting Links', 'روابط المحاسبة', 'Liens comptables'),
(829, 'applicant', 'Applicant', 'طالب وظيفة', 'Demandeur'),
(830, 'apply_date', 'Apply Date', 'تاريخ تطبيق', 'Date d\'application'),
(831, 'add_leave', 'Add Leave', 'أضف إجازة', 'Ajouter un congé'),
(832, 'leave_date', 'Leave Date', 'تاريخ مغادرة', 'Date de départ'),
(833, 'attachment', 'Attachment', '', ''),
(834, 'comments', 'Comments', 'تعليقات', 'commentaires'),
(835, 'staff_id', 'Staff Id', 'معرف الموظفين', 'Identifiant du personnel'),
(836, 'income_vs_expense_of', 'Income Vs Expense Of', 'دخل مقابل حساب', 'Revenu contre dépenses de'),
(837, 'designation_name', 'Designation Name', 'اسم التعيين', 'Nom de la désignation'),
(838, 'already_taken', 'This %s already exists.', '', ''),
(839, 'department_name', 'Department Name', 'اسم القسم', 'Nom du département'),
(840, 'date_of_birth', 'Date Of Birth', '', ''),
(841, 'bulk_delete', 'Bulk Delete', 'حذف مجمّع', 'Suppression groupée'),
(842, 'guardian_name', 'Guardian Name', 'اسم الوصي', 'Nom du gardien'),
(843, 'fees_progress', 'Fees Progress', 'رسوم التقدم', 'Progression des frais'),
(844, 'evaluate', 'Evaluate', 'تقييم', 'Évaluer'),
(845, 'date_of_homework', 'Date Of Homework', 'تاريخ الواجب المنزلي', 'Date des devoirs'),
(846, 'date_of_submission', 'Date Of Submission', 'تاريخ التقديم', 'Date de soumission'),
(847, 'student_fees_report', 'Student Fees Report', 'تقرير رسوم الطالب', 'Rapport sur les frais de scolarité'),
(848, 'student_fees_reports', 'Student Fees Reports', 'تقارير رسوم الطلاب', 'Rapports sur les frais de scolarité'),
(849, 'due_date', 'Due Date', 'تاريخ الاستحقاق', 'Due Date'),
(850, 'payment_date', 'Payment Date', 'موعد الدفع', 'Date de paiement'),
(851, 'payment_via', 'Payment Via', 'الدفع عن طريق', 'Paiement via'),
(852, 'generate', 'Generate', 'انشاء', 'produire'),
(853, 'print_date', 'Print Date', 'تاريخ الطباعة', 'Print Date'),
(854, 'bulk_sms_and_email', 'Bulk Sms And Email', 'الرسائل القصيرة والبريد الإلكتروني', 'Sms en vrac et email'),
(855, 'campaign_type', 'Campaign Type', 'نوع الحملة', 'Type de campagne'),
(856, 'both', 'Both', 'على حد سواء', 'Tous les deux'),
(857, 'regular', 'Regular', 'منتظم', 'Ordinaire'),
(858, 'Scheduled', 'Scheduled', 'المقرر', 'Programmé'),
(859, 'campaign', 'Campaign', 'حملة', 'Campagne'),
(860, 'campaign_name', 'Campaign Name', 'اسم الحملة', 'Nom de la campagne'),
(861, 'sms_gateway', 'Sms Gateway', 'بوابة الرسائل القصيرة', 'Passerelle SMS'),
(862, 'recipients_type', 'Recipients Type', 'نوع المستلمين', 'Type de destinataires'),
(863, 'recipients_count', 'Recipients Count', 'عدد المستلمين', 'Nombre de destinataires'),
(864, 'body', 'Body', 'الجسم', 'Corps'),
(865, 'guardian_already_exist', 'Guardian Already Exist', 'الوصي موجود بالفعل', 'Guardian existe déjà'),
(866, 'guardian', 'Guardian', 'وصي', 'Gardien'),
(867, 'mother_name', 'Mother Name', 'اسم الأم', 'Nom de la mère'),
(868, 'bank_details', 'Bank Details', 'التفاصيل المصرفية', 'coordonnées bancaires'),
(869, 'skipped_bank_details', 'Skipped Bank Details', 'تخطي تفاصيل البنك', 'Détails bancaires ignorés'),
(870, 'bank', 'Bank', 'مصرف', 'Banque'),
(871, 'holder_name', 'Holder Name', 'اسم صاحب التسجيل', 'Nom du titulaire'),
(872, 'bank_branch', 'Bank Branch', 'فرع بنك', 'Agence bancaire'),
(873, 'custom_field_for', 'Custom Field For', 'حقل مخصص لـ', 'Champ personnalisé pour'),
(874, 'label', 'Label', 'ضع الكلمة المناسبة', 'Label'),
(875, 'order', 'Order', 'طلب', 'Ordre'),
(876, 'online_admission', 'Online Admission', 'القبول عبر الإنترنت', 'Online Admission'),
(877, 'field_label', 'Field Label', 'تسمية الميدان', 'Étiquette de champ'),
(878, 'field_type', 'Field Label', 'تسمية الميدان', 'Étiquette de champ'),
(879, 'default_value', 'Default Value', 'القيمة الافتراضية', 'Valeur par défaut'),
(880, 'checked', 'Checked', 'التحقق', 'Vérifié'),
(881, 'unchecked', 'Unchecked', 'غير محدد', 'Décoché'),
(882, 'roll_number', 'Roll Number', 'رقم اللفة', 'Numéro de rôle'),
(883, 'add_rows', 'Add Rows', 'إضافة صفوف', 'Ajouter des lignes'),
(884, 'salary', 'Salary', 'راتب', 'Un salaire'),
(885, 'basic', 'Basic', 'الأساسي', 'De base'),
(886, 'allowance', 'Allowance', '', ''),
(887, 'deduction', 'Deduction', '', ''),
(888, 'net', 'Net', 'Net', 'Net'),
(889, 'activated_sms_gateway', 'Activated Sms Gateway', 'بوابة الرسائل القصيرة المنشّطة', 'Passerelle Sms activée'),
(890, 'account_sid', 'Account Sid', 'حساب Sid', 'Compte Sid'),
(891, 'roles', 'Roles', 'الأدوار', 'Les rôles'),
(892, 'system_role', 'System Role', 'دور النظام', 'Rôle système'),
(893, 'permission', 'Permission', 'الإذن', 'Permission'),
(894, 'edit_session', 'Edit Session', 'تحرير الجلسة', 'Edit Session'),
(895, 'transactions', 'Transactions', 'المعاملات', 'Transactions'),
(896, 'default_account', 'Default Account', 'الحساب الافتراضي', 'Compte par défaut'),
(897, 'deposit', 'Deposit', 'الوديعة', 'Dépôt'),
(898, 'acccount', 'Acccount', 'حساب', 'Compte'),
(899, 'role_permission_for', 'Role Permission For', 'إذن دور لـ', 'Autorisation de rôle pour'),
(900, 'feature', 'Feature', 'خاصية', 'Fonctionnalité'),
(901, 'access_denied', 'Access Denied', 'تم الرفض', 'Accès refusé'),
(902, 'time_start', 'Time Start', 'وقت البدء', 'Heure de début'),
(903, 'time_end', 'Time End', 'انتهى الوقت', 'Fin de temps'),
(904, 'month_of_salary', 'Month Of Salary', 'شهر الراتب', 'Mois de salaire'),
(905, 'add_documents', 'Add Documents', 'أضف وثائق', 'Ajouter des documents'),
(906, 'document_type', 'Document Type', 'نوع الوثيقة', 'Document Type'),
(907, 'document', 'Document', 'المستند', 'Document'),
(908, 'document_title', 'Document Title', 'عنوان الوثيقة', 'Titre du document'),
(909, 'document_category', 'Document Category', 'فئة الوثيقة', 'Catégorie de document'),
(910, 'exam_result', 'Exam Result', 'نتيجة الإمتحان', 'Résultat d\'éxamen'),
(911, 'my_annual_fee_summary', 'My Annual Fee Summary', 'ملخص رسومي السنوي', 'Mon résumé des frais annuels'),
(912, 'book_manage', 'Book Manage', 'إدارة الكتاب', 'Book Manage'),
(913, 'add_leave_category', 'Add Leave Category', 'إضافة فئة إجازة', 'Ajouter une catégorie de congé'),
(914, 'edit_leave_category', 'Edit Leave Category', 'تحرير فئة الإجازة', 'Modifier la catégorie de congé'),
(915, 'staff_role', 'Staff Role', 'دور الموظفين', 'Rôle du personnel'),
(916, 'edit_assign', 'Edit Assign', 'تحرير تعيين', 'Modifier l\'attribution'),
(917, 'view_report', 'View Report', '', ''),
(918, 'rank_out_of_5', 'Rank Out Of 5', 'مرتبة من 5', 'Classement sur 5'),
(919, 'hall_no', 'Hall No', 'القاعة رقم', 'Salle No'),
(920, 'no_of_seats', 'No Of Seats', 'عدد المقاعد', 'Pas de sièges'),
(921, 'mark_distribution', 'Mark Distribution', 'توزيع مارك', 'Mark Distribution'),
(922, 'exam_type', 'Exam Type', 'نوع الامتحان', 'Type d\'examen'),
(923, 'marks_and_grade', 'Marks And Grade', 'العلامات والدرجات', 'Marques et grade'),
(924, 'min_percentage', 'Min Percentage', 'النسبة المئوية', 'Pourcentage minimal'),
(925, 'max_percentage', 'Max Percentage', 'النسبة المئوية القصوى', 'Pourcentage max'),
(926, 'cost_per_bed', 'Cost Per Bed', 'تكلفة السرير', 'Coût par lit'),
(927, 'add_category', 'Add Category', 'إضافة فئة', 'ajouter une catégorie'),
(928, 'category_for', 'Category For', 'التصنيف لـ', 'Catégorie Pour'),
(929, 'start_place', 'Start Place', 'ابدأ مكان', 'Start Place'),
(930, 'stop_place', 'Stop Place', 'مكان التوقف', 'Stop Place'),
(931, 'vehicle', 'Vehicle', 'مركبة', 'Véhicule'),
(932, 'select_multiple_vehicle', 'Select Multiple Vehicle', 'حدد مركبة متعددة', 'Sélectionnez plusieurs véhicules'),
(933, 'book_details', 'Book Details', 'تفاصيل الكتاب', 'Détails du livre'),
(934, 'issued_by', 'Issued By', 'أصدرت من قبل', 'Délivré par'),
(935, 'return_by', 'Return By', 'العودة بواسطة', 'Retour par'),
(936, 'group', 'Group', 'مجموعة', 'Groupe'),
(937, 'individual', 'Individual', 'فرد', 'Individuel'),
(938, 'recipients', 'Recipients', 'المستلمون', 'Destinataires'),
(939, 'group_name', 'Group Name', 'أسم المجموعة', 'Nom de groupe'),
(940, 'fee_code', 'Fee Code', 'كود الرسوم', 'Fee Code'),
(941, 'fine_type', 'Fine Type', 'نوع جيد', 'Type fin'),
(942, 'fine_value', 'Fine Value', 'قيمة جيدة', 'Fine Value'),
(943, 'late_fee_frequency', 'Late Fee Frequency', 'تردد الرسوم المتأخرة', 'Fréquence des frais de retard'),
(944, 'fixed_amount', 'Fixed Amount', 'مبلغ ثابت', 'Montant fixé'),
(945, 'fixed', 'Fixed', 'ثابت', 'Fixé'),
(946, 'daily', 'Daily', 'اليومي', 'du quotidien'),
(947, 'weekly', 'Weekly', 'أسبوعي', 'Hebdomadaire'),
(948, 'monthly', 'Monthly', 'شهريا', 'Mensuel'),
(949, 'annually', 'Annually', 'سنويا', 'Annuellement'),
(950, 'first_select_the_group', 'First Select The Group', 'أولا حدد المجموعة', 'Sélectionnez d\'abord le groupe'),
(951, 'percentage', 'Percentage', '', ''),
(952, 'value', 'Value', 'القيمة', 'Valeur'),
(953, 'fee_group', 'Fee Group', 'مجموعة الرسوم', 'Groupe de frais'),
(954, 'due_invoice', 'Due Invoice', 'فاتورة مستحقة', 'Facture due'),
(955, 'reminder', 'Reminder', 'تذكير', 'Rappel'),
(956, 'frequency', 'Frequency', 'تكرر', 'La fréquence'),
(957, 'notify', 'Notify', 'أبلغ', 'Notifier'),
(958, 'before', 'Before', 'قبل', 'Avant'),
(959, 'after', 'After', 'بعد', 'Après'),
(960, 'number', 'Number', 'رقم', 'Nombre'),
(961, 'ref_no', 'Ref No', 'مصدر رقم', 'Réf No'),
(962, 'pay_via', 'Pay Via', 'ادفع عن طريق', 'Payez via'),
(963, 'ref', 'Ref', '', ''),
(964, 'dr', 'Dr', '', ''),
(965, 'cr', 'Cr', '', ''),
(966, 'edit_book', 'Edit Book', 'تحرير كتاب', 'Modifier le livre'),
(967, 'leaves', 'Leaves', 'اوراق اشجار', 'Feuilles'),
(968, 'leave_request', 'Leave Request', 'طلب إجازة', 'Demande de congé'),
(969, 'this_file_type_is_not_allowed', 'This File Type Is Not Allowed', 'نوع الملف هذا غير مسموح به', 'Ce type de fichier n\'est pas autorisé'),
(970, 'error_reading_the_file', 'Error Reading The File', 'خطأ في قراءة الملف', 'Erreur de lecture du fichier'),
(971, 'staff', 'Staff', 'العاملين', 'Personnel'),
(972, 'waiting', 'Waiting', 'انتظار', 'Attendre'),
(973, 'live', 'Live', 'حي', 'Vivre'),
(974, 'by', 'By', '', ''),
(975, 'host_live_class', 'Host Live Class', 'استضافة فئة مباشرة', 'Host Live Class'),
(976, 'join_live_class', 'Join Live Class', 'انضم إلى Live Class', 'Rejoignez Live Class'),
(977, 'system_logo', 'System Logo', 'شعار النظام', 'Logo du système'),
(978, 'text_logo', 'Text Logo', 'شعار النص', 'Logo texte'),
(979, 'printing_logo', 'Printing Logo', 'شعار الطباعة', 'Printing Logo'),
(980, 'expired', 'Expired', 'منتهية الصلاحية', 'Expiré'),
(981, 'collect_fees', 'Collect Fees', 'تحصيل الرسوم', 'Percevoir les frais'),
(982, 'fees_code', 'Fees Code', 'كود الرسوم', 'Code des frais'),
(983, 'collect_by', 'Collect By', 'اجمع بواسطة', 'Collecter par'),
(984, 'fee_payment', 'Fee Payment', 'دفع الرسوم', 'Paiement des frais'),
(985, 'write_message', 'Write Message', 'اكتب رسالة', 'Écrire un message'),
(986, 'discard', 'Discard', 'تجاهل', 'Jeter'),
(987, 'message_sent_successfully', 'Message Sent Successfully', 'تم إرسال الرسالة بنجاح', 'Message envoyé avec succès'),
(988, 'visit_home_page', 'Visit Home Page', '', ''),
(989, 'frontend', 'Frontend', '', ''),
(990, 'setting', 'Setting', '', ''),
(991, 'menu', 'Menu', '', ''),
(992, 'page', 'Page', '', ''),
(993, 'manage', 'Manage', '', 'Gérer '),
(994, 'slider', 'Slider', '', ''),
(995, 'features', 'Features', '', 'Niveaux dans le homepage'),
(996, 'testimonial', 'Testimonial', '', 'Témoignage '),
(997, 'service', 'Service', '', 'Pourquoi nous choisir'),
(998, 'faq', 'Faq', '', 'F.A.Q'),
(999, 'card_management', 'Card Management', '', ''),
(1000, 'id_card', 'Id Card', '', ''),
(1001, 'templete', 'Templete', '', ''),
(1002, 'admit_card', 'Admit Card', '', ''),
(1003, 'certificate', 'Certificate', '', ''),
(1004, 'system_update', 'System Update', '', ''),
(1005, 'url', 'Url', '', ''),
(1006, 'content', 'Content', '', ''),
(1007, 'banner_photo', 'Banner Photo', '', ''),
(1008, 'meta', 'Meta', '', ''),
(1009, 'keyword', 'Keyword', '', ''),
(1010, 'applicable_user', 'Applicable User', '', ''),
(1011, 'page_layout', 'Page Layout', '', ''),
(1012, 'background', 'Background', '', ''),
(1013, 'image', 'Image', '', ''),
(1014, 'width', 'Width', '', ''),
(1015, 'height', 'Height', '', ''),
(1016, 'signature', 'Signature', '', ''),
(1017, 'website', 'Website', '', ''),
(1018, 'cms', 'Cms', '', ''),
(1019, 'url_alias', 'Url Alias', '', ''),
(1020, 'cms_frontend', 'Cms Frontend', '', ''),
(1021, 'enabled', 'Enabled', '', ''),
(1022, 'receive_email_to', 'Receive Email To', '', ''),
(1023, 'captcha_status', 'Captcha Status', '', ''),
(1024, 'recaptcha_site_key', 'Recaptcha Site Key', '', ''),
(1025, 'recaptcha_secret_key', 'Recaptcha Secret Key', '', ''),
(1026, 'working_hours', 'Working Hours', '', ''),
(1027, 'fav_icon', 'Fav Icon', '', ''),
(1028, 'theme', 'Theme', '', ''),
(1029, 'fax', 'Fax', '', ''),
(1030, 'footer_about_text', 'Footer About Text', '', ''),
(1031, 'copyright_text', 'Copyright Text', '', ''),
(1032, 'facebook_url', 'Facebook Url', '', ''),
(1033, 'twitter_url', 'Twitter Url', '', ''),
(1034, 'youtube_url', 'Youtube Url', '', ''),
(1035, 'google_plus', 'Google Plus', '', ''),
(1036, 'linkedin_url', 'Linkedin Url', '', ''),
(1037, 'pinterest_url', 'Pinterest Url', '', ''),
(1038, 'instagram_url', 'Instagram Url', '', ''),
(1039, 'play', 'Play', '', ''),
(1040, 'video', 'Video', '', ''),
(1041, 'usename', 'Usename', '', ''),
(1042, 'experience_details', 'Experience Details', '', ''),
(1043, 'total_experience', 'Total Experience', '', ''),
(1044, 'class_schedule', 'Class Schedule', '', ''),
(1045, 'cms_default_branch', 'Cms Default Branch', '', ''),
(1046, 'website_page', 'Website Page', '', ''),
(1047, 'welcome', 'Welcome', '', ''),
(1048, 'services', 'Services', '', ''),
(1049, 'call_to_action_section', 'Call To Action Section', '', 'Action sur filière'),
(1050, 'subtitle', 'Subtitle', '', ''),
(1051, 'cta', 'Cta', '', ''),
(1052, 'button_text', 'Button Text', '', ''),
(1053, 'button_url', 'Button Url', '', ''),
(1054, '_title', ' Title', '', ''),
(1055, 'contact', 'Contact', '', ''),
(1056, 'box_title', 'Box Title', '', ''),
(1057, 'box_description', 'Box Description', '', ''),
(1058, 'box_photo', 'Box Photo', '', ''),
(1059, 'form_title', 'Form Title', '', ''),
(1060, 'submit_button_text', 'Submit Button Text', '', ''),
(1061, 'map_iframe', 'Map Iframe', '', ''),
(1062, 'email_subject', 'Email Subject', '', ''),
(1063, 'prefix', 'Prefix', '', ''),
(1064, 'surname', 'Surname', '', ''),
(1065, 'rank', 'Rank', '', ''),
(1066, 'submit', 'Submit', '', 'Enregistrer '),
(1067, 'certificate_name', 'Certificate Name', '', ''),
(1068, 'layout_width', 'Layout Width', '', ''),
(1069, 'layout_height', 'Layout Height', '', ''),
(1070, 'expiry_date', 'Expiry Date', '', ''),
(1071, 'position', 'Position', '', ''),
(1072, 'target_new_window', 'Target New Window', '', ''),
(1073, 'external_url', 'External Url', '', ''),
(1074, 'external_link', 'External Link', '', ''),
(1075, 'sms_notification', 'Sms Notification', '', ''),
(1076, 'scheduled_at', 'Scheduled At', '', ''),
(1077, 'published', 'Published', '', ''),
(1078, 'unpublished_on_website', 'Unpublished On Website', '', ''),
(1079, 'published_on_website', 'Published On Website', '', ''),
(1080, 'no_selection_available', 'No Selection Available', '', ''),
(1081, 'select_for_everyone', 'Select For Everyone', '', ''),
(1082, 'teacher_restricted', 'Teacher Restricted', '', ''),
(1083, 'guardian_relation', 'Guardian Relation', '', ''),
(1084, 'username_prefix', 'Username Prefix', '', ''),
(1085, 'default_password', 'Default Password', '', ''),
(1086, 'parents_profile', 'Parents Profile', '', ''),
(1087, 'childs', 'Childs', '', ''),
(1088, 'page_title', 'Page Title', '', ''),
(1089, 'select_menu', 'Select Menu', '', 'Sélectionnez'),
(1090, 'meta_keyword', 'Meta Keyword', '', ''),
(1091, 'meta_description', 'Meta Description', '', ''),
(1092, 'evaluation_date', 'Evaluation Date', '', ''),
(1093, 'evaluated_by', 'Evaluated By', '', ''),
(1094, 'complete', 'Complete', '', ''),
(1095, 'incomplete', 'Incomplete', '', ''),
(1096, 'payment_details', 'Payment Details', '', ''),
(1097, 'edit_attachments', 'Edit Attachments', '', ''),
(1098, 'live_classes', 'Live Classes', '', ''),
(1099, 'duration', 'Duration', '', ''),
(1100, 'metting_id', 'Metting Id', '', ''),
(1101, 'set_record', 'Set Record', '', ''),
(1102, 'set_mute_on_start', 'Set Mute On Start', '', ''),
(1103, 'button_text_1', 'Button Text 1', '', ''),
(1104, 'button_url_1', 'Button Url 1', '', ''),
(1105, 'button_text_2', 'Button Text 2', '', ''),
(1106, 'button_url_2', 'Button Url 2', '', ''),
(1107, 'left', 'Left', '', ''),
(1108, 'center', 'Center', '', ''),
(1109, 'right', 'Right', '', ''),
(1110, 'about', 'About', '', ''),
(1111, 'about_photo', 'About Photo', '', ''),
(1112, 'parallax_photo', 'Parallax Photo', '', ''),
(1113, 'decline', 'Decline', '', ''),
(1114, 'edit_grade', 'Edit Grade', '', ''),
(1115, 'mark', 'Mark', '', ''),
(1116, 'hall_room', 'Hall Room', '', ''),
(1117, 'student_promotion', 'Student Promotion', '', ''),
(1118, 'username_has_already_been_used', 'Username Has Already Been Used', '', ''),
(1119, 'fee_collection', 'Fee Collection', '', ''),
(1120, 'not_found_anything', 'Not Found Anything', '', ''),
(1121, 'preloader_backend', 'Preloader Backend', '', ''),
(1122, 'ive_class_method', 'Ive Class Method', '', ''),
(1123, 'live_class_method', 'Live Class Method', '', ''),
(1124, 'api_credential', 'Api Credential', '', ''),
(1125, 'translation_update', 'Translation Update', '', ''),
(1126, ' live_class_reports', ' Live Class Reports', '', ''),
(1127, 'live_class_reports', 'Live Class Reports', '', ''),
(1128, 'all', 'All', '', ''),
(1129, 'student_participation_report', 'Student Participation Report', '', ''),
(1130, 'joining_time', 'Joining Time', '', ''),
(1131, 'gallery', 'Gallery', '', ''),
(1132, 'parent_menu', 'Parent Menu', '', ''),
(1133, 'statistics', 'Statistics', '', ''),
(1134, 'employees', 'Employees', '', ''),
(1135, 'classes', 'Classes', '', ''),
(1136, 'edit_branch', 'Edit Branch', '', ''),
(1137, 'show_website', 'Show Website', '', ''),
(1138, 'create_section', 'Create Section', '', 'Créer une nouvelle filière'),
(1139, 'section_list', 'Section List', '', 'List des filières'),
(1140, 'declined', 'Declined', '', ''),
(1141, 'thumb_image', 'Thumb Image', '', ''),
(1142, 'uploaded', 'Uploaded', '', ''),
(1143, 'terms_conditions', 'Terms Conditions', '', ''),
(1144, 'online_addmission', 'Online Addmission', '', ''),
(1145, 'fee', 'Fee', '', ''),
(1146, 'free', 'Free', '', ''),
(1147, 'pay', 'Pay', '', ''),
(1148, 'no_sms_gateway_available', 'No Sms Gateway Available', '', ''),
(1149, 'belongs_to', 'Belongs To', '', ''),
(1150, 'bs_column', 'Bs Column', '', ''),
(1151, 'field_order', 'Field Order', '', ''),
(1152, 'certificates', 'Certificates', '', ''),
(1153, 'language_unpublished', 'Language Unpublished', '', ''),
(1154, 'edit_section', 'Edit Section', '', ''),
(1155, 'default_template', 'Default Template', '', ''),
(1156, 'change', 'Change', '', ''),
(1157, 'current_password_is_invalid', 'Current Password Is Invalid', '', ''),
(1158, 'password_has_been_changed', 'Password Has Been Changed', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `language_list`
--

DROP TABLE IF EXISTS `language_list`;
CREATE TABLE IF NOT EXISTS `language_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(600) NOT NULL,
  `lang_field` varchar(600) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `language_list`
--

INSERT INTO `language_list` (`id`, `name`, `lang_field`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'english', 1, '2018-11-15 11:36:31', '2020-04-18 20:05:12'),
(3, 'Arabic', 'arabic', 1, '2018-11-15 11:36:31', '2019-01-20 03:04:53'),
(4, 'French', 'french', 1, '2018-11-15 11:36:31', '2021-12-18 19:33:30');

-- --------------------------------------------------------

--
-- Structure de la table `login_credential`
--

DROP TABLE IF EXISTS `login_credential`;
CREATE TABLE IF NOT EXISTS `login_credential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1(active) 0(deactivate)',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `login_credential`
--

INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'superadmin@ramom.com', '$2y$10$thJe5tQhq0USn6mKcJvDVuHA/bBFQlaIrdkfwtLuvRAZDGq80EMxG', 1, 1, '2021-05-25 02:33:50', '2021-05-25 13:33:28', NULL),
(2, 2, 'faissal.elfid@gmail.com', '$2y$10$jVXTSU3ds83opCul3elgOeP1PdsfNH1s/SagahBxCjpkyBeWh7Uj6', 1, 1, '2022-02-03 11:47:06', '2021-11-04 18:42:34', NULL),
(10, 4, 'faissal', '$2y$10$G/YUVvGvVRqN1mcSuwrshez3LhXtDBSq5oUAoE.HW48t0xjK/e7JK', 3, 1, '2021-12-21 10:02:09', '2021-12-17 19:24:44', NULL),
(12, 3, 'omar', '$2y$10$MeKY/oIsuIqRJg4UHabS4eWEfWT/JVzMOx8i666KLnRw5VoDTJts6', 3, 0, '2021-12-18 13:58:56', '2021-12-18 12:09:40', NULL),
(14, 5, 'amadou', '$2y$10$CI3.Igg77DvWdKE7mfDIb.V98Ya/hsMoxjAMRXm2XQbUzhq6kY1gm', 3, 1, NULL, '2021-12-18 17:44:37', NULL),
(15, 6, 'nawfal', '$2y$10$qD69D4zLTqJCZCXsGjO.AeFt7fP5WUtU2Fa1BnlYb51sLseHNlA5.', 3, 1, '2021-12-18 19:44:52', '2021-12-18 18:41:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(405);

-- --------------------------------------------------------

--
-- Structure de la table `online_admission`
--

DROP TABLE IF EXISTS `online_admission`;
CREATE TABLE IF NOT EXISTS `online_admission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `birthday` date NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '1',
  `branch_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `apply_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `online_admission`
--

INSERT INTO `online_admission` (`id`, `first_name`, `last_name`, `gender`, `birthday`, `mobile_no`, `email`, `address`, `status`, `branch_id`, `class_id`, `section_id`, `apply_date`, `created_date`) VALUES
(2, 'Faissal', 'FID', 'male', '1999-11-16', '0682484660', 'faissal.elfid@gmail.com', 'AV HASSAN 2 IMM 9 NAKHIL APT N 10 TAZA', 2, 1, 2, 10, '2021-11-09 20:35:41', '2021-12-14 10:58:50'),
(3, 'Fadoua', 'FIGGUA', 'female', '2021-12-06', '0682484887', 'fadoua@gmail.com', 'Rabat, agdal', 1, 1, 1, 2, '2021-12-18 15:30:34', '2021-12-18 14:30:34'),
(15, 'Imane', 'KILOMI', 'male', '2021-12-07', '0682484660', 'imane@gmail.com', 'Fes, Atlas', 2, 1, 2, 10, '2021-12-18 18:06:04', '2021-12-21 10:33:58'),
(16, 'Samira', 'Hajji', 'female', '2021-12-08', '0682484660', 'samira@gmail.com', 'meknes, kiraouane', 2, 1, 2, 10, '2021-12-18 18:07:20', '2021-12-18 17:07:27');

-- --------------------------------------------------------

--
-- Structure de la table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `show_view` tinyint(1) DEFAULT '1',
  `show_add` tinyint(1) DEFAULT '1',
  `show_edit` tinyint(1) DEFAULT '1',
  `show_delete` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `permission`
--

INSERT INTO `permission` (`id`, `module_id`, `name`, `prefix`, `show_view`, `show_add`, `show_edit`, `show_delete`, `created_at`) VALUES
(1, 2, 'Student', 'student', 1, 1, 1, 1, '2020-01-22 11:45:47'),
(2, 2, 'Multiple Import', 'multiple_import', 0, 1, 0, 0, '2020-01-22 11:45:47'),
(3, 2, 'Student Category', 'student_category', 1, 1, 1, 1, '2020-01-22 11:45:47'),
(4, 2, 'Student Id Card', 'student_id_card', 1, 0, 0, 0, '2020-01-22 11:45:47'),
(5, 2, 'Disable Authentication', 'student_disable_authentication', 1, 1, 0, 0, '2020-01-22 11:45:47'),
(6, 4, 'Employee', 'employee', 1, 1, 1, 1, '2020-01-22 11:55:19'),
(9, 4, 'Department', 'department', 1, 1, 1, 1, '2020-01-22 17:41:39'),
(10, 4, 'Designation', 'designation', 1, 1, 1, 1, '2020-01-22 17:41:39'),
(11, 4, 'Disable Authentication', 'employee_disable_authentication', 1, 1, 0, 0, '2020-01-22 17:41:39'),
(12, 5, 'Salary Template', 'salary_template', 1, 1, 1, 1, '2020-01-23 05:13:57'),
(13, 5, 'Salary Assign', 'salary_assign', 1, 1, 0, 0, '2020-01-23 05:14:05'),
(14, 5, 'Salary Payment', 'salary_payment', 1, 1, 0, 0, '2020-01-24 06:45:40'),
(15, 5, 'Salary Summary Report', 'salary_summary_report', 1, 0, 0, 0, '2020-03-14 17:09:17'),
(16, 5, 'Advance Salary', 'advance_salary', 1, 1, 1, 1, '2020-01-28 18:23:39'),
(17, 5, 'Advance Salary Manage', 'advance_salary_manage', 1, 1, 1, 1, '2020-01-25 04:57:12'),
(18, 5, 'Advance Salary Request', 'advance_salary_request', 1, 1, 0, 1, '2020-01-28 17:49:58'),
(19, 5, 'Leave Category', 'leave_category', 1, 1, 1, 1, '2020-01-29 02:46:23'),
(20, 5, 'Leave Request', 'leave_request', 1, 1, 1, 1, '2020-01-30 12:06:33'),
(21, 5, 'Leave Manage', 'leave_manage', 1, 1, 1, 1, '2020-01-29 07:27:15'),
(22, 5, 'Award', 'award', 1, 1, 1, 1, '2020-01-31 18:49:11'),
(23, 6, 'Classes', 'classes', 1, 1, 1, 1, '2020-02-01 18:10:00'),
(24, 6, 'Section', 'section', 1, 1, 1, 1, '2020-02-01 21:06:44'),
(25, 6, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2020-02-02 07:09:22'),
(26, 6, 'Subject', 'subject', 1, 1, 1, 1, '2020-02-03 04:32:39'),
(27, 6, 'Subject Class Assign ', 'subject_class_assign', 1, 1, 1, 1, '2020-02-03 17:43:19'),
(28, 6, 'Subject Teacher Assign', 'subject_teacher_assign', 1, 1, 0, 1, '2020-02-03 19:05:11'),
(29, 6, 'Class Timetable', 'class_timetable', 1, 1, 1, 1, '2020-02-04 05:50:37'),
(30, 2, 'Student Promotion', 'student_promotion', 1, 1, 0, 0, '2020-02-05 18:20:30'),
(31, 8, 'Attachments', 'attachments', 1, 1, 1, 1, '2020-02-06 17:59:43'),
(33, 8, 'Attachment Type', 'attachment_type', 1, 1, 1, 1, '2020-02-07 07:16:28'),
(49, 12, 'Student Attendance', 'student_attendance', 0, 1, 0, 0, '2020-02-13 05:25:53'),
(50, 12, 'Employee Attendance', 'employee_attendance', 0, 1, 0, 0, '2020-02-13 10:04:16'),
(51, 12, 'Exam Attendance', 'exam_attendance', 0, 1, 0, 0, '2020-02-13 11:08:14'),
(52, 12, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2020-02-13 19:20:56'),
(53, 12, 'Employee Attendance Report', 'employee_attendance_report', 1, 0, 0, 0, '2020-02-14 06:08:53'),
(54, 12, 'Exam Attendance Report', 'exam_attendance_report', 1, 0, 0, 0, '2020-02-14 06:21:40'),
(81, 18, 'Global Settings', 'global_settings', 1, 0, 1, 0, '2020-03-22 05:05:41'),
(82, 18, 'Payment Settings', 'payment_settings', 1, 1, 0, 0, '2020-03-22 05:08:57'),
(83, 18, 'Sms Settings', 'sms_settings', 1, 1, 1, 1, '2020-03-22 05:08:57'),
(84, 18, 'Email Settings', 'email_settings', 1, 1, 1, 1, '2020-03-22 05:10:39'),
(85, 18, 'Translations', 'translations', 1, 1, 1, 1, '2020-03-22 05:18:33'),
(86, 18, 'Backup', 'backup', 1, 1, 1, 1, '2020-03-22 07:09:33'),
(87, 18, 'Backup Restore', 'backup_restore', 0, 1, 0, 0, '2020-03-22 07:09:34'),
(90, 18, 'School Settings', 'school_settings', 1, 0, 1, 0, '2020-03-30 17:36:37'),
(91, 1, 'Monthly Income Vs Expense Pie Chart', 'monthly_income_vs_expense_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
(92, 1, 'Annual Student Fees Summary Chart', 'annual_student_fees_summary_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
(93, 1, 'Employee Count Widget', 'employee_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(94, 1, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(95, 1, 'Parent Count Widget', 'parent_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(96, 1, 'Teacher Count Widget', 'teacher_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(97, 1, 'Student Quantity Pie Chart', 'student_quantity_pie_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
(98, 1, 'Weekend Attendance Inspection Chart', 'weekend_attendance_inspection_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
(99, 1, 'Admission Count Widget', 'admission_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(100, 1, 'Voucher Count Widget', 'voucher_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(101, 1, 'Transport Count Widget', 'transport_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(102, 1, 'Hostel Count Widget', 'hostel_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(103, 18, 'Accounting Links', 'accounting_links', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(105, 18, 'Cron Job', 'cron_job', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(106, 18, 'Custom Field', 'custom_field', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(107, 5, 'Leave Reports', 'leave_reports', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(108, 18, 'Live Class Config', 'live_class_config', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(118, 22, 'Frontend Setting', 'frontend_setting', 1, 1, 0, 0, '2019-09-11 03:24:07'),
(119, 22, 'Frontend Menu', 'frontend_menu', 1, 1, 1, 1, '2019-09-11 04:03:39'),
(120, 22, 'Frontend Section', 'frontend_section', 1, 1, 0, 0, '2019-09-11 04:26:11'),
(121, 22, 'Manage Page', 'manage_page', 1, 1, 1, 1, '2019-09-11 05:54:08'),
(122, 22, 'Frontend Slider', 'frontend_slider', 1, 1, 1, 1, '2019-09-11 06:12:31'),
(123, 22, 'Frontend Features', 'frontend_features', 1, 1, 1, 1, '2019-09-11 06:47:51'),
(124, 22, 'Frontend Testimonial', 'frontend_testimonial', 1, 1, 1, 1, '2019-09-11 06:54:30'),
(125, 22, 'Frontend Services', 'frontend_services', 1, 1, 1, 1, '2019-09-11 07:01:44'),
(126, 22, 'Frontend Faq', 'frontend_faq', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(127, 2, 'Online Admission', 'online_admission', 1, 1, 0, 1, '2019-09-11 07:06:16'),
(128, 18, 'System Update', 'system_update', 0, 1, 0, 0, '2019-09-11 07:06:16'),
(131, 22, 'Frontend Gallery', 'frontend_gallery', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(132, 22, 'Frontend Gallery Category', 'frontend_gallery_category', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(133, 6, 'Teacher Timetable', 'teacher_timetable', 1, 0, 0, 0, '2019-09-11 07:06:16');

-- --------------------------------------------------------

--
-- Structure de la table `permission_modules`
--

DROP TABLE IF EXISTS `permission_modules`;
CREATE TABLE IF NOT EXISTS `permission_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `sorted` tinyint(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `prefix`, `system`, `sorted`, `created_at`) VALUES
(1, 'Dashboard', 'dashboard', 1, 1, '2019-05-26 22:23:00'),
(2, 'Student', 'student', 1, 3, '2019-05-26 22:23:00'),
(4, 'Employee', 'employee', 1, 5, '2019-05-26 22:23:00'),
(5, 'Human Resource', 'human_resource', 1, 8, '2019-05-26 22:23:00'),
(6, 'Academic', 'academic', 1, 9, '2019-05-26 22:23:00'),
(8, 'Attachments Book', 'attachments_book', 1, 11, '2019-05-26 22:23:00'),
(12, 'Attendance', 'attendance', 1, 16, '2019-05-26 22:23:00'),
(18, 'Settings', 'settings', 1, 22, '2019-05-26 22:23:00'),
(22, 'Website', 'website', 1, 2, '2019-05-26 22:23:00');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE IF NOT EXISTS `reset_password` (
  `key` longtext NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_credential_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reset_password`
--

INSERT INTO `reset_password` (`key`, `username`, `login_credential_id`, `created_at`) VALUES
('f6e5e7a2ac35efc6cc6f6e66fb440604c48fc64cbbfd9162bc155d3f28e5f6a0bb8219458b29682822854397d16d0a4ff309b1bdda7a33e77738f77d25bcef94', 'faissal.elfid@gmail.com', '2', '2021-11-07 12:58:33');

-- --------------------------------------------------------

--
-- Structure de la table `rm_sessions`
--

DROP TABLE IF EXISTS `rm_sessions`;
CREATE TABLE IF NOT EXISTS `rm_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rm_sessions`
--

INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('039u71vd0643tkia25c937rd4uu116tu', '::1', 1639777820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737373638313b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a323a223130223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('046k6n30i851inlspqn55q16tm0so76b', '::1', 1639474331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437343333313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('068f34e72b0bc8cca827ba221c873431d2ccb6af', '196.200.176.254', 1638434951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433343935313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0c0g16dh6rq9bg03ud0cqhqdiqsst991', '::1', 1639834002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833343030323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('0elv29ibobnb7b4ldb8fkjik9qdhv2d8', '::1', 1639835397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833353339373b),
('0kgu31fva8k1q1t291i40ibgk4sjp07j', '::1', 1639827798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832373739383b6e616d657c733a383a22416264656c617469223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2230223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0la1ctm9ggg2icdfpoei2v4n6oei7g60', '::1', 1639832266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833323236363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1578nmfu4ep6a3voniiq5hvseea6ldg2', '::1', 1638876186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837363131333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('17oac9jqids5hb4crqu7f6ondn437vqf', '::1', 1639836265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833363236353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34303a2253617576656761726465206465206261736520646520646f6e6ec3a96573207465726d696ec3a965223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('19dc593c9fc466c504c273115dce5e7f5716401a', '102.78.1.70', 1638434645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433343634353b),
('1ketds9fkg638duu6nhk9t78cashe454', '::1', 1639766493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736363439333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1pjo9802icepc9g70ubh55ktsnll5pbh', '::1', 1639778770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737383438333b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f656d706c6f7965652f616464223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1q8g2lcnk0004pr4j6t60k9156qnq820', '::1', 1639849125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834393132353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1tgvmskk6vv5a5b8ubheo4cgqcpsb4r3', '::1', 1638451634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383435313633343b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('20s297nle5sdon2sm8a88skavuj2p4i5', '::1', 1642174283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634323137343238333b),
('2fbloi1bapp8ljg986l4gh459hk06nq9', '::1', 1638443195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434333139303b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2n2o3q87tnq2uevd8ds7ksjjjt481igg', '::1', 1638436938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433363933383b),
('2oh5cnpg25uuv7i8fejdm4kveo7t7kht', '::1', 1639856697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835363639373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2234223b6c6f67676564696e7c623a313b),
('2qa771nl3mcadreteg7m66i5ftiarnsp', '::1', 1639765407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736353430373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('321buo1tt1it4kdlqkm9n29gpfa8t7ij', '::1', 1638870816, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837303831363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('36kev4fr5r2s12rnvrt4vl9piapchsbv', '::1', 1639770375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737303337353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('39aj19a7gi5voccdh13qpp82o6bsbka1', '::1', 1638442832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434323833323b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('39bfb1mqi72i9knud0t9p3lc2hc4relp', '::1', 1639834560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833343536303b6e616d657c733a343a224f6d6172223b6c6f676765725f70686f746f7c733a33363a2262666636363463363132613761326336643437343966663263366361616530612e6a7067223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a313a2232223b6c6f67676564696e5f69647c733a323a223132223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('3abru71p6sjplhqdo39fia4oskjd0ajc', '::1', 1639826639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832363633393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a323a223130223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('3jr8o08sfb37jcsrd588sh8jfp4nocdp', '::1', 1639479300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437393330303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('3np2ns976oa53jebh511fevstfu8drco', '::1', 1639827185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832373138353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('40ubj9sumn42npk3o19kgemvog13n9hu', '::1', 1639857696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835373639363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2234223b6c6f67676564696e7c623a313b),
('431df698eec7577779a0943bfd627c73f745aae6', '196.200.176.254', 1638435886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433353838363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('47p1epb87n70093go6cvkf5c7gkg17m1', '::1', 1638874752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837343735323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('483b7k929tf82jkg9cufq2g58300pq1j', '::1', 1639835042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833353034323b),
('4hohqg1ojm2su78d6d87lu8ujq0qpqp8', '::1', 1639855891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835353839313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('4r5qbpv3jic2gi0jcbnoafmd61lph92b', '::1', 1639847087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834373038373b),
('4s0m226g7rksrm15r7b8ebtv1gv7dpq8', '::1', 1640084243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634303038343234333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('55ch2r4tnnrfasf5unlhbra1l1gbtuun', '::1', 1639153977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135333937373b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('57qm0tav47vucan5ojfvv9cs6p039t1k', '::1', 1639776980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737363938303b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f656d706c6f7965652f616464223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('5a564o4fi63utt8r9clbf611a7l21jcc', '::1', 1639164913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136343931333b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('5g3bra699om3vp7me972ds469v620knl', '::1', 1643885091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838353039313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('5lmo698onnrjr7mao86nk53a75jklo34', '::1', 1639836229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833363232393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('69if3lrt3d3cupkbh7ferfdrr29d7p6m', '::1', 1639168807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136383830373b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('6bg7b79hqeeif15ed937o60mbdntkkck', '::1', 1639852089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835323038393b),
('6ft9q3h0sqpdqrj7vebjdm8mquk79rut', '::1', 1639852318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835323331383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('6ikagqj3agms6go9k25hgu4hmn90f5b8', '::1', 1639777329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737373332393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a323a223130223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('6pg9s6jik1jt7fle0bvbt4fma8phfbnq', '::1', 1638437250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433373235303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('700anku8hn6ph31ghrf7d8rnn6v0ebce', '::1', 1639851348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835313334383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('707n85k1dm4mtp25j19lnolqt55hhi7m', '::1', 1639169348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136393334383b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('729avumdic0tjqdt232and87fd490aan', '::1', 1639850957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835303935373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('731oks9j131hibskber2iqsu491o3qs5', '::1', 1639778483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737383438333b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f656d706c6f7965652f616464223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('73oq4alltne5k61sct8r3cnsoi5ngabs', '::1', 1639833004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833333030343b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('773jl23ikr2qgt4rnrh51k4sf70j5hkq', '::1', 1639831949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833313934393b6e616d657c4e3b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c4e3b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a323a223130223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7n0v7eqp2au8fmbjfvmqclmughkjao23', '::1', 1639832223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833323232333b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7oehllj1gc9gtfa6bkc35cdcj5538eic', '::1', 1639770047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737303034373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7q8rqdjk4fl6vnau93c38ossnmrkttmt', '::1', 1639162404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136323430343b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('803fl9ivfkhj9gueet20s3iib4qdb6fr', '::1', 1639775582, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737353538323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8aujo6v37r82blrjl8nf5sb8i665q7pj', '::1', 1639160976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136303937363b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8bgp30vl60vbp1ug4mb03cdeqsiipd70', '::1', 1639139152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393133393135323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b),
('8f84b9bda00712a73bb0e1d97417ea15a99870df', '2.58.29.25', 1638435174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433353137323b),
('8hb9t969soud8l22ot626034rivt0cjj', '::1', 1639471779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437313737393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8nq617t5m085pm6dqbj6qeaqmq6khphn', '::1', 1639849890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834393839303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8ro31aqmbt3mmm676kj77s2jrjsan3uj', '::1', 1638443862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434333836323b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('94tkcihmv1qh2frr3oh5f61s4msksiav', '::1', 1639148802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393134383830323b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('96omnnpo2hs418ilprcnr7sdc722ktfc', '::1', 1638440751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434303735313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9c2qttf6nv5pct2752v75ei11jtdfood', '::1', 1639479635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437393633353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9c47jnfl7g85lgd9q6la39oqht01ak15', '::1', 1639831562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833313536323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9gvgmgnr3l7sa4sr01mgq1bfpcps0oh9', '::1', 1639776250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737363235303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9ot9c2ltiba704dsgmk0g5309qqujl7h', '::1', 1639834481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833343438313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('a3juqhi019c3uhcjre9bhoa9cidf32h4', '::1', 1643885887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838353838373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('a4idbjdjukp0n2pt7onh71dt82d4f187', '::1', 1639152154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135323135343b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('a63j7ghm74vje1iv2oe6uk2lkh99d8e0', '::1', 1639768036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736383033363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('aa9d68a2d00b55473eee107ad4eeddd30b10640b', '196.200.176.254', 1638435886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433353838363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('ajqcrb4o848s5fmnhto5ce9phk9r60lu', '::1', 1639162770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136323737303b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ak6j8ed1c7k2n2jfpc4nmt4ts8omm65i', '::1', 1640082620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634303038323632303b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('aogirj6fvqbn2h8qcd9vie7lgf2kp9no', '::1', 1639850317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835303331373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('asn327hjuukst6djop20u0gfe7vavcgp', '::1', 1638442477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434323437373b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('aumhpp80p24qlc7oc5j7o5hv7e42qihs', '::1', 1639156620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135363632303b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('b0b5f0a222225e354b86ab817dfb04ce02312b3c', '196.200.176.254', 1638435269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433353236393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('b2etm479a340fr1hm55fbusroi6ugo7b', '::1', 1639857393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835373339333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2234223b6c6f67676564696e7c623a313b),
('b46k2rd4c4antopl6cg3425cva0nfi99', '::1', 1638443549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434333534393b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('b70hdvre2cqghs4nqditip1o4toc6uaa', '::1', 1639475740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437353734303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('bnfhqn5uflk3hgu4kerpkld9qb3koqp2', '::1', 1639473391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437333339313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('bt37o9duq3uus7jhdvttso6ue0mfd5r3', '::1', 1639835913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833353931333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('bvj2t70lkjl2v2d0pk8383u7b9t63i49', '::1', 1639150806, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135303830363b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c8j060vmnv5g6imd40l3vbbrfgbrb7a2', '::1', 1638869611, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383836393631313b),
('c929ta434gv8khevflo362t6oasakjul', '::1', 1639834235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833343233353b6e616d657c733a343a224f6d6172223b6c6f676765725f70686f746f7c733a33363a2262666636363463363132613761326336643437343966663263366361616530612e6a7067223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a313a2232223b6c6f67676564696e5f69647c733a323a223132223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c9fm90nv70qh91e3dh5v0hsd7a9sefth', '::1', 1639764666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736343636363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ca3lokh5ljtg43ok10gvmp991h5i7n1e', '::1', 1639768748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736383734383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('carurkn2ric9q4d81924t7l0q7f6ddgd', '::1', 1639828644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832383634343b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cavqrvbl2qltn3e0t6i0u23e0bv29ckt', '::1', 1640084243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634303038343234333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cgvjbkuie2fa5qbidmnl00o3vdhraa7f', '::1', 1639842580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834323538303b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('cjmj98jmoiiltl0fqaoqk9jlqt1i5a2k', '::1', 1639765069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736353036393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cnv80tdg7r7bfditlfvm2hc07hl6p792', '::1', 1639845235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834353233353b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d244v7ah59b0ielv52ktj4bhe813arnu', '::1', 1639150451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135303435313b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d4ebe97534edc98f36282f2b5de5760b1cdce4bd', '196.200.176.254', 1638434267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433343236373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d6c5d3dsm651br7jb4rdpp15qleicttl', '::1', 1639852715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835323731353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d6g2kf0f1n8g6glm4r7t6l1p4ss5ku9m', '::1', 1638876113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837363131333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d7q6paicu0m807v392a7mlsu07ncd6dp', '::1', 1639833888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833333838383b6e616d657c733a343a224f6d6172223b6c6f676765725f70686f746f7c733a33363a2262666636363463363132613761326336643437343966663263366361616530612e6a7067223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a313a2232223b6c6f67676564696e5f69647c733a323a223132223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('dpkcjukfjjmp04rrph0onue9a7c0cdn8', '::1', 1639836757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833363735373b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('e68nub216p0f19qva1ar1bsc7s22gjk3', '::1', 1639827497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832373439373b6e616d657c733a383a22416264656c617469223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2230223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('eehpqhljs363nga7q5imflhmrptoo64d', '::1', 1639829789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832393738393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('efa1ljhbkaiiuspu5rsesa7rnti5lm8i', '::1', 1639473999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437333939393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ejn0iouvmeji1jnqrgm4csqncr3694rk', '::1', 1638875120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837353132303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ekc9ii0l4rp5esgtgoe0i0ciacttp66j', '::1', 1639828500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832383530303b6e616d657c733a383a22416264656c617469223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2230223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('em8bhk6d6utf2mh69bbd5417f1qfkjdb', '::1', 1639847178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834373137383b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('f80jrut914erlnh446rbbu4rdumpc0ti', '::1', 1639472605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437323630353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('f9b3jrlb2j9okmrq5nq4hrgvuum08p9d', '::1', 1643884679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838343637393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fa1m8jqb23o1g5k9r954ojq9qr5hntkr', '::1', 1639149444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393134393434343b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('fg60t6lb8gltar26chkrhctecuisvf3s', '::1', 1639832573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833323537333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fgf35eiv1qkodt9ao65dom5so1b3ch47', '::1', 1639161303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136313330333b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fhs90nuotnbe1sjgdlj0omitbg4r6heb', '::1', 1639775105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737353130353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fp4i947i1papjamdhuup6dgck5c2p8cb', '::1', 1639828127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832383132373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('g2kjli60uuuqr563ck30pvc56plsrss8', '::1', 1639835706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833353730363b),
('g44gfmkq0klfn3jr396hpphs5obaim7o', '::1', 1639478518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437383531383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('g99hurttrk4tc850rnmrlbsn5gmh2ar7', '::1', 1639473029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437333032393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gg7thtq9rgnrpndv667rcq6nbn5k0b3m', '::1', 1642173849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634323137333834393b),
('gjgnt357deae68dum9rg1u222ok5kkbq', '::1', 1643886406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838363231393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gorqrk53rgaigb7fdi8rqp54377algjb', '::1', 1639138519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393133383531393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b),
('gqc1itn83kosdgllvsekcm857h158id6', '::1', 1638869916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383836393931363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('h5cke0g05dknprrrk445and3ch6v4kdv', '::1', 1639156928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135363932383b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('h7ct4mrig7aqt5q07kvtvbqncls3ruvs', '192.168.43.181', 1639477669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437373636383b),
('hddnmd59ej7h9gof6j91oiqfg0k69qpg', '::1', 1639152594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135323539343b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('hf9a02k9svvlj8n40en014uhmr6099r5', '::1', 1643885572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838353537323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('hun3fvd42dp8h4qeg3gdbrtjt286onhu', '::1', 1639837779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833373737393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('i07grsl1g2kkndob5von55eo3bmuh91k', '::1', 1639844066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834343036363b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b737563636573737c733a38363a225468616e6b20796f7520666f72207375626d697474696e6720746865206f6e6c696e6520726567697374726174696f6e20666f726d2e20506c6561736520796f752063616e207072696e74207468697320636f70792e223b5f5f63695f766172737c613a323a7b733a373a2273756363657373223b733a333a226f6c64223b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b),
('i35n7djop7pk3pu0aroqbr7upvn0uuj5', '::1', 1638451634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383435313633343b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('i373jj6mnkqveks5hcusapketuju38dk', '::1', 1639856194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835363139343b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('i4ujciu2snf43iiu6ffp0v112onmu41r', '::1', 1639848298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834383239383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('iae1frrucvobl2nqbakin0knm5eqc6ep', '::1', 1639164181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136343138313b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('iaqolrhru4co3vrkins0qoupje8vfeb2', '::1', 1639851945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835313934353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('itp4h22j7e5cqqel9nkdv2qg2lo4c2c5', '::1', 1639140238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393134303233383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('j630bruei5iv70fupi2sbskm2pfjc7j6', '::1', 1639474996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437343939363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('j6n76g8b29rpi2fs9pjjvntngf3b4h9t', '::1', 1638441391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434313339313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('jhcqnbi6vpjmvqdlurha4au4ncq5udp4', '::1', 1642174390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634323137343238333b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('jja63vnvcp1fnhhgnrofa73lna350nbb', '::1', 1639163585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136333538353b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('jr6vu9aplvlugkmk3s62hg396hpmdq9e', '::1', 1639151848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135313834383b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('jts793c66p6qekn36ui7rtf3164n8i4e', '::1', 1642173209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634323137333230393b),
('jvomi5l628bof1bkapnqsbutoe8o257o', '::1', 1639847990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834373939303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('k70bn2a1pske8c57m76b8lmtlhvlllah', '::1', 1639836289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833363236353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('kcg8s2phdemuc2m3jtmkd199ho0aa5a9', '::1', 1639155728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135353732383b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ke879247g8i0v3kj3vucmquuutpl8d5h', '::1', 1643886219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838363231393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('khpphb0ueetbh0iljn3onhhataq9888d', '::1', 1639768445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736383434353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('kmlcoum8q0f4uon4sji7jh45apr0man4', '::1', 1639139923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393133393932333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b),
('knp73l0reinn7ve3uk0bkmk7mksa9bvq', '::1', 1639149775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393134393737353b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('knpvo8krif9dccrge0fjcqmvvnip81l8', '::1', 1639161739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136313733393b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('kscuovo6te92u2dmpvhicoapghbjbkie', '::1', 1639479875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437393633353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ksfd6ik7d5m63gemv6ljjpao1ov7ol0g', '::1', 1639829854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832393835343b6e616d657c733a383a22416264656c617469223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2230223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('l2p8pqtup51oie049amdsdjfrkcoj43d', '::1', 1638437902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433373930323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('l6ap21ulnh27gsr253etolbbit3iu5ie', '::1', 1639767648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736373634383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('le6st2nu5jpdcnme3dgklfl1ipeql0it', '::1', 1639769746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736393734363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lfapbrm79dk47kfbc1p4b63dfi2omdi1', '::1', 1639473694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437333639343b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lg7rkd546mre18m1vqcf3djvrags76br', '::1', 1638444736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434343733363b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lgucj6i0u7rqftm0pi9g7ub7b3b3g8jk', '::1', 1638875432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837353433323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lprgnqfqckbcongp5l0bjc28qm9sf0fj', '::1', 1639472236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437323233363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lqbtp3ar4od9piu2ij7mn4oe3bfp3c6q', '::1', 1639167929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136373932393b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lqfghekupkulh6tu599fg2ifctln3qk6', '::1', 1639766097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736363039373b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lqq8mru6j0muranhteo920gkn1osp9p3', '::1', 1639776554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737363535343b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('m76cv8hdjl7vrvrd8r1tpa6vf8iuojfs', '::1', 1639857015, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835373031353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2234223b6c6f67676564696e7c623a313b),
('mai360pcs20bp9ohputqhv3823paur0k', '::1', 1641459657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634313435393635363b),
('mhe381vp4bia30tkkco86fo21r3vdmug', '::1', 1639846399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834363339393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('mhen8pfdqd4grc04qthfr5qn2ou64e86', '::1', 1639829538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832393533383b6e616d657c733a383a22416264656c617469223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2230223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('mja2gl31e9s31ccdlduaun910s5hb815', '::1', 1639847683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834373638333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('mlb57b6l4jbbl1up9q0d8ei64ov6m886', '::1', 1639474673, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437343637333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('muf0tpor08foq9u1q915despt6mff3ip', '::1', 1639843610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834333631303b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b737563636573737c733a38363a225468616e6b20796f7520666f72207375626d697474696e6720746865206f6e6c696e6520726567697374726174696f6e20666f726d2e20506c6561736520796f752063616e207072696e74207468697320636f70792e223b5f5f63695f766172737c613a323a7b733a373a2273756363657373223b733a333a226e6577223b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b),
('n9vnm0uepgf2dm1ak1ukgu46uol60mk2', '::1', 1639844787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834343738373b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('nk2sb1cl57ifimojeh2da5vv6p7vfree', '::1', 1639853093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835333037313b6e616d657c733a31353a224e617766616c204573736167686972223b6c6f676765725f70686f746f7c733a33363a2232353264363538376630396636653235616337666264396539383539356338632e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223135223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('nor4l7ns7vrkoj8n6d1jecnj7f094p8u', '::1', 1639842972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834323937323b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('np596dt34idkcjdi4sgelsd4ebef2pb8', '::1', 1639471227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437313232373b),
('obfqbnajm8lbtu7o96dimemidk2of0lm', '::1', 1639169348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136393334383b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('og2sl3c8i8k29ps7qdvmlpjvu21p2r4g', '::1', 1639149136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393134393133363b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('oijmo2sf815skth6vjrqeonat5pms09d', '::1', 1639829380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832393338303b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('opgcicafa1icp3qlotc26hno0s0uhhgv', '::1', 1639846069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834363036393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('oql8bgris0jecismi2dr9edfnrl7lbd2', '::1', 1639845559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834353535393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ors8un8hu1k576ivfkq1kineddij0sdi', '::1', 1639832847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833323834373b6e616d657c733a343a224f6d6172223b6c6f676765725f70686f746f7c733a33363a2262666636363463363132613761326336643437343966663263366361616530612e6a7067223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a313a2232223b6c6f67676564696e5f69647c733a323a223132223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('osgldn79eq6c6e0l4mhea0e57gl6qp0e', '::1', 1638870373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837303337333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('pis6k2ifo1mdrri7e6i1t6sd3o1g947m', '::1', 1639477436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437373433363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('puboe3kjfmk0ihfk7t87bjd3abuor2l7', '::1', 1639775885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737353838353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('pvip4e3hdrqi0l1o7h6m01kdj0q3h2rc', '::1', 1639139488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393133393438383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b),
('q0qnqsrrfq3hq1d5441nkt3ffto1bg28', '::1', 1639826979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832363937393b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a323a223130223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('qb9983r62d1eo6t18fg2p87bldsaa7ae', '::1', 1639777922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737373932323b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f656d706c6f7965652f616464223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('qf21qftgum98vebn8ipnle0h7ji8oq8l', '::1', 1639830237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833303233373b6e616d657c733a383a22416264656c617469223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2230223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('qmq576lel8icb6dtuqf2hpsmuu9g7sum', '::1', 1638437592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383433373539323b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('qnq0aub01bb5is1medb7uumvlgoaljno', '::1', 1638444177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434343137373b72656469726563745f75726c7c733a33333a22687474703a2f2f6c6f63616c686f73742f7563615f76322f64617368626f617264223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('r9kt6rnu25a5acchh36qv5sinc9k3qq0', '::1', 1639163280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136333238303b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ri15v5mni5pcnvfarie3o2cacg4gtar3', '::1', 1639855185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835353138353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a920656e72656769737472c3a9657320617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('run5hchf4oomcdru4nbbva0ae3sbikb4', '::1', 1639848631, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834383633313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('s1i5jshavqnfhak2v5kislbdtppog24a', '::1', 1639151539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135313533393b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('s4g05q3qgqj74de1rtlb9p5tgckrbr57', '::1', 1639156255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135363235353b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('sccd9q73n70nthd5va6379jr1h70ppbc', '::1', 1639852967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835323936373b72656469726563745f75726c7c733a34363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f6f6e6c696e655f61646d697373696f6e2f696e646578223b616c6572742d6d6573736167652d6572726f727c733a34363a224c276964656e74696669616e74206f75206c65206d6f742064652070617373652065737420696e636f7272656374223b5f5f63695f766172737c613a313a7b733a31393a22616c6572742d6d6573736167652d6572726f72223b733a333a226f6c64223b7d),
('sld7eba846fq7tq3ri3dgnhilqj0fjf7', '::1', 1639777580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737373538303b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f656d706c6f7965652f616464223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('slpapif6ng22dfts3rnh798daflro5o5', '::1', 1639150142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135303134323b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('sn13skjk33roupukb7i7mu4jrseplpfo', '::1', 1638441436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434313339313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('snuhjvil6n0jsiulsoj82qf49j4sfbdo', '::1', 1639140255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393134303233383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b),
('t20r6qq3tbks9gbj786kobapp5dqhhik', '::1', 1639850633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835303633333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('toiut2alesurkvrn5acs4qf4mlb3se07', '::1', 1638873354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837333335343b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('tp01iqh8pcbch75sifgmi6007i3u50nv', '::1', 1638875796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837353739363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('tp872vj78i4udps3mlv0avo44h7dnnvp', '::1', 1639844428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834343432383b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d696e666f7c733a353a2268656c6c6f223b5f5f63695f766172737c613a313a7b733a31383a22616c6572742d6d6573736167652d696e666f223b733a333a226e6577223b7d),
('tqpkpoge875ls1bskqir4jak0ebanh5n', '::1', 1639764145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736343134353b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('u09cdr5ek07vjuu4ghojaipliq68nc9l', '::1', 1639852494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835323439343b72656469726563745f75726c7c733a34363a22687474703a2f2f6c6f63616c686f73742f7563615f76322f6f6e6c696e655f61646d697373696f6e2f696e646578223b616c6572742d6d6573736167652d6572726f727c733a31343a22436f6d70746520696e6163746966223b5f5f63695f766172737c613a313a7b733a31393a22616c6572742d6d6573736167652d6572726f72223b733a333a226f6c64223b7d),
('u1kfqesv779eemvgegsfuvf8maer2nq2', '::1', 1639472703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437323639393b),
('u3dab1pppcl8kanr6bc5lipfb1aamn1r', '::1', 1639857722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393835373639363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2234223b6c6f67676564696e7c623a313b),
('u5dl1e32sgff96mth4kcp6os4h9nat5a', '::1', 1639837294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393833373239343b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('uc6f30fibq86aq6pfvvvo89jp9pmd8g7', '::1', 1639777681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393737373638313b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a323a223130223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('udluqdii4c3iugmneqf90pg5crvum5sc', '::1', 1639151152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393135313135323b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ue3dcimtj5ig5vtru0ogcv2tbs4889oa', '::1', 1639849476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834393437363b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('uffa5ivhbtktpn6jbceskanuhdf5rpuv', '::1', 1639769189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393736393138393b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ugsn2gi4o0eq1s2fit49dahbgfb5o1fq', '::1', 1639846877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393834363837373b6e616d657c733a373a226661697373616c223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f73656374696f6e7c733a323a223130223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v1if43nbmf0epn0p558h0qj5s9i1hov7', '::1', 1638441068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383434313036383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a35333a224c657320696e666f726d6174696f6e73206f6e7420c3a974c3a9206d6973657320c3a0206a6f757220617665632073756363c3a873223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('v29q66mlj117mnte61hckreo5rpbf2uf', '::1', 1639477941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437373934313b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v2ift2difoudp6u1us0v3rf63engtec1', '::1', 1639138208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393133383230383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2231223b6c6f67676564696e7c623a313b),
('v4gkr91msptjetdp0p7uloj8irfs9rbh', '::1', 1639475378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393437353337383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v7atl7ku65bd6ho0d52rcsrkpefbfj4m', '::1', 1639826307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393832363330373b),
('v94qalmv6uuqmd7bg6la2eg3rucsctu7', '::1', 1639168403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633393136383430333b72656469726563745f75726c7c733a34373a22687474703a2f2f6c6f63616c686f73742f7563615f76322f73657373696f6e732f7365745f61636164656d69632f33223b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('van6kkr55ir7olojb8h15k08k5d82ggg', '::1', 1643884338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313634333838343333383b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f73656374696f6e7c733a313a2230223b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ve75o4a5uo86p1j3p3fqoco8hughvt4r', '::1', 1638874403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633383837343430333b6e616d657c733a373a224661697373616c223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2232223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a363a226672656e6368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `is_system` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `prefix`, `is_system`) VALUES
(1, 'Super Admin', 'superadmin', '1'),
(2, 'Admin', 'admin', '1'),
(3, 'Teacher', 'teacher', '1');

-- --------------------------------------------------------

--
-- Structure de la table `schoolyear`
--

DROP TABLE IF EXISTS `schoolyear`;
CREATE TABLE IF NOT EXISTS `schoolyear` (
  `id` int(11) NOT NULL,
  `school_year` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `schoolyear`
--

INSERT INTO `schoolyear` (`id`, `school_year`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2019-2020', 1, '2020-02-25 19:35:41', '2020-02-26 16:54:49'),
(3, '2020-2021', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(4, '2021-2022', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(5, '2022-2023', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(6, '2023-2024', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(7, '2024-2025', 1, '2020-02-25 19:35:41', '2020-02-26 01:20:04'),
(9, '2025-2026', 1, '2020-02-26 07:00:10', '2020-02-26 13:00:24');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id`, `name`, `capacity`, `branch_id`) VALUES
(2, 'Finance , Banque et Assurance mode hybrid', 'fst', 1),
(3, 'Tutorat de langues étrangéres', '', 1),
(4, 'Transport et logistique', '', 1),
(5, 'Community et revenue management touristique', '', 1),
(6, 'Préparation à l\'agrégation', '', 1),
(7, 'Accessibilité physique des personnes en situation d\'handicap', '', 1),
(8, 'Marketing digital', '', 1),
(9, 'Pédagogie unversitaire', '', 1),
(10, 'Actuariat et risk management', '', 1),
(11, 'Management des ressources Humaines', '', 1),
(12, 'Stratégie et Marketing des services', '', 1),
(13, 'Ingénierie Génie Civil Environnement et qualité', '', 1),
(14, 'Management Qualité Hygiène Sécurité et Environnement', '', 1),
(15, 'Data sciences appliquées en management et economie', '', 1),
(16, 'logistique de distrubition et supply chain managemenet', '', 1),
(17, 'DIPLÔME UNIVERSITAIRE MÉDECINE', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sections_allocation`
--

DROP TABLE IF EXISTS `sections_allocation`;
CREATE TABLE IF NOT EXISTS `sections_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sections_allocation`
--

INSERT INTO `sections_allocation` (`id`, `class_id`, `section_id`) VALUES
(13, 2, 10),
(14, 2, 11),
(15, 2, 12),
(16, 2, 13),
(17, 2, 14),
(18, 3, 3),
(19, 3, 4),
(20, 3, 5),
(21, 3, 6),
(22, 3, 7),
(23, 3, 8),
(24, 3, 9),
(25, 1, 2),
(26, 1, 15),
(27, 1, 16),
(28, 4, 17);

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `present_address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `department`, `sex`, `present_address`, `mobileno`, `email`, `branch_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, '98b09e6', 'superadmin', 0, '', '', '', 'superadmin@ramom.com', NULL, NULL, '2021-05-25 13:33:28', NULL),
(2, '5254520', 'Faissal', 0, '', '', '', 'faissal.elfid@gmail.com', NULL, NULL, '2021-11-04 18:42:34', NULL),
(3, '3508303', 'Omar', 2, 'male', 'Marrakech, Sidi Abad', '062845960', 'omar@gmail.com', 1, 'bff664c612a7a2c6d4749ff2c6caae0a.jpg', '2021-12-18 12:09:40', NULL),
(4, '782074a', 'faissal', 10, 'male', 'Marrakech, Sidi Abad', '062845960', 'faissal@gmail.com', 1, 'defualt.png', '2021-12-18 12:11:24', NULL),
(5, '6d96ba1', 'Amadou', 2, 'male', 'N 201 LOT TAOUFIK', '0682484555', 'amadou@gmail.com', 1, '98d98cdb11c9bbcb94f36cf796968f72.png', '2021-12-18 17:44:37', NULL),
(6, '3465c18', 'Nawfal Essaghir', 10, 'male', 'AV Hassan 2, TAZA', '05689456', 'nawfal@gmail.com', 1, '252d6587f09f6e25ac7fbd9e98595c8c.png', '2021-12-18 18:41:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `staff_privileges`
--

DROP TABLE IF EXISTS `staff_privileges`;
CREATE TABLE IF NOT EXISTS `staff_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=722 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `staff_privileges`
--

INSERT INTO `staff_privileges` (`id`, `role_id`, `permission_id`, `is_add`, `is_edit`, `is_view`, `is_delete`) VALUES
(1, 3, 91, 0, 0, 0, 0),
(88, 2, 1, 1, 1, 1, 1),
(89, 2, 2, 1, 0, 0, 0),
(90, 2, 3, 1, 1, 1, 1),
(91, 2, 4, 0, 0, 1, 0),
(92, 2, 5, 1, 0, 1, 0),
(93, 2, 30, 1, 0, 1, 0),
(94, 2, 7, 1, 1, 1, 1),
(95, 2, 8, 1, 0, 1, 0),
(96, 2, 6, 1, 1, 1, 1),
(97, 2, 9, 1, 1, 1, 1),
(98, 2, 10, 1, 1, 1, 1),
(99, 2, 11, 1, 0, 1, 0),
(100, 2, 12, 1, 1, 1, 1),
(101, 2, 13, 1, 0, 1, 0),
(102, 2, 14, 1, 0, 1, 0),
(103, 2, 15, 0, 0, 1, 0),
(104, 2, 16, 1, 1, 1, 1),
(105, 2, 17, 1, 1, 1, 1),
(107, 2, 19, 1, 1, 1, 1),
(108, 2, 20, 1, 1, 1, 1),
(109, 2, 21, 1, 1, 1, 1),
(110, 2, 22, 1, 1, 1, 1),
(111, 2, 23, 1, 1, 1, 1),
(112, 2, 24, 1, 1, 1, 1),
(113, 2, 25, 1, 1, 1, 1),
(114, 2, 26, 1, 1, 1, 1),
(115, 2, 27, 1, 1, 1, 1),
(116, 2, 28, 1, 0, 1, 1),
(117, 2, 29, 1, 1, 1, 1),
(118, 2, 32, 1, 1, 1, 1),
(119, 2, 31, 1, 1, 1, 1),
(120, 2, 33, 1, 1, 1, 1),
(121, 2, 34, 1, 1, 1, 1),
(122, 2, 35, 1, 1, 1, 1),
(123, 2, 36, 1, 1, 1, 1),
(124, 2, 37, 1, 0, 1, 1),
(125, 2, 38, 1, 1, 1, 1),
(126, 2, 39, 1, 1, 1, 1),
(127, 2, 77, 1, 1, 1, 1),
(128, 2, 78, 0, 0, 1, 0),
(129, 2, 79, 0, 0, 1, 0),
(130, 2, 40, 1, 1, 1, 1),
(131, 2, 41, 1, 1, 1, 1),
(132, 2, 42, 1, 1, 1, 1),
(133, 2, 43, 0, 0, 1, 1),
(134, 2, 44, 1, 1, 1, 1),
(135, 2, 45, 1, 1, 1, 1),
(136, 2, 46, 1, 1, 1, 1),
(137, 2, 47, 1, 1, 1, 1),
(138, 2, 48, 0, 0, 1, 1),
(139, 2, 49, 1, 0, 0, 0),
(140, 2, 50, 1, 0, 0, 0),
(141, 2, 51, 1, 0, 0, 0),
(142, 2, 52, 0, 0, 1, 0),
(143, 2, 53, 0, 0, 1, 0),
(144, 2, 54, 0, 0, 1, 0),
(145, 2, 55, 1, 1, 1, 1),
(146, 2, 56, 1, 1, 1, 1),
(147, 2, 57, 1, 0, 1, 1),
(148, 2, 58, 1, 0, 1, 1),
(149, 2, 59, 1, 1, 1, 1),
(150, 2, 60, 1, 1, 1, 1),
(151, 2, 61, 1, 0, 1, 1),
(152, 2, 62, 1, 1, 1, 1),
(153, 2, 80, 0, 0, 1, 0),
(154, 2, 69, 1, 1, 1, 1),
(155, 2, 70, 1, 1, 1, 1),
(156, 2, 71, 1, 1, 1, 1),
(157, 2, 72, 1, 1, 1, 1),
(158, 2, 73, 1, 0, 0, 0),
(159, 2, 74, 1, 1, 1, 1),
(160, 2, 75, 0, 0, 1, 0),
(161, 2, 76, 0, 0, 1, 1),
(162, 2, 63, 1, 1, 1, 1),
(163, 2, 64, 1, 1, 1, 1),
(164, 2, 65, 1, 1, 1, 1),
(165, 2, 66, 0, 0, 1, 0),
(166, 2, 67, 1, 1, 1, 1),
(167, 2, 68, 1, 1, 1, 1),
(168, 2, 81, 0, 0, 0, 0),
(169, 2, 82, 1, 0, 1, 0),
(170, 2, 83, 1, 1, 1, 1),
(171, 2, 84, 1, 1, 1, 1),
(172, 2, 85, 1, 1, 1, 1),
(173, 2, 86, 0, 0, 0, 0),
(174, 2, 87, 0, 0, 0, 0),
(175, 7, 1, 0, 0, 0, 0),
(176, 7, 2, 0, 0, 0, 0),
(177, 7, 3, 0, 0, 0, 0),
(178, 7, 4, 0, 0, 0, 0),
(179, 7, 5, 0, 0, 0, 0),
(180, 7, 30, 0, 0, 0, 0),
(181, 7, 7, 0, 0, 0, 0),
(182, 7, 8, 0, 0, 0, 0),
(183, 7, 6, 0, 0, 0, 0),
(184, 7, 9, 0, 0, 0, 0),
(185, 7, 10, 0, 0, 0, 0),
(186, 7, 11, 0, 0, 0, 0),
(187, 7, 12, 0, 0, 0, 0),
(188, 7, 13, 0, 0, 0, 0),
(189, 7, 14, 0, 0, 0, 0),
(190, 7, 15, 0, 0, 0, 0),
(191, 7, 16, 0, 0, 0, 0),
(192, 7, 17, 0, 0, 0, 0),
(194, 7, 19, 0, 0, 0, 0),
(195, 7, 20, 0, 0, 0, 0),
(196, 7, 21, 0, 0, 0, 0),
(197, 7, 22, 0, 0, 0, 0),
(198, 7, 23, 0, 0, 0, 0),
(199, 7, 24, 0, 0, 0, 0),
(200, 7, 25, 0, 0, 0, 0),
(201, 7, 26, 0, 0, 1, 0),
(202, 7, 27, 0, 0, 0, 0),
(203, 7, 28, 0, 0, 0, 0),
(204, 7, 29, 0, 0, 1, 0),
(205, 7, 32, 0, 0, 0, 0),
(206, 7, 31, 0, 0, 0, 0),
(207, 7, 33, 0, 0, 0, 0),
(208, 7, 34, 0, 0, 0, 0),
(209, 7, 35, 0, 0, 0, 0),
(210, 7, 36, 0, 0, 0, 0),
(211, 7, 37, 0, 0, 0, 0),
(212, 7, 38, 0, 0, 0, 0),
(213, 7, 39, 0, 0, 0, 0),
(214, 7, 77, 0, 0, 0, 0),
(215, 7, 78, 0, 0, 0, 0),
(216, 7, 79, 0, 0, 0, 0),
(217, 7, 40, 0, 0, 0, 0),
(218, 7, 41, 0, 0, 0, 0),
(219, 7, 42, 0, 0, 0, 0),
(220, 7, 43, 0, 0, 0, 0),
(221, 7, 44, 0, 0, 0, 0),
(222, 7, 45, 0, 0, 0, 0),
(223, 7, 46, 0, 0, 0, 0),
(224, 7, 47, 0, 0, 0, 0),
(225, 7, 48, 0, 0, 0, 0),
(226, 7, 49, 0, 0, 0, 0),
(227, 7, 50, 0, 0, 0, 0),
(228, 7, 51, 0, 0, 0, 0),
(229, 7, 52, 0, 0, 0, 0),
(230, 7, 53, 0, 0, 0, 0),
(231, 7, 54, 0, 0, 0, 0),
(232, 7, 55, 0, 0, 0, 0),
(233, 7, 56, 0, 0, 0, 0),
(234, 7, 57, 0, 0, 0, 0),
(235, 7, 58, 0, 0, 0, 0),
(236, 7, 59, 0, 0, 0, 0),
(237, 7, 60, 0, 0, 0, 0),
(238, 7, 61, 0, 0, 0, 0),
(239, 7, 62, 0, 0, 0, 0),
(240, 7, 80, 0, 0, 0, 0),
(241, 7, 69, 0, 0, 0, 0),
(242, 7, 70, 0, 0, 0, 0),
(243, 7, 71, 0, 0, 0, 0),
(244, 7, 72, 0, 0, 0, 0),
(245, 7, 73, 0, 0, 0, 0),
(246, 7, 74, 0, 0, 0, 0),
(247, 7, 75, 0, 0, 0, 0),
(248, 7, 76, 0, 0, 0, 0),
(249, 7, 63, 0, 0, 0, 0),
(250, 7, 64, 0, 0, 0, 0),
(251, 7, 65, 0, 0, 0, 0),
(252, 7, 66, 0, 0, 0, 0),
(253, 7, 67, 0, 0, 0, 0),
(254, 7, 68, 0, 0, 0, 0),
(255, 7, 81, 0, 0, 0, 0),
(256, 7, 82, 0, 0, 0, 0),
(257, 7, 83, 0, 0, 0, 0),
(258, 7, 84, 0, 0, 0, 0),
(259, 7, 85, 0, 0, 0, 0),
(260, 7, 86, 0, 0, 0, 0),
(261, 7, 87, 0, 0, 0, 0),
(262, 88, 88, 1, 1, 1, 1),
(263, 88, 88, 1, 1, 1, 1),
(264, 89, 89, 1, 1, 1, 1),
(265, 90, 90, 1, 1, 1, 1),
(266, 2, 88, 1, 0, 1, 0),
(267, 2, 89, 0, 0, 1, 0),
(268, 90, 90, 1, 1, 1, 1),
(269, 2, 90, 0, 1, 1, 0),
(270, 91, 91, 1, 1, 1, 1),
(271, 92, 92, 1, 1, 1, 1),
(272, 2, 91, 0, 0, 1, 0),
(273, 2, 92, 0, 0, 1, 0),
(274, 93, 93, 1, 1, 1, 1),
(275, 94, 94, 1, 1, 1, 1),
(276, 95, 95, 1, 1, 1, 1),
(277, 96, 96, 1, 1, 1, 1),
(278, 2, 93, 0, 0, 1, 0),
(279, 2, 94, 0, 0, 1, 0),
(280, 2, 95, 0, 0, 1, 0),
(281, 2, 96, 0, 0, 1, 0),
(282, 97, 97, 1, 1, 1, 1),
(283, 98, 98, 1, 1, 1, 1),
(284, 2, 97, 0, 0, 1, 0),
(285, 2, 98, 0, 0, 1, 0),
(286, 99, 99, 1, 1, 1, 1),
(287, 100, 100, 1, 1, 1, 1),
(288, 101, 101, 1, 1, 1, 1),
(289, 102, 102, 1, 1, 1, 1),
(290, 2, 99, 0, 0, 1, 0),
(291, 2, 100, 0, 0, 1, 0),
(292, 2, 101, 0, 0, 1, 0),
(293, 2, 102, 0, 0, 1, 0),
(294, 103, 103, 1, 1, 1, 1),
(295, 2, 103, 0, 1, 1, 0),
(312, 4, 91, 0, 0, 1, 0),
(313, 4, 92, 0, 0, 1, 0),
(314, 4, 93, 0, 0, 0, 0),
(315, 4, 94, 0, 0, 0, 0),
(316, 4, 95, 0, 0, 0, 0),
(317, 4, 96, 0, 0, 0, 0),
(318, 4, 97, 0, 0, 0, 0),
(319, 4, 98, 0, 0, 0, 0),
(320, 4, 99, 0, 0, 0, 0),
(321, 4, 100, 0, 0, 0, 0),
(322, 4, 101, 0, 0, 0, 0),
(323, 4, 102, 0, 0, 0, 0),
(324, 4, 1, 0, 0, 0, 0),
(325, 4, 2, 0, 0, 0, 0),
(326, 4, 3, 0, 0, 0, 0),
(327, 4, 4, 0, 0, 0, 0),
(328, 4, 5, 0, 0, 0, 0),
(329, 4, 30, 0, 0, 0, 0),
(330, 4, 7, 0, 0, 0, 0),
(331, 4, 8, 0, 0, 0, 0),
(332, 4, 6, 0, 0, 0, 0),
(333, 4, 9, 0, 0, 0, 0),
(334, 4, 10, 0, 0, 0, 0),
(335, 4, 11, 0, 0, 0, 0),
(336, 4, 12, 1, 1, 1, 1),
(337, 4, 13, 1, 0, 1, 0),
(338, 4, 14, 1, 0, 1, 0),
(339, 4, 15, 0, 0, 1, 0),
(340, 4, 16, 1, 1, 1, 1),
(341, 4, 17, 1, 1, 1, 1),
(343, 4, 19, 1, 1, 1, 1),
(344, 4, 20, 1, 1, 1, 1),
(345, 4, 21, 1, 1, 1, 1),
(346, 4, 22, 1, 1, 1, 1),
(347, 4, 23, 0, 0, 0, 0),
(348, 4, 24, 0, 0, 0, 0),
(349, 4, 25, 0, 0, 0, 0),
(350, 4, 26, 0, 0, 0, 0),
(351, 4, 27, 0, 0, 0, 0),
(352, 4, 28, 0, 0, 0, 0),
(353, 4, 29, 0, 0, 0, 0),
(354, 4, 32, 0, 0, 0, 0),
(355, 4, 88, 0, 0, 0, 0),
(356, 4, 89, 0, 0, 0, 0),
(357, 4, 31, 0, 0, 0, 0),
(358, 4, 33, 0, 0, 0, 0),
(359, 4, 34, 0, 0, 0, 0),
(360, 4, 35, 0, 0, 0, 0),
(361, 4, 36, 0, 0, 0, 0),
(362, 4, 37, 0, 0, 0, 0),
(363, 4, 38, 0, 0, 0, 0),
(364, 4, 39, 0, 0, 0, 0),
(365, 4, 77, 0, 0, 0, 0),
(366, 4, 78, 0, 0, 0, 0),
(367, 4, 79, 0, 0, 0, 0),
(368, 4, 40, 0, 0, 0, 0),
(369, 4, 41, 0, 0, 0, 0),
(370, 4, 42, 0, 0, 0, 0),
(371, 4, 43, 0, 0, 0, 0),
(372, 4, 44, 0, 0, 0, 0),
(373, 4, 45, 0, 0, 0, 0),
(374, 4, 46, 0, 0, 0, 0),
(375, 4, 47, 0, 0, 0, 0),
(376, 4, 48, 0, 0, 0, 0),
(377, 4, 49, 0, 0, 0, 0),
(378, 4, 50, 0, 0, 0, 0),
(379, 4, 51, 0, 0, 0, 0),
(380, 4, 52, 0, 0, 0, 0),
(381, 4, 53, 0, 0, 0, 0),
(382, 4, 54, 0, 0, 0, 0),
(383, 4, 55, 0, 0, 1, 0),
(384, 4, 56, 0, 0, 0, 0),
(385, 4, 57, 0, 0, 0, 0),
(386, 4, 58, 1, 0, 1, 0),
(387, 4, 59, 0, 0, 0, 0),
(388, 4, 60, 0, 0, 0, 0),
(389, 4, 61, 0, 0, 0, 0),
(390, 4, 62, 0, 0, 0, 0),
(391, 4, 80, 0, 0, 0, 0),
(392, 4, 69, 1, 1, 1, 1),
(393, 4, 70, 1, 1, 1, 1),
(394, 4, 71, 1, 1, 1, 1),
(395, 4, 72, 1, 1, 1, 1),
(396, 4, 73, 1, 0, 0, 0),
(397, 4, 74, 1, 1, 1, 1),
(398, 4, 75, 0, 0, 1, 0),
(399, 4, 76, 0, 0, 1, 0),
(400, 4, 63, 1, 1, 1, 1),
(401, 4, 64, 1, 1, 1, 1),
(402, 4, 65, 1, 1, 1, 1),
(403, 4, 66, 0, 0, 1, 0),
(404, 4, 67, 1, 1, 1, 1),
(405, 4, 68, 1, 1, 1, 1),
(406, 4, 81, 0, 0, 0, 0),
(407, 4, 82, 0, 0, 0, 0),
(408, 4, 83, 0, 0, 0, 0),
(409, 4, 84, 0, 0, 0, 0),
(410, 4, 85, 0, 0, 0, 0),
(411, 4, 86, 0, 0, 0, 0),
(412, 4, 87, 0, 0, 0, 0),
(413, 4, 90, 0, 0, 0, 0),
(414, 4, 103, 0, 0, 0, 0),
(415, 5, 91, 0, 0, 0, 0),
(416, 5, 92, 0, 0, 0, 0),
(417, 5, 93, 0, 0, 1, 0),
(418, 5, 94, 0, 0, 1, 0),
(419, 5, 95, 0, 0, 0, 0),
(420, 5, 96, 0, 0, 0, 0),
(421, 5, 97, 0, 0, 0, 0),
(422, 5, 98, 0, 0, 0, 0),
(423, 5, 99, 0, 0, 0, 0),
(424, 5, 100, 0, 0, 0, 0),
(425, 5, 101, 0, 0, 0, 0),
(426, 5, 102, 0, 0, 0, 0),
(427, 5, 1, 0, 0, 1, 0),
(428, 5, 2, 0, 0, 0, 0),
(429, 5, 3, 0, 0, 0, 0),
(430, 5, 4, 0, 0, 0, 0),
(431, 5, 5, 0, 0, 0, 0),
(432, 5, 30, 0, 0, 0, 0),
(433, 5, 7, 0, 0, 0, 0),
(434, 5, 8, 0, 0, 0, 0),
(435, 5, 6, 0, 0, 1, 0),
(436, 5, 9, 0, 0, 0, 0),
(437, 5, 10, 0, 0, 0, 0),
(438, 5, 11, 0, 0, 0, 0),
(439, 5, 12, 0, 0, 0, 0),
(440, 5, 13, 0, 0, 0, 0),
(441, 5, 14, 0, 0, 0, 0),
(442, 5, 15, 0, 0, 0, 0),
(443, 5, 16, 0, 0, 0, 0),
(444, 5, 17, 0, 0, 0, 0),
(446, 5, 19, 0, 0, 0, 0),
(447, 5, 20, 1, 1, 1, 1),
(448, 5, 21, 0, 0, 0, 0),
(449, 5, 22, 0, 0, 0, 0),
(450, 5, 23, 0, 0, 0, 0),
(451, 5, 24, 0, 0, 0, 0),
(452, 5, 25, 0, 0, 0, 0),
(453, 5, 26, 0, 0, 0, 0),
(454, 5, 27, 0, 0, 0, 0),
(455, 5, 28, 0, 0, 0, 0),
(456, 5, 29, 0, 0, 0, 0),
(457, 5, 32, 0, 0, 0, 0),
(458, 5, 88, 0, 0, 0, 0),
(459, 5, 89, 0, 0, 0, 0),
(460, 5, 31, 0, 0, 0, 0),
(461, 5, 33, 0, 0, 0, 0),
(462, 5, 34, 0, 0, 0, 0),
(463, 5, 35, 0, 0, 0, 0),
(464, 5, 36, 0, 0, 0, 0),
(465, 5, 37, 0, 0, 0, 0),
(466, 5, 38, 0, 0, 0, 0),
(467, 5, 39, 0, 0, 0, 0),
(468, 5, 77, 0, 0, 0, 0),
(469, 5, 78, 0, 0, 0, 0),
(470, 5, 79, 0, 0, 0, 0),
(471, 5, 40, 0, 0, 0, 0),
(472, 5, 41, 0, 0, 0, 0),
(473, 5, 42, 0, 0, 0, 0),
(474, 5, 43, 0, 0, 0, 0),
(475, 5, 44, 0, 0, 0, 0),
(476, 5, 45, 0, 0, 0, 0),
(477, 5, 46, 0, 0, 0, 0),
(478, 5, 47, 0, 0, 0, 0),
(479, 5, 48, 0, 0, 0, 0),
(480, 5, 49, 0, 0, 0, 0),
(481, 5, 50, 0, 0, 0, 0),
(482, 5, 51, 0, 0, 0, 0),
(483, 5, 52, 0, 0, 0, 0),
(484, 5, 53, 0, 0, 0, 0),
(485, 5, 54, 0, 0, 0, 0),
(486, 5, 55, 1, 1, 1, 1),
(487, 5, 56, 1, 1, 1, 1),
(488, 5, 57, 1, 0, 1, 1),
(489, 5, 58, 1, 0, 1, 1),
(490, 5, 59, 0, 0, 0, 0),
(491, 5, 60, 0, 0, 0, 0),
(492, 5, 61, 0, 0, 0, 0),
(493, 5, 62, 0, 0, 0, 0),
(494, 5, 80, 0, 0, 0, 0),
(495, 5, 69, 0, 0, 0, 0),
(496, 5, 70, 0, 0, 0, 0),
(497, 5, 71, 0, 0, 0, 0),
(498, 5, 72, 0, 0, 0, 0),
(499, 5, 73, 0, 0, 0, 0),
(500, 5, 74, 0, 0, 0, 0),
(501, 5, 75, 0, 0, 0, 0),
(502, 5, 76, 0, 0, 0, 0),
(503, 5, 63, 0, 0, 0, 0),
(504, 5, 64, 0, 0, 0, 0),
(505, 5, 65, 0, 0, 0, 0),
(506, 5, 66, 0, 0, 0, 0),
(507, 5, 67, 0, 0, 0, 0),
(508, 5, 68, 0, 0, 0, 0),
(509, 5, 81, 0, 0, 0, 0),
(510, 5, 82, 0, 0, 0, 0),
(511, 5, 83, 0, 0, 0, 0),
(512, 5, 84, 0, 0, 0, 0),
(513, 5, 85, 0, 0, 0, 0),
(514, 5, 86, 0, 0, 0, 0),
(515, 5, 87, 0, 0, 0, 0),
(516, 5, 90, 0, 0, 0, 0),
(517, 5, 103, 0, 0, 0, 0),
(518, 104, 104, 1, 1, 1, 1),
(519, 2, 104, 0, 0, 1, 0),
(520, 4, 104, 0, 0, 1, 0),
(521, 2, 18, 1, 0, 1, 0),
(522, 2, 105, 0, 1, 1, 0),
(523, 2, 106, 1, 1, 1, 1),
(524, 2, 107, 0, 0, 1, 0),
(525, 2, 109, 1, 1, 1, 1),
(526, 2, 108, 0, 1, 1, 0),
(527, 3, 18, 0, 0, 0, 0),
(528, 3, 107, 0, 0, 0, 0),
(529, 3, 109, 0, 0, 0, 0),
(530, 3, 104, 0, 0, 0, 0),
(531, 3, 105, 0, 0, 0, 0),
(532, 3, 106, 0, 0, 0, 0),
(533, 3, 108, 0, 0, 0, 0),
(534, 2, 110, 1, 1, 1, 1),
(535, 2, 111, 0, 0, 1, 0),
(536, 2, 112, 0, 0, 1, 0),
(537, 2, 113, 1, 1, 1, 1),
(538, 2, 114, 0, 0, 1, 0),
(539, 2, 115, 0, 0, 1, 0),
(540, 2, 116, 1, 1, 1, 1),
(541, 2, 117, 0, 0, 1, 0),
(550, 2, 127, 1, 0, 1, 1),
(551, 2, 118, 1, 0, 1, 0),
(552, 2, 119, 1, 1, 1, 1),
(553, 2, 120, 1, 0, 1, 0),
(554, 2, 121, 1, 1, 1, 1),
(555, 2, 122, 1, 1, 1, 1),
(556, 2, 123, 1, 1, 1, 1),
(557, 2, 124, 1, 1, 1, 1),
(558, 2, 125, 1, 1, 1, 1),
(559, 2, 126, 1, 1, 1, 1),
(560, 3, 118, 0, 0, 0, 0),
(561, 3, 119, 0, 0, 0, 0),
(562, 3, 120, 0, 0, 0, 0),
(563, 3, 121, 0, 0, 0, 0),
(564, 3, 122, 0, 0, 0, 0),
(565, 3, 123, 0, 0, 0, 0),
(566, 3, 124, 0, 0, 0, 0),
(567, 3, 125, 0, 0, 0, 0),
(568, 3, 126, 0, 0, 0, 0),
(569, 3, 127, 1, 0, 1, 1),
(570, 3, 128, 0, 0, 0, 0),
(571, 2, 129, 0, 0, 1, 0),
(572, 2, 128, 0, 0, 0, 0),
(573, 2, 131, 1, 1, 1, 1),
(574, 2, 132, 1, 1, 1, 1),
(575, 2, 130, 0, 0, 0, 1),
(576, 4, 118, 0, 0, 0, 0),
(577, 4, 119, 0, 0, 0, 0),
(578, 4, 120, 0, 0, 0, 0),
(579, 4, 121, 0, 0, 0, 0),
(580, 4, 122, 0, 0, 0, 0),
(581, 4, 123, 0, 0, 0, 0),
(582, 4, 124, 0, 0, 0, 0),
(583, 4, 125, 0, 0, 0, 0),
(584, 4, 126, 0, 0, 0, 0),
(585, 4, 131, 0, 0, 0, 0),
(586, 4, 132, 0, 0, 0, 0),
(587, 4, 127, 0, 0, 0, 0),
(588, 4, 113, 0, 0, 0, 0),
(589, 4, 114, 0, 0, 0, 0),
(590, 4, 115, 0, 0, 0, 0),
(591, 4, 116, 0, 0, 0, 0),
(592, 4, 117, 0, 0, 0, 0),
(593, 4, 110, 0, 0, 0, 0),
(594, 4, 111, 0, 0, 0, 0),
(595, 4, 112, 0, 0, 0, 0),
(596, 4, 18, 0, 0, 0, 0),
(597, 4, 107, 0, 0, 0, 0),
(598, 4, 109, 0, 0, 0, 0),
(599, 4, 129, 0, 0, 0, 0),
(600, 4, 130, 0, 0, 0, 1),
(601, 4, 105, 0, 0, 0, 0),
(602, 4, 106, 0, 0, 0, 0),
(603, 4, 108, 0, 0, 0, 0),
(604, 4, 128, 0, 0, 0, 0),
(605, 2, 131, 1, 1, 1, 1),
(606, 2, 132, 1, 1, 1, 1),
(607, 2, 133, 0, 0, 1, 0),
(608, 3, 133, 0, 0, 0, 0),
(609, 3, 92, 0, 0, 0, 0),
(610, 3, 93, 0, 0, 0, 0),
(611, 3, 94, 0, 0, 0, 0),
(612, 3, 95, 0, 0, 0, 0),
(613, 3, 96, 0, 0, 1, 0),
(614, 3, 97, 0, 0, 0, 0),
(615, 3, 98, 0, 0, 0, 0),
(616, 3, 99, 0, 0, 1, 0),
(617, 3, 100, 0, 0, 0, 0),
(618, 3, 101, 0, 0, 0, 0),
(619, 3, 102, 0, 0, 0, 0),
(620, 3, 131, 0, 0, 0, 0),
(621, 3, 132, 0, 0, 0, 0),
(622, 3, 1, 0, 0, 0, 0),
(623, 3, 2, 0, 0, 0, 0),
(624, 3, 3, 0, 0, 0, 0),
(625, 3, 4, 0, 0, 0, 0),
(626, 3, 5, 0, 0, 0, 0),
(627, 3, 30, 0, 0, 0, 0),
(628, 3, 7, 0, 0, 0, 0),
(629, 3, 8, 0, 0, 0, 0),
(630, 3, 6, 0, 0, 0, 0),
(631, 3, 9, 0, 0, 0, 0),
(632, 3, 10, 0, 0, 0, 0),
(633, 3, 11, 0, 0, 0, 0),
(634, 3, 113, 0, 0, 0, 0),
(635, 3, 114, 0, 0, 0, 0),
(636, 3, 115, 0, 0, 0, 0),
(637, 3, 116, 0, 0, 0, 0),
(638, 3, 117, 0, 0, 0, 0),
(639, 3, 110, 0, 0, 0, 0),
(640, 3, 111, 0, 0, 0, 0),
(641, 3, 112, 0, 0, 0, 0),
(642, 3, 12, 0, 0, 0, 0),
(643, 3, 13, 0, 0, 0, 0),
(644, 3, 14, 0, 0, 0, 0),
(645, 3, 15, 0, 0, 0, 0),
(646, 3, 16, 0, 0, 0, 0),
(647, 3, 17, 0, 0, 0, 0),
(648, 3, 19, 0, 0, 0, 0),
(649, 3, 20, 0, 0, 0, 0),
(650, 3, 21, 0, 0, 0, 0),
(651, 3, 22, 0, 0, 0, 0),
(652, 3, 23, 0, 0, 1, 0),
(653, 3, 24, 0, 0, 1, 0),
(654, 3, 25, 0, 0, 0, 0),
(655, 3, 26, 0, 0, 0, 0),
(656, 3, 27, 0, 0, 0, 0),
(657, 3, 28, 0, 0, 0, 0),
(658, 3, 29, 0, 0, 0, 0),
(659, 3, 129, 0, 0, 0, 0),
(660, 3, 31, 0, 0, 1, 0),
(661, 3, 33, 0, 0, 1, 0),
(662, 3, 32, 0, 0, 0, 0),
(663, 3, 88, 0, 0, 0, 0),
(664, 3, 89, 0, 0, 0, 0),
(665, 3, 34, 0, 0, 0, 0),
(666, 3, 35, 0, 0, 0, 0),
(667, 3, 36, 0, 0, 0, 0),
(668, 3, 37, 0, 0, 0, 0),
(669, 3, 38, 0, 0, 0, 0),
(670, 3, 39, 0, 0, 0, 0),
(671, 3, 77, 0, 0, 0, 0),
(672, 3, 78, 0, 0, 0, 0),
(673, 3, 79, 0, 0, 0, 0),
(674, 3, 40, 0, 0, 0, 0),
(675, 3, 41, 0, 0, 0, 0),
(676, 3, 42, 0, 0, 0, 0),
(677, 3, 43, 0, 0, 0, 0),
(678, 3, 44, 0, 0, 0, 0),
(679, 3, 45, 0, 0, 0, 0),
(680, 3, 46, 0, 0, 0, 0),
(681, 3, 47, 0, 0, 0, 0),
(682, 3, 48, 0, 0, 0, 0),
(683, 3, 49, 0, 0, 0, 0),
(684, 3, 50, 0, 0, 0, 0),
(685, 3, 51, 0, 0, 0, 0),
(686, 3, 52, 0, 0, 0, 0),
(687, 3, 53, 0, 0, 0, 0),
(688, 3, 54, 0, 0, 0, 0),
(689, 3, 55, 0, 0, 0, 0),
(690, 3, 56, 0, 0, 0, 0),
(691, 3, 57, 0, 0, 0, 0),
(692, 3, 58, 0, 0, 0, 0),
(693, 3, 59, 0, 0, 0, 0),
(694, 3, 60, 0, 0, 0, 0),
(695, 3, 61, 0, 0, 0, 0),
(696, 3, 62, 0, 0, 0, 0),
(697, 3, 80, 0, 0, 0, 0),
(698, 3, 69, 0, 0, 0, 0),
(699, 3, 70, 0, 0, 0, 0),
(700, 3, 71, 0, 0, 0, 0),
(701, 3, 72, 0, 0, 0, 0),
(702, 3, 73, 0, 0, 0, 0),
(703, 3, 74, 0, 0, 0, 0),
(704, 3, 75, 0, 0, 0, 0),
(705, 3, 76, 0, 0, 0, 0),
(706, 3, 130, 0, 0, 0, 0),
(707, 3, 63, 0, 0, 0, 0),
(708, 3, 64, 0, 0, 0, 0),
(709, 3, 65, 0, 0, 0, 0),
(710, 3, 66, 0, 0, 0, 0),
(711, 3, 67, 0, 0, 0, 0),
(712, 3, 68, 0, 0, 0, 0),
(713, 3, 81, 0, 0, 0, 0),
(714, 3, 82, 0, 0, 0, 0),
(715, 3, 83, 0, 0, 0, 0),
(716, 3, 84, 0, 0, 0, 0),
(717, 3, 85, 0, 0, 0, 0),
(718, 3, 86, 0, 0, 0, 0),
(719, 3, 87, 0, 0, 0, 0),
(720, 3, 90, 0, 0, 0, 0),
(721, 3, 103, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `theme_settings`
--

DROP TABLE IF EXISTS `theme_settings`;
CREATE TABLE IF NOT EXISTS `theme_settings` (
  `id` int(11) NOT NULL,
  `border_mode` varchar(200) NOT NULL,
  `dark_skin` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `border_mode`, `dark_skin`, `created_at`, `updated_at`) VALUES
(1, 'false', 'false', '2018-10-23 16:59:38', '2020-05-10 14:08:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
