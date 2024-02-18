-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2024 at 06:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spkcmeans`
--

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'spkcmeans', '0001_initial', '2024-01-24 22:59:59.588301');

-- --------------------------------------------------------

--
-- Table structure for table `tb_datauji`
--

CREATE TABLE `tb_datauji` (
  `id_datauji` char(32) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_datauji`
--

INSERT INTO `tb_datauji` (`id_datauji`, `nama`) VALUES
('0d2feadebf094c7bbc0495a3ab36dc61', 'E'),
('1e6de31c957e48faae8bbf35c15c460c', 'H'),
('3738a661c9864245bf77738c46ce0813', 'J'),
('4c661b09575f439ea4b16d21c63aa9bd', 'M'),
('55c85f66cbff4bfc83790d3a3d055e13', 'I'),
('5c583ceef36842acb3f1e5212b69dcfa', 'K'),
('738a0f5c476341baac3a461ca6d7ed5c', 'G'),
('8d2eba9e8e404dfb9c7213b191fcce30', 'D'),
('9a245a9ff3a34ef7b68ebf2b83062f46', 'C'),
('a24d2e1651ce4a71ac1a9c6b7261ccb1', 'A'),
('c920ed31ba254e2abe2b24f4de4cd343', 'B'),
('de33af9f4b1443658dc480f043de40e2', 'N'),
('e5f04cc1f19e4dc0af9be066c61ab18c', 'L'),
('f1add76fa0094fac9d5ed446409b28d6', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detaildatauji`
--

CREATE TABLE `tb_detaildatauji` (
  `id` bigint(20) NOT NULL,
  `datauji_id` char(32) NOT NULL,
  `kriteria_id` char(32) NOT NULL,
  `subkriteria_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detaildatauji`
--

INSERT INTO `tb_detaildatauji` (`id`, `datauji_id`, `kriteria_id`, `subkriteria_id`) VALUES
(327, 'c920ed31ba254e2abe2b24f4de4cd343', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(328, 'c920ed31ba254e2abe2b24f4de4cd343', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(329, 'c920ed31ba254e2abe2b24f4de4cd343', '5fee570a35094ac8bbcb9c966cafe121', '7ade1c8163a94893b9e195442bec508b'),
(330, 'c920ed31ba254e2abe2b24f4de4cd343', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(331, 'c920ed31ba254e2abe2b24f4de4cd343', 'f869edfc9c334c069fb41e5c3fa510f9', '6f1883d1242c469685950095fee86bc6'),
(332, '9a245a9ff3a34ef7b68ebf2b83062f46', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(333, '9a245a9ff3a34ef7b68ebf2b83062f46', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(334, '9a245a9ff3a34ef7b68ebf2b83062f46', '5fee570a35094ac8bbcb9c966cafe121', '08b84b1b3c7645e89e524a62a8e0438e'),
(335, '9a245a9ff3a34ef7b68ebf2b83062f46', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(336, '9a245a9ff3a34ef7b68ebf2b83062f46', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(337, '8d2eba9e8e404dfb9c7213b191fcce30', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(338, '8d2eba9e8e404dfb9c7213b191fcce30', '57f70450f9b94fb781d285275948bf22', 'ecd99ebba8a94815827026c63d303a7e'),
(339, '8d2eba9e8e404dfb9c7213b191fcce30', '5fee570a35094ac8bbcb9c966cafe121', '08b84b1b3c7645e89e524a62a8e0438e'),
(340, '8d2eba9e8e404dfb9c7213b191fcce30', '7fcf167e653845faa6234a5f11effb19', 'eb10dbd1c0994b6a93bbbd97e081d92f'),
(341, '8d2eba9e8e404dfb9c7213b191fcce30', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(342, '0d2feadebf094c7bbc0495a3ab36dc61', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(343, '0d2feadebf094c7bbc0495a3ab36dc61', '57f70450f9b94fb781d285275948bf22', 'f5c188ccf33a40b397a8db7d4d58f3ce'),
(344, '0d2feadebf094c7bbc0495a3ab36dc61', '5fee570a35094ac8bbcb9c966cafe121', '8bb4470ff4e44bfcb320224740c455fe'),
(345, '0d2feadebf094c7bbc0495a3ab36dc61', '7fcf167e653845faa6234a5f11effb19', 'eb10dbd1c0994b6a93bbbd97e081d92f'),
(346, '0d2feadebf094c7bbc0495a3ab36dc61', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(347, 'f1add76fa0094fac9d5ed446409b28d6', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(348, 'f1add76fa0094fac9d5ed446409b28d6', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(349, 'f1add76fa0094fac9d5ed446409b28d6', '5fee570a35094ac8bbcb9c966cafe121', '08b84b1b3c7645e89e524a62a8e0438e'),
(350, 'f1add76fa0094fac9d5ed446409b28d6', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(351, 'f1add76fa0094fac9d5ed446409b28d6', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(352, '738a0f5c476341baac3a461ca6d7ed5c', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(353, '738a0f5c476341baac3a461ca6d7ed5c', '57f70450f9b94fb781d285275948bf22', 'f5c188ccf33a40b397a8db7d4d58f3ce'),
(354, '738a0f5c476341baac3a461ca6d7ed5c', '5fee570a35094ac8bbcb9c966cafe121', '7ade1c8163a94893b9e195442bec508b'),
(355, '738a0f5c476341baac3a461ca6d7ed5c', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(356, '738a0f5c476341baac3a461ca6d7ed5c', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(357, '1e6de31c957e48faae8bbf35c15c460c', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(358, '1e6de31c957e48faae8bbf35c15c460c', '57f70450f9b94fb781d285275948bf22', 'f5c188ccf33a40b397a8db7d4d58f3ce'),
(359, '1e6de31c957e48faae8bbf35c15c460c', '5fee570a35094ac8bbcb9c966cafe121', '08b84b1b3c7645e89e524a62a8e0438e'),
(360, '1e6de31c957e48faae8bbf35c15c460c', '7fcf167e653845faa6234a5f11effb19', 'c0fc23caddad4d0d88f6c6e4d9401185'),
(361, '1e6de31c957e48faae8bbf35c15c460c', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(362, '55c85f66cbff4bfc83790d3a3d055e13', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(363, '55c85f66cbff4bfc83790d3a3d055e13', '57f70450f9b94fb781d285275948bf22', 'ecd99ebba8a94815827026c63d303a7e'),
(364, '55c85f66cbff4bfc83790d3a3d055e13', '5fee570a35094ac8bbcb9c966cafe121', '08b84b1b3c7645e89e524a62a8e0438e'),
(365, '55c85f66cbff4bfc83790d3a3d055e13', '7fcf167e653845faa6234a5f11effb19', 'c0fc23caddad4d0d88f6c6e4d9401185'),
(366, '55c85f66cbff4bfc83790d3a3d055e13', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(367, '3738a661c9864245bf77738c46ce0813', '0b4233f384524755bfda45d33aaf723d', '73ccf0628dfe4c2e8d008b1c6e15c63c'),
(368, '3738a661c9864245bf77738c46ce0813', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(369, '3738a661c9864245bf77738c46ce0813', '5fee570a35094ac8bbcb9c966cafe121', '8bb4470ff4e44bfcb320224740c455fe'),
(370, '3738a661c9864245bf77738c46ce0813', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(371, '3738a661c9864245bf77738c46ce0813', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(372, '5c583ceef36842acb3f1e5212b69dcfa', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(373, '5c583ceef36842acb3f1e5212b69dcfa', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(374, '5c583ceef36842acb3f1e5212b69dcfa', '5fee570a35094ac8bbcb9c966cafe121', '7ade1c8163a94893b9e195442bec508b'),
(375, '5c583ceef36842acb3f1e5212b69dcfa', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(376, '5c583ceef36842acb3f1e5212b69dcfa', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(377, 'e5f04cc1f19e4dc0af9be066c61ab18c', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(378, 'e5f04cc1f19e4dc0af9be066c61ab18c', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(379, 'e5f04cc1f19e4dc0af9be066c61ab18c', '5fee570a35094ac8bbcb9c966cafe121', '8bb4470ff4e44bfcb320224740c455fe'),
(380, 'e5f04cc1f19e4dc0af9be066c61ab18c', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(381, 'e5f04cc1f19e4dc0af9be066c61ab18c', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(382, '4c661b09575f439ea4b16d21c63aa9bd', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(383, '4c661b09575f439ea4b16d21c63aa9bd', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(384, '4c661b09575f439ea4b16d21c63aa9bd', '5fee570a35094ac8bbcb9c966cafe121', '8bb4470ff4e44bfcb320224740c455fe'),
(385, '4c661b09575f439ea4b16d21c63aa9bd', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(386, '4c661b09575f439ea4b16d21c63aa9bd', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(387, 'de33af9f4b1443658dc480f043de40e2', '0b4233f384524755bfda45d33aaf723d', '73ccf0628dfe4c2e8d008b1c6e15c63c'),
(388, 'de33af9f4b1443658dc480f043de40e2', '57f70450f9b94fb781d285275948bf22', 'f5c188ccf33a40b397a8db7d4d58f3ce'),
(389, 'de33af9f4b1443658dc480f043de40e2', '5fee570a35094ac8bbcb9c966cafe121', '7ade1c8163a94893b9e195442bec508b'),
(390, 'de33af9f4b1443658dc480f043de40e2', '7fcf167e653845faa6234a5f11effb19', 'eb10dbd1c0994b6a93bbbd97e081d92f'),
(391, 'de33af9f4b1443658dc480f043de40e2', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18'),
(392, 'a24d2e1651ce4a71ac1a9c6b7261ccb1', '0b4233f384524755bfda45d33aaf723d', 'a8f878b4198344ddb5745abfc2153228'),
(393, 'a24d2e1651ce4a71ac1a9c6b7261ccb1', '57f70450f9b94fb781d285275948bf22', '6f83e0ef5fa2475298840fba24e95f1e'),
(394, 'a24d2e1651ce4a71ac1a9c6b7261ccb1', '5fee570a35094ac8bbcb9c966cafe121', '7ade1c8163a94893b9e195442bec508b'),
(395, 'a24d2e1651ce4a71ac1a9c6b7261ccb1', '7fcf167e653845faa6234a5f11effb19', 'e3cb3454156a43d7aa6180f25e796840'),
(396, 'a24d2e1651ce4a71ac1a9c6b7261ccb1', 'f869edfc9c334c069fb41e5c3fa510f9', 'd9b71ec3c4c046819f0cc49c11ff8c18');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kriteria`
--

CREATE TABLE `tb_kriteria` (
  `id_kriteria` char(32) NOT NULL,
  `kriteria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kriteria`
--

INSERT INTO `tb_kriteria` (`id_kriteria`, `kriteria`) VALUES
('0b4233f384524755bfda45d33aaf723d', 'Semester'),
('57f70450f9b94fb781d285275948bf22', 'IPK'),
('5fee570a35094ac8bbcb9c966cafe121', 'Penghasilan Orang Tua'),
('7fcf167e653845faa6234a5f11effb19', 'Alat Transportasi'),
('f869edfc9c334c069fb41e5c3fa510f9', 'Jumlah Tanggungan Orang Tua');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subkriteria`
--

CREATE TABLE `tb_subkriteria` (
  `id_sub` char(32) NOT NULL,
  `subkriteria` varchar(50) NOT NULL,
  `bobot` double NOT NULL,
  `kriteria_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_subkriteria`
--

INSERT INTO `tb_subkriteria` (`id_sub`, `subkriteria`, `bobot`, `kriteria_id`) VALUES
('08b84b1b3c7645e89e524a62a8e0438e', 'Rendah', 0, '5fee570a35094ac8bbcb9c966cafe121'),
('6f1883d1242c469685950095fee86bc6', 'Rendah', 0, 'f869edfc9c334c069fb41e5c3fa510f9'),
('6f83e0ef5fa2475298840fba24e95f1e', 'Cukup', 0.5, '57f70450f9b94fb781d285275948bf22'),
('73ccf0628dfe4c2e8d008b1c6e15c63c', 'Rendah', 0, '0b4233f384524755bfda45d33aaf723d'),
('7ade1c8163a94893b9e195442bec508b', 'Cukup', 0.5, '5fee570a35094ac8bbcb9c966cafe121'),
('8bb4470ff4e44bfcb320224740c455fe', 'Tinggi', 1, '5fee570a35094ac8bbcb9c966cafe121'),
('a8f878b4198344ddb5745abfc2153228', 'Tinggi', 1, '0b4233f384524755bfda45d33aaf723d'),
('aab268500f01410fa77340277107b134', 'Tinggi', 1, 'f869edfc9c334c069fb41e5c3fa510f9'),
('c0fc23caddad4d0d88f6c6e4d9401185', 'Rendah', 0, '7fcf167e653845faa6234a5f11effb19'),
('d9b71ec3c4c046819f0cc49c11ff8c18', 'Cukup', 0.5, 'f869edfc9c334c069fb41e5c3fa510f9'),
('e3cb3454156a43d7aa6180f25e796840', 'Tinggi', 1, '7fcf167e653845faa6234a5f11effb19'),
('eb10dbd1c0994b6a93bbbd97e081d92f', 'Cukup', 0.5, '7fcf167e653845faa6234a5f11effb19'),
('ecd99ebba8a94815827026c63d303a7e', 'Tinggi', 1, '57f70450f9b94fb781d285275948bf22'),
('f5c188ccf33a40b397a8db7d4d58f3ce', 'Rendah', 0, '57f70450f9b94fb781d285275948bf22'),
('f96884aee00044edb1b34f04b7bae8a2', 'Cukup', 0.5, '0b4233f384524755bfda45d33aaf723d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_datauji`
--
ALTER TABLE `tb_datauji`
  ADD PRIMARY KEY (`id_datauji`);

--
-- Indexes for table `tb_detaildatauji`
--
ALTER TABLE `tb_detaildatauji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_detaildatauji_datauji_id_6a172e77_fk_tb_datauji_id_datauji` (`datauji_id`),
  ADD KEY `tb_detaildatauji_kriteria_id_28c6ccd6_fk_tb_kriteria_id_kriteria` (`kriteria_id`),
  ADD KEY `tb_detaildatauji_subkriteria_id_0226d07e_fk_tb_subkri` (`subkriteria_id`);

--
-- Indexes for table `tb_kriteria`
--
ALTER TABLE `tb_kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `tb_subkriteria`
--
ALTER TABLE `tb_subkriteria`
  ADD PRIMARY KEY (`id_sub`),
  ADD KEY `tb_subkriteria_kriteria_id_3ce60593_fk_tb_kriteria_id_kriteria` (`kriteria_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_detaildatauji`
--
ALTER TABLE `tb_detaildatauji`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_detaildatauji`
--
ALTER TABLE `tb_detaildatauji`
  ADD CONSTRAINT `tb_detaildatauji_datauji_id_6a172e77_fk_tb_datauji_id_datauji` FOREIGN KEY (`datauji_id`) REFERENCES `tb_datauji` (`id_datauji`),
  ADD CONSTRAINT `tb_detaildatauji_kriteria_id_28c6ccd6_fk_tb_kriteria_id_kriteria` FOREIGN KEY (`kriteria_id`) REFERENCES `tb_kriteria` (`id_kriteria`),
  ADD CONSTRAINT `tb_detaildatauji_subkriteria_id_0226d07e_fk_tb_subkri` FOREIGN KEY (`subkriteria_id`) REFERENCES `tb_subkriteria` (`id_sub`);

--
-- Constraints for table `tb_subkriteria`
--
ALTER TABLE `tb_subkriteria`
  ADD CONSTRAINT `tb_subkriteria_kriteria_id_3ce60593_fk_tb_kriteria_id_kriteria` FOREIGN KEY (`kriteria_id`) REFERENCES `tb_kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
