-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2017 at 09:02 PM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id1611121_garasibuku`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`id1611121_garasibuku`@`%` PROCEDURE `autentikasi` (IN `nimmasuk` VARCHAR(9), IN `passwordmasuk` VARCHAR(200))  BEGIN
	select * from user where nim=nimmasuk and password=passwordmasuk;
END$$

CREATE DEFINER=`id1611121_garasibuku`@`%` PROCEDURE `bukubyid` (IN `idBukumasuk` INT)  BEGIN
	select * from buku where idBuku=idBukumasuk and status='Belum';
END$$

CREATE DEFINER=`id1611121_garasibuku`@`%` PROCEDURE `bukubykategori` (IN `jenisMkmasuk` VARCHAR(6))  BEGIN
	select * from buku where jenismk=jenisMkmasuk and status='Belum';
END$$

CREATE DEFINER=`id1611121_garasibuku`@`%` PROCEDURE `bukubynim` (IN `nimmasuk` VARCHAR(9))  BEGIN
	select * from buku where nim=nimmasuk and status='Belum';
END$$

CREATE DEFINER=`id1611121_garasibuku`@`%` PROCEDURE `bukubysearch` (IN `keywordmasuk` VARCHAR(50))  BEGIN
	select * from buku where matakuliah like CONCAT('%',keywordmasuk,'%') and status='Belum';
END$$

CREATE DEFINER=`id1611121_garasibuku`@`%` PROCEDURE `userbynim` (IN `nimmasuk` VARCHAR(9))  BEGIN
	SELECT * FROM user where nim=nimmasuk;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `idBuku` int(11) NOT NULL,
  `idMk` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `NIM` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `mataKuliah` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `jenisMk` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `deskripsi` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `harga` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `Photo` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Belum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`idBuku`, `idMk`, `NIM`, `mataKuliah`, `jenisMk`, `deskripsi`, `harga`, `Photo`, `status`) VALUES
(1, 'DIP100', 'J3C115022', 'Pendidikan Agama Islam', 'Umum', 'lumayan, masih layak dibaca, kertas bagus ga lusuh/kusut', '15000', '', 'Belum'),
(2, 'KMN107', 'J3C115022', 'Komunikasi Kelompok', 'Khusus', 'masih bagus', '50000', '', 'Belum'),
(3, 'KMN205', 'J3C115021', 'Event Organizer', 'Khusus', 'masih layak pakai', '30000', 'http://i.huffpost.com/gen/1675146/images/o-BOOKS-facebook.jpg', 'Terjual'),
(4, 'DIP109', 'J3C115021', 'Bahasa Indonesia', 'Umum', 'layak pakai nih:)', '10000', 'http://i.huffpost.com/gen/1675146/images/o-BOOKS-facebook.jpg', 'Terjual'),
(5, 'DIP100', 'J3M215131', 'Pendidikan Agama Islam', 'Umum', 'lumayanlaaah', '0', '', 'Belum'),
(6, 'KMN100', 'J3H115021', 'Pengantar Komunikasi', 'Khusus', '', '87875', '', 'Belum'),
(7, 'DIP100', 'J3C115021', 'Pendidikan Agama Islam', 'Umum', '', '0', '', 'Terjual'),
(8, 'DIP100', 'J3C115021', 'Pendidikan Agama Islam', 'Umum', '', '20000', '', 'Terjual'),
(9, 'DIP100', 'J3C115021', 'Pendidikan Agama Islam', 'Umum', '', '50000', '', 'Belum'),
(10, 'DIP100', 'J3C115021', 'Pendidikan Agama Islam', 'Umum', '', '0', '', 'Belum'),
(13, 'DIP100', 'J3C115021', 'Pendidikan Agama Islam', 'Umum', 'nyobaa', '0', '', 'Belum'),
(14, 'KMN100', 'J3T115021', 'Pengantar Komunikasi', 'Khusus', 'masih layak baca', '0', '', 'Belum'),
(15, 'DIP100', 'J3E115023', 'Pendidikan Agama Islam', 'Umum', 'ga dipake', '0', '', 'Belum'),
(16, 'DIP100', 'J3M115021', 'Pendidikan Agama Islam', 'Umum', '', '0', '', 'Terjual'),
(17, 'DIP100', 'J3M115021', 'Pendidikan Agama Islam', 'Umum', '', '0', '', 'Terjual'),
(18, 'DIP100', 'J3M115021', 'Pendidikan Agama Islam', 'Umum', '', '0', '', 'Belum'),
(19, 'DIP100', 'J3A111154', 'Pendidikan Agama Islam', 'Umum', 'jual ah', '90000', '', 'Belum'),
(20, 'DIP109', 'J3C115021', 'Bahasa Indonesia', 'Umum', 'cek', '12000', '', 'Belum');

--
-- Triggers `buku`
--
DELIMITER $$
CREATE TRIGGER `InsertIdBuku` BEFORE INSERT ON `buku` FOR EACH ROW BEGIN
    SET new.JenisMK =  (SELECT jenisMk FROM mataKuliah where idMk = new.idMk);
    SET new.mataKuliah = (SELECT mataKuliah FROM mataKuliah where idMk = new.idMk);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mataKuliah`
--

CREATE TABLE `mataKuliah` (
  `idMk` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `idPk` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `mataKuliah` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `jenisMk` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mataKuliah`
--

INSERT INTO `mataKuliah` (`idMk`, `idPk`, `mataKuliah`, `jenisMk`) VALUES
('DIP100', 'Z', 'Pendidikan Agama Islam', 'Umum'),
('DIP109', 'Z', 'Bahasa Indonesia', 'Umum'),
('KMN100', 'A', 'Pengantar Komunikasi', 'Khusus'),
('KMN102', 'A', 'Komunikasi Antar Pribadi', 'Khusus'),
('KMN103', 'A', 'Psikologi Komunikasi', 'Khusus'),
('KMN104', 'A', 'Teknik Wawancara', 'Khusus'),
('KMN105', 'A', 'Etika Kepribadian', 'Khusus'),
('KMN106', 'A', 'Komunikasi Efektif', 'Khusus'),
('KMN107', 'A', 'Komunikasi Kelompok', 'Khusus'),
('KMN108', 'A', 'Komunikasi Antar Budaya', 'Khusus'),
('KMN109', 'A', 'Retorika', 'Khusus'),
('KMN110', 'A', 'Bahasa Inggris 2', 'Khusus'),
('KMN201', 'A', 'Sosiologi Komunikasi', 'Khusus'),
('KMN202', 'A', 'Hubungan Masyarakat', 'Khusus'),
('KMN203', 'A', 'Komunikasi Bisnis', 'Khusus'),
('KMN204', 'A', 'Desain Grafis', 'Khusus'),
('KMN205', 'A', 'Event Organizer', 'Khusus'),
('KMN206', 'A', 'Media Relation', 'Khusus'),
('KMN207', 'A', 'Komunikasi Organisasi', 'Khusus'),
('KMN208', 'A', 'Teknik Penulisan Media Elektronik', 'Khusus'),
('KMN209', 'A', 'Tenik Penulisan Ilmiah', 'Khusus'),
('KMN210', 'A', 'Teknik Penulisan Media Cetak', 'Khusus'),
('KMN211', 'A', 'Fotografi', 'Khusus'),
('KMN212', 'A', 'Etika Profesi Komunikasi', 'Khusus'),
('KMN213', 'A', 'Bahasa Inggris 3', 'Khusus'),
('KMN301', 'A', 'Editing Audio Visual', 'Khusus'),
('KMN302', 'A', 'Penerbitan', 'Khusus'),
('KMN303', 'A', 'Distribusi Informasi', 'Khusus'),
('KMN304', 'A', 'Produksi Periklanan', 'Khusus'),
('KMN305', 'A', 'Produksi Film dan Video', 'Khusus'),
('KMN306', 'A', 'Produksi Siaran Radio', 'Khusus');

--
-- Triggers `mataKuliah`
--
DELIMITER $$
CREATE TRIGGER `insertIdPk` BEFORE INSERT ON `mataKuliah` FOR EACH ROW BEGIN
	IF SUBSTRING(new.idMK,1,3) = 'KMN' then
    BEGIN
		SET new.idPk = 'A';
        SET new.jenisMK = 'Khusus';
    END;
	ELSEIF SUBSTRING(new.idMK,1,3) = 'EKW' then
    BEGIN
        	SET new.idPk = 'B';
            SET new.jenisMK = 'Khusus';
    END;
	ELSEIF SUBSTRING(new.idMK,1,3) = 'EKW' then
    BEGIN
        	SET new.idPk = 'B';
            SET new.jenisMK = 'Khusus';
    END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'INF' then
                BEGIN
        	SET new.idPk = 'C';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'TEK' then
                BEGIN
        	SET new.idPk = 'D';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'JMP' then
                BEGIN
        	SET new.idPk = 'E';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'GZI' then
                BEGIN
        	SET new.idPk = 'F';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'TIB' then
                BEGIN
        	SET new.idPk = 'G';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'IKN' then
                BEGIN
        	SET new.idPk = 'H';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'TNK' then
                BEGIN
        	SET new.idPk = 'I';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'MAB' then
                BEGIN
        	SET new.idPk = 'J';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'MNI' then
                BEGIN
        	SET new.idPk = 'K';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'KIM' then
                BEGIN
        	SET new.idPk = 'L';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'LNK' then
                BEGIN
        	SET new.idPk = 'M';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'AKN' then
                BEGIN
        	SET new.idPk = 'N';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'PVT' then
                BEGIN
        	SET new.idPk = 'P';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'TMP' then
                BEGIN
        	SET new.idPk = 'T';
            SET new.jenisMK = 'Khusus';
            END;
            	ELSEIF SUBSTRING(new.idMK,1,3) = 'PPP' then
                BEGIN
        	SET new.idPk = 'W';
            SET new.jenisMK = 'Khusus';
            END;
          	  	ELSEIF SUBSTRING(new.idMK,1,3) = 'DIP' then
                BEGIN
        	SET new.idPk = 'Z';
            SET new.jenisMK = 'Umum';
            END;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `programKeahlian`
--

CREATE TABLE `programKeahlian` (
  `idPk` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `programKeahlian` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `programKeahlian`
--

INSERT INTO `programKeahlian` (`idPk`, `programKeahlian`) VALUES
('A', 'Komunikasi'),
('B', 'Ekowisata'),
('C', 'Manajemen Informatika'),
('D', 'Teknik Komputer'),
('E', 'Supervisor Jaminan Mutu Pangan'),
('F', 'Manajemen Industri Jasa Makanan dan Gizi'),
('G', 'Teknologi Industri Benih'),
('H', 'Teknologi Produksi dan Manajemen Perikanan Budidaya'),
('I', 'Teknologi dan Manajemen Ternak'),
('J', 'Manajemen Agribisnis'),
('K', 'Manajemen Industri'),
('L', 'Analisis Kimia'),
('M', 'Teknik dan Manajemen Lingkungan'),
('N', 'Akuntansi'),
('P', 'Paramedik Veteriner'),
('T', 'Teknologi dan Manajemen Produksi Perkebunan'),
('W', 'Teknologi Produksi dan Pengembangan Masyarakat Pertanian'),
('Z', 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `NIM` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `Nama` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ProgramKeahlian` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Alamat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NoHP` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` text COLLATE utf8_unicode_ci NOT NULL,
  `Bio` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`NIM`, `Nama`, `Password`, `ProgramKeahlian`, `Alamat`, `NoHP`, `Photo`, `Bio`, `latitude`, `longitude`) VALUES
('J3A111154', 'chakra', 'c0JNWa25DACJtmh7pt1lSw==\n', 'Komunikasi', 'bandung', '087721414744', '', 'biooo', -6.930842, 107.7179298),
('J3A115021', 'dkyi', 'BE718596E91202F2C974A950C8202A73', 'Komunikasi', 'bdg', '08987471077', '', 'haha', 0, 0),
('J3AXXXXXX', 'Putera', '/w/61LpaLf9D/CkJGap9QA==\n', 'Komunikasi', 'Bandung', '081809752129', '', 'wawawiwaw', -7.0242049, 107.5214851),
('J3C115003', 'Gojekk', 'q1xgjfWHMxA/mSRJs6Sq7w==\n', 'Manajemen Informatika', 'Bantarjati Bogor', '082234102649', '', 'bismillah', -6.581835, 106.8150033),
('J3C115021', 'Dicky Eka Ramadhan', 'poOzTrPbeso4/mbqFesM/g==', 'Manajemen Informatika', 'Perum. Babakan Sari I, Kota Bogor', '08987471077', 'https://cendolzboy.000webhostapp.com/test.jpg', 'Manusia Bandung 1/2 Bogor', -6.586604, 106.805351),
('J3C115022', 'Fulan', '022', 'Manajemen Informatika', 'Bogor', '08987471077', 'https://www.beli.com/app/uploads/2016/06/Buku.jpg', 'Fulan bin Fulaan', -6.586604, 106.805351),
('J3C115085', 'Vira', '123', 'Manajemen Informatika', 'jakarta', '088888888888', '', 'hehe????', 0, 0),
('J3C115098', 'dikiss', '098', 'Manajemen Informatika', 'bdg', '08987471077', '', 'nyobain lg', 0, 0),
('J3C115101', 'Fatmi Aulia Hanum', '101', 'Manajemen Informatika', 'Kost Gama Malabar Ujung', '081364359593', '', 'kenalan dong kaka wkwk', 0, 0),
('J3C115111', 'Odi', '111', '', 'Padang', '081264364748', 'https://www.beli.com/app/uploads/2016/06/Buku.jpg', '', 0, 0),
('J3C115112', 'Adam', '112', '', 'Padang', '0812445475858', 'https://www.beli.com/app/uploads/2016/06/Buku.jpg', '', 0, 0),
('J3C115115', 'Budi', 'SfCVuWujgeb39mtmB++ngA==\n', 'Manajemen Informatika', 'Lodaya II, Samping warkop abah', '08987471123', '', 'Masih jomblo', -6.5850029, 106.8088041),
('J3C115123', 'Dicky', '123', '', 'Bogor', '08987471077', 'https://www.beli.com/app/uploads/2016/06/Buku.jpg', '', 0, 0),
('J3C115444', 'Nyobain', '444', 'Manajemen Informatika', 'Bandung', '1234', '', 'asdsads', 0, 0),
('J3C115777', 'Diki Eka', '777', 'Manajemen Informatika', 'bsg', '08987471077', 'https://www.beli.com/app/uploads/2016/06/Buku.jpg', 'Ya gini weh aku mah', 0, 0),
('J3D115022', 'dikoysss', '156818C2C563E73BBC27B91C4C77E1DD', 'Teknik Komputer', 'bdg', '08987471077', '', '', 0, 0),
('J3E115023', 'dikiii jmp', '', 'Supervisor Jaminan Mutu Pangan', 'bdg', '089874710077', '', '', -6.585936, 106.805542),
('J3F115021', 'dakii', 'BE718596E91202F2C974A950C8202A73', 'Manajemen Industri Jasa Makanan dan Gizi', 'asgdhhd', '545454', '', '', 0, 0),
('J3G115021', 'Dickay', 'BE718596E91202F2C974A950C8202A73', 'Teknologi Industri Benih', 'Afrika', '08987471077', '', '', 0, 0),
('J3H115021', 'dikih', 'BE718596E91202F2C974A950C8202A73', 'Teknologi Produksi dan Manajemen Perikanan Budidaya', 'bdg', '08987471077', '', 'yaaa gtu dh', 0, 0),
('J3H115777', 'Agus', '777', 'Teknologi Produksi dan Manajemen Perikanan Budidaya', 'Bogor', '08987471077', '', '', 0, 0),
('J3I115021', 'dodooolll', 'BE718596E91202F2C974A950C8202A73', 'Teknologi dan Manajemen Ternak', 'hshsh', '54646', '', '', 0, 0),
('J3J115021', 'dky', 'uJBrMlKx423JdvuoNNRuuA==\n', 'Manajemen Agribisnis', 'ek', '08794334', '', '', 0, 0),
('J3K115021', 'dkihhaaaa', 'poOzTrPbeso4/mbqFesM/g==\n', 'Manajemen Industri', 'ek', '9898868', '', '', 0, 0),
('J3M115021', 'dikoysa', 'poOzTrPbeso4/mbqFesM/g==\n', 'Teknik dan Manajemen Lingkungan', 'bdg', '08987471077', '', '', -6.5858906, 106.8110163),
('J3M215131', 'erge', '131', 'Teknik dan Manajemen Lingkungan', 'bekasi', '081319781899', '', '', -6.590489, 106.807137),
('J3N115021', 'dikay', 'BE718596E91202F2C974A950C8202A73', 'Akuntansi', 'bdg', '08987471077', '', '', 0, 0),
('J3T115021', 'Dicky', 'BE718596E91202F2C974A950C8202A73', 'Teknologi dan Manajemen Produksi Perkebunan', 'bandung', '08987471077', '', 'jomblooo', -6.588378, 106.809128),
('J3W115777', 'Eka', '777', 'Teknologi Produksi dan Pengembangan Masyarakat Pertanian', 'Bandonkk', '08987471077', '', '', 0, 0);

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `insertUser` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	IF SUBSTRING(new.NIM,3,1) = 'A' then
		SET new.ProgramKeahlian = 'Komunikasi';
	ELSEIF SUBSTRING(new.NIM,3,1) = 'B' then
        	SET new.ProgramKeahlian = 'Ekowisata';
    ELSEIF SUBSTRING(new.NIM,3,1) = 'C' then
            SET new.ProgramKeahlian = 'Manajemen Informatika';
    ELSEIF SUBSTRING(new.NIM,3,1) = 'D' then
            SET new.ProgramKeahlian = 'Teknik Komputer';
    ELSEIF SUBSTRING(new.NIM,3,1) = 'E' then
            SET new.ProgramKeahlian = 'Supervisor Jaminan Mutu Pangan';
           ELSEIF SUBSTRING(new.NIM,3,1) = 'F' then
            SET new.ProgramKeahlian = 'Manajemen Industri Jasa Makanan dan Gizi';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'G' then
            SET new.ProgramKeahlian = 'Teknologi Industri Benih';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'H' then
            SET new.ProgramKeahlian = 'Teknologi Produksi dan Manajemen Perikanan Budidaya';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'I' then
            SET new.ProgramKeahlian = 'Teknologi dan Manajemen Ternak';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'J' then
            SET new.ProgramKeahlian = 'Manajemen Agribisnis';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'K' then
            SET new.ProgramKeahlian = 'Manajemen Industri';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'L' then
            SET new.ProgramKeahlian = 'Analisis Kimia';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'M' then
            SET new.ProgramKeahlian = 'Teknik dan Manajemen Lingkungan';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'N' then
            SET new.ProgramKeahlian = 'Akuntansi';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'P' then
            SET new.ProgramKeahlian = 'Paramedik Veteriner';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'T' then
            SET new.ProgramKeahlian = 'Teknologi dan Manajemen Produksi Perkebunan';
            ELSEIF SUBSTRING(new.NIM,3,1) = 'W' then
            SET new.ProgramKeahlian = 'Teknologi Produksi dan Pengembangan Masyarakat Pertanian';
	END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`idBuku`),
  ADD KEY `idMk` (`idMk`,`NIM`),
  ADD KEY `NIM` (`NIM`);

--
-- Indexes for table `mataKuliah`
--
ALTER TABLE `mataKuliah`
  ADD PRIMARY KEY (`idMk`),
  ADD KEY `idPk` (`idPk`);

--
-- Indexes for table `programKeahlian`
--
ALTER TABLE `programKeahlian`
  ADD PRIMARY KEY (`idPk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`NIM`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `idBuku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `user` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`idMk`) REFERENCES `mataKuliah` (`idMk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mataKuliah`
--
ALTER TABLE `mataKuliah`
  ADD CONSTRAINT `mataKuliah_ibfk_1` FOREIGN KEY (`idPk`) REFERENCES `programKeahlian` (`idPk`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
