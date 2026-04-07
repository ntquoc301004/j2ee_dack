-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 07, 2026 lúc 08:13 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_j2ee_dack`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(120) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `price`, `image`, `description`, `category_id`, `quantity`) VALUES
(1, 'One Piece Vol 10', 'Eiichiro Oda', 787000, 'https://cdn1.fahasa.com/media/catalog/product/9/7/9784087926040.jpg', 'One Piece イラスト集 Colorwalk Vol. 10 Dragon\r\n\r\n「ワノ国編」「STAMPEDE」「FILM RED」のカラーを一挙収録! 記念すべき画集第10巻!\r\n\r\n- 2019年~2023年までのイラストを計200点以上収録!\r\n- 3枚に及ぶ超豪華大型ポスターつき!\r\n- 『名探偵コナン』の青山剛昌先生とのレジェンド対談もフルバージョンで収録!\r\n- 尾田栄一郎の画業の歴史を知る決定版!!', 1, 10),
(2, 'Doraemon', 'Fujiko F. Fujio', 180000, 'https://cdn1.fahasa.com/media/catalog/product/9/7/9784092274129.jpg', 'Mèo máy đến từ tương lai', 1, 23),
(3, 'Batman: Year One', 'Frank Miller', 150000, 'https://th.bing.com/th/id/OIP.xq1RIGXpSPVCruE_0D5xIwHaLZ?w=115&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'Hành trình bắt đầu của Hiệp sĩ bóng đêm', 2, 3),
(4, 'Dragon Ball SD - 7 Viên Ngọc Rồng Nhí - Tập 1 - Buma, Goku Và 7 Viên Ngọc Rồng', 'Akira Toriyama, Naho Ohishi', 71000, 'https://cdn1.fahasa.com/media/catalog/product/d/r/dragon-ball-sd_7-vien-ngoc-rong-nhi_bia_tap-1.jpg', 'Dragon Ball SD - 7 Viên Ngọc Rồng Nhí - Tập 1 - Buma, Goku Và 7 Viên Ngọc Rồng\r\n\r\nNgày xửa ngày xưa, tương truyền trên thế giới có 7 viên ngọc rồng nằm rải rác khắp nơi. Ai tìm thấy và gom đủ 7 viên sẽ được rồng thần ban cho 1 điều ước thành sự thật. Một ngày nọ, Son Goku, cậu bé sống một mình nơi rừng sâu núi thẳm đã tình cờ gặp Bulma, cô gái dũng cảm đang phiêu lưu tìm 7 viên ngọc rồng. Goku quyết định đi theo giúp đỡ cô ấy và hành trình của họ đã bắt đầu trong tác phẩm SD này!! Đây là một series ngoại truyện được biến tấu phỏng theo cốt truyện chính của Dragon Ball, do hoạ sĩ Naho Ohishi đảm nhiệm, trong Dragon Ball SD, các nhân vật được minh hoạ rất đáng yêu theo style chibi, phong cách này còn được gọi chung là Super Deformation. Thế nên mới có cái tên SD - 7 viên ngọc rồng NHÍ!\r\n\r\nĐánh giá sản phẩm', 2, 20),
(5, 'Destination B2 - Grammar And Vocabulary With Answer Key', 'Malcom Mann, Steve Taylore', 133500, 'https://cdn1.fahasa.com/media/catalog/product/b/i/bia-truoc-destination-b2-dap-an-tren-app-khong-co-dap-an_2.jpg', 'Mô tả sản phẩm\r\nDestination B2 - Grammar And Vocabulary With Answer Key (Không Đáp Án)\r\n\r\nGiới thiệu cuốn sách Destination B2 – Grammar & Vocabulary\r\n\r\nDestination B2 là cuốn sách dành cho những bạn có trình độ anh ngữ B1 trở lên (~ 4.0-5.0 IELTS).\r\n\r\nCuốn sách tập trung vào những kiến thức ngữ pháp, từ vựng tiếng Anh thường xuyên sử dụng trong bài thi B2, thích hợp dành cho người học ở trình độ Intermediate, Upper Intermediate hoặc Advanced. Tài liệu trong sách dựa theo mức trình độ B2 chuẩn khung châu Âu.\r\n\r\nCuốn sách này có độ khó cao hơn một chút so với cuốn B1.\r\n\r\nNgoài ra, với các bạn học tiếng Anh đơn thuần chỉ là để “nâng trình ngữ pháp, từ vựng” phục vụ cho học tập, làm việc, nghiên cứu… thì đây cũng là bộ sách đánh giá không nên bỏ qua.', 5, 96),
(6, 'Con Đường Chẳng Mấy Ai Đi', 'M. Scott Peck', 115000, 'https://cdn1.fahasa.com/media/catalog/product/9/7/9786044009674.jpg', 'Con Đường Chẳng Mấy Ai Đi\r\n\r\nCó lẽ không quyển sách nào trong thế kỷ này có tác động sâu sắc đến đời sống trí tuệ và tinh thần của chúng ta hơn Con Đường Chẳng Mấy Ai Đi. Với doanh số trên 10 triệu bản in trên toàn thế giới và được dịch sang hơn 25 ngôn ngữ, đây là một hiện tượng trong ngành xuất bản, với hơn mười năm nằm trong danh sách Best-sellers của New York Times.\r\n\r\nVới cách hành văn kinh điển và thông điệp đầy thấu hiểu, quyển sách Con Đường Chẳng Mấy Ai Đi giúp chúng ta khám phá bản chất của các mối quan hệ và của một tinh thần trưởng thành. Quyển sách giúp chúng ta học cách phân biệt sự lệ thuộc với tình yêu; làm thế nào để trở thành những bậc phụ huynh tinh tế và nhạy cảm; và cuối cùng là làm thế nào để sống chân thật với chính mình.\r\n\r\nVới dòng mở đầu bất hủ của quyển sách, \"Cuộc đời này rất khó sống\", thể hiện quan điểm hành trình phát triển tinh thần là một chặng đường dài và gian nan, Tiến sĩ Peck thể hiện sự đồng cảm, nhẹ nhàng dẫn dắt độc giả vượt qua quá trình khó khăn đó, để thay đổi hướng tới tầm mức thấu hiểu bản thân sâu sắc hơn.', 6, 20),
(7, 'Nhà Đầu Tư Thông Minh - The Intelligent Investor', 'Benjamin Graham, Jason Zweig', 196000, 'https://cdn1.fahasa.com/media/catalog/product/n/h/nha-dau-thu-thong-minh-tb.jpg', 'Nhà Đầu Tư Thông Minh - The Intelligent Investor\r\n\r\nLà nhà tư vấn đầu tư vĩ đại nhất của thế kỷ 20, Benjamin Graham đã giảng dạy và truyền cảm hứng cho nhiều người trên khắp thế giới. Triết lý “đầu tư theo giá trị“ của Graham, bảo vệ nhà đầu tư khỏi những sai lầm lớn và dạy anh ta phát triển các chiến lược dài hạn, đã khiến Nhà đầu tư thông minhtrở thành cẩm nang của thị trường chứng khoán kể từ lần xuất bản đầu tiên vào năm 1949.\r\n\r\nTrải qua năm tháng, diễn biến thị trường đã chứng minh tính sáng suốt trong các chiến lược của Graham. Trong khi vẫn giữ lại toàn vẹn văn bản ban đầu của Graham, ấn phẩm tái bản này bổ sung thêm bình luận cập nhật của ký giả chuyên về tài chính nổi tiếng Jason Zweig. Cái nhìn của Zweig bao quát hiện thực của thị trường ngày nay, vạch ra sự tương tự giữa những ví dụ của Graham và các tít báo về tài chính hiện nay, giúp bạn đọc có sự hiểu biết kỹ lưỡng hơn về cách thức áp dụng các nguyên tắc của Graham.\r\n\r\nSống động và cần thiết, Nhà đầu tư thông minh là cuốn sách quan trọng nhất mà bạn có dịp đọc về cách thức đạt được các mục tiêu tài chính của mình.', 6, 21),
(8, 'Hồ Điệp Và Kình Ngư', 'Tuế Kiến', 119000, 'https://cdn1.fahasa.com/media/catalog/product/b/i/bia-2d_ho-diep-va-kinh-ngu_17307.jpg', 'HỒ ĐIỆP VÀ KÌNH NGƯ - BI KỊCH HAY HUYỀN THOẠI CỦA TÌNH YÊU?\r\nMột câu chuyện cuốn hút ngay từ những trang đầu tiên - Khi tình yêu trở thành sợi dây mong manh giữa sinh tử, phản bội và hy vọng. Khi một nàng hồ điệp nhỏ bé chạm trán với kình ngư mạnh mẽ, liệu đó là định mệnh hay chỉ là một giấc mộng chóng tàn?\r\n\r\n \r\n\r\nVỀ TÁC GIẢ: Tuế Kiến\r\nTuế Kiến là một tác giả được yêu thích trong dòng văn học lãng mạn Trung Quốc. \r\n\r\nCô nổi tiếng với những tác phẩm có nội dung sâu sắc, kịch tính, giàu cảm xúc nhưng cũng đầy tính hiện thực.\r\n\r\nVăn phong của Tuế Kiến không chỉ khiến độc giả đắm chìm trong từng câu chữ mà còn khơi gợi nhiều suy ngẫm về tình yêu, số phận và lựa chọn của con người. \r\n\r\nHồ Điệp Và Kình Ngư, cô một lần nữa chứng minh được khả năng dẫn dắt câu chuyện tài tình, khiến độc giả không thể rời mắt khỏi từng trang sách.\r\n\r\nVỀ DỊCH GIẢ: Diệp Châu\r\nDiệp Châu là dịch giả có nhiều kinh nghiệm trong việc chuyển ngữ các tác phẩm văn học Trung Quốc. \r\n\r\nVới sự nhạy bén trong ngôn ngữ và khả năng truyền tải cảm xúc tinh tế, bản dịch của Diệp Châu giúp độc giả Việt Nam dễ dàng cảm nhận được sự lãng mạn, đau thương và giằng xé trong từng câu chữ mà Tuế Kiến đã gửi gắm vào tác phẩm.\r\n\r\n \r\n\r\nTÓM TẮT NỘI DUNG SÁCH\r\nMột cô gái trẻ đang sống một cuộc đời bình thường nhưng lại vô tình bị cuốn vào thế giới đen tối đầy bí ẩn của một người đàn ông nguy hiểm nhưng đầy cuốn hút. Anh là kẻ đứng trên đỉnh cao quyền lực, là người mà cô không nên yêu. Nhưng càng muốn trốn chạy, càng không thể thoát.\r\n\r\nGiữa họ là yêu hay hận? Là bảo vệ hay hủy diệt?\r\nLà vận mệnh đã an bài hay chỉ là một trò đùa tàn nhẫn của số phận?\r\n\r\nNhững bí mật chôn giấu dần được phơi bày, những lựa chọn đau đớn buộc phải đưa ra. Khi đã bước vào ván cờ sinh tử này, liệu tình yêu có đủ để cứu rỗi cả hai?\r\n\r\nĐIỀU GÌ KHIẾN BẠN KHÔNG THỂ BỎ LỠ CUỐN SÁCH NÀY?\r\nĐây không chỉ là một câu chuyện tình yêu, mà còn là một bức tranh chân thực về con người giữa những lựa chọn nghiệt ngã.\r\n\r\nSự kết hợp hoàn hảo giữa lãng mạn và kịch tính, giữa những cảm xúc nhẹ nhàng và những cao trào đầy đau đớn.\r\n\r\nChứa đựng những câu chữ tinh tế, sắc bén, lột tả chân thực những góc khuất trong lòng người.\r\n\r\n \r\n\r\n“HỒ ĐIỆP VÀ KÌNH NGƯ” MANG ĐẾN ĐIỀU GÌ?\r\nMột tác phẩm mang đậm màu sắc bi kịch và hiện thực, nơi tình yêu không chỉ có hạnh phúc mà còn là thử thách khắc nghiệt của số phận.\r\n\r\nMột câu chuyện với kết cấu chặt chẽ, tuyến nhân vật có chiều sâu, thể hiện rõ sự giằng xé giữa lý trí và tình cảm, giữa quá khứ và tương lai.\r\n\r\nMột hành trình khai thác nội tâm đầy ám ảnh, nơi từng quyết định nhỏ bé có thể thay đổi cả cuộc đời con người.\r\n\r\nMột cuốn sách mang lại nhiều tầng ý nghĩa, không chỉ dừng lại ở tình yêu mà còn là số phận, sự lựa chọn và cái giá của những khát vọng.\r\n\r\n \r\n\r\n​”Hồ điệp và kình ngư” - một cuốn sách đáng đọc, đáng suy ngẫm và đáng có trong tủ sách của bất kỳ ai yêu thích những tác phẩm đầy chiều sâu! \r\n\r\n ', 2, 31),
(9, 'Trường Ca Achilles', 'Madeline Miller', 134000, 'https://cdn1.fahasa.com/media/catalog/product/i/m/image_195509_1_41170.jpg', 'TRƯỜNG CA ACHILLES - MỘT BẢN TÌNH CA BI TRÁNG DƯỚI ÁNH HOÀNG HÔN HY LẠP\r\nLấy cảm hứng từ sử thi Iliad, Madeline Miller đã tái hiện một câu chuyện tình yêu đầy say đắm nhưng cũng nhuốm màu bi kịch giữa hai người anh hùng Hy Lạp trong tác phẩm đầu tay của mình – Trường Ca Achilles.\r\n\r\nVỀ TÁC GIẢ: Madeline Miller\r\nLà nhà văn người Mỹ, chuyên gia về văn học Hy Lạp cổ đại. \r\n\r\nBà từng giảng dạy về Iliad và Odyssey suốt hơn 10 năm trước khi viết Trường Ca Achilles. \r\n\r\nTrường Ca Achilles đã giúp bà giành Giải Orange Prize 2012 – giải thưởng danh giá dành cho tiểu thuyết xuất sắc nhất của nữ tác giả.\r\n\r\nCuốn sách sau đó được đề cử Women\'s Prize năm 2019, và cùng với Trường ca Achilles đã đánh dấu một sự nghiệp văn chương rực rỡ của Madeline Miller.\r\n\r\nVỀ DỊCH GIẢ: Jack Frogg \r\nMột dịch giả tài năng, sinh ra tại Hà Nội và hiện đang sinh sống tại Aix-en-Provence. Với niềm đam mê văn học và ngôn ngữ, anh đã chuyển ngữ thành công nhiều tác phẩm nổi tiếng.\r\n\r\nTiểu thuyết Trường Ca Achilles, đã mang đến một bản chuyển ngữ mượt mà, giàu cảm xúc, giúp độc giả Việt Nam cảm nhận trọn vẹn vẻ đẹp bi tráng vốn có. \r\n\r\nVới sự tinh tế trong cách dùng từ và khả năng nắm bắt tinh thần nguyên tác, bản dịch này không chỉ tái hiện một câu chuyện tình yêu đầy mê hoặc mà còn khắc họa rõ nét khí chất hào hùng của thời đại sử thi Hy Lạp.\r\n\r\nTÓM TẮT NỘI DUNG SÁCH\r\n\"Anh sẽ không bao giờ để họ làm tổn thương em.\"\r\n\r\nLấy cảm hứng từ Iliad, Trường Ca Achilles là câu chuyện về tình yêu, danh vọng và bi kịch giữa hai con người bị ràng buộc bởi số phận.\r\n\r\nPatroclus – chàng hoàng tử bị lưu đày, mang trong mình tâm hồn dịu dàng và khao khát yêu thương. Achilles – vị chiến binh huyền thoại, người được tiên tri sẽ trở thành anh hùng vĩ đại nhất Hy Lạp. Họ gặp nhau, gắn bó bên nhau, và tình yêu nảy nở giữa những ngày tuổi trẻ.\r\n\r\n\"Patroclus, em là ánh sáng của đời anh.\"\r\n\r\nThế nhưng, định mệnh không bao giờ ưu ái những kẻ yêu nhau. Khi chiến tranh thành Troy nổ ra, Achilles buộc phải lựa chọn giữa danh vọng bất tử và tình yêu duy nhất đời mình. Còn Patroclus, dù biết rõ cái chết đang chờ đợi, vẫn tình nguyện ở bên người mình yêu.\r\n\r\nDưới ngòi bút lãng mạn và đầy mê hoặc của Madeline Miller, Trường Ca Achilles không chỉ là một câu chuyện về chiến tranh và vinh quang, mà còn là một bản tình ca đầy khắc khoải, nơi tình yêu vĩnh cửu tỏa sáng ngay cả giữa bi kịch đẫm máu.\r\n\r\n\"Ngay cả khi cái chết chia cắt chúng ta, anh vẫn sẽ tìm em.\"\r\n\r\nQuyển sách mang đến điều gì?\r\nMột cách nhìn mới về huyền thoại Achilles – không chỉ là chiến binh vĩ đại mà còn là một con người với tình cảm sâu sắc.\r\n\r\nCâu chuyện tình yêu đầy đau đớn giữa Achilles và Patroclus, được viết bằng ngôn từ đầy mê hoặc.\r\n\r\nMột tiểu thuyết sử thi hiện đại, vừa bi tráng vừa lãng mạn, làm sống lại những huyền thoại cổ đại theo cách chân thực nhất.\r\n\r\nTại sao nên đọc & sở hữu \"Trường Ca Achilles\"?\r\nBest-seller quốc tế, được đánh giá cao bởi độc giả và giới phê bình.\r\n\r\nDành cho những ai yêu thích thần thoại Hy Lạp, sử thi và những câu chuyện cảm động về tình yêu, danh dự và số phận.\r\n\r\nMột tác phẩm kinh điển của thế kỷ 21, từng khiến hàng triệu độc giả trên thế giới rơi nước mắt.\r\n\r\n \r\n\r\nMua ngay \"Trường Ca Achilles\" để đắm chìm trong một thiên sử thi về tình yêu, lòng dũng cảm và bi kịch huyền thoại!\r\n\r\n ', 3, 22),
(10, 'Dược Sư Tự Sự - Tập 8', 'Touko Shino, Hyuganatsu', 112000, 'https://cdn1.fahasa.com/media/catalog/product/d/u/duoc-su-tu-tu_tap-8_qua-tang.jpg', '[Light Novel] Dược Sư Tự Sự - Tập 8\r\n\r\nDiêu đã bị tổn hại cơ thể do trúng độc, đến lúc cô có thể quay lại làm việc ở thái y viện, một lượng sách vở rất lớn được đưa tới chỗ Miêu Miêu. Người gửi là quân sư quái nhân La Hán. Có vẻ ông ta đã làm ra một lượng lớn sách dạy cờ vây nên mới gửi sang cho Miêu Miêu. Miêu Miêu chẳng hứng thú, định bán quách chúng đi, nào ngờ cuốn sách của La Hán đã khiến cờ vây trở thành trào lưu trong hoàng cung.\r\n\r\nBên cạnh đó, Nhâm Thị bình thường đã bận bịu, giờ còn chồng chất thêm vụ ồn ào đầu độc vu nữ Sa Âu và báo cáo về nạn châu chấu, phải nói là tốităm mặt mũi. Trong tình cảnh đó, Nhâm Thị biết chuyện người ta đang lên kế hoạch tổ chức giải đấu cờ vây trong cung, bèn đến đàm phán trực tiếp với La Hán. Nhâm Thị sẽ lấy danh nghĩa của mình, cung cấp địa điểm tổ chức giải đấu, đổi lại, hắn thuyết phục La Hán xử lí những công việc mà ông ta đang chểnh mảng....\r\n\r\n* DƯỢC SƯ TỰ SỰ là series light-novel thể loại trinh thám vô cùng độc đáo lấy bối cảnh cung đình. Truyện đã được chuyển thể manga và anime ra mắt vào cuối năm 2023. Toàn series đã vượt mốc 45 triệu bản tại thị trường Nhật Bản và luôn thống trị các bảng xếp hạng bán chạy mỗi khi ra tập mới! Anime đã chiếu xong mùa 2 và dự kiến sẽ có mùa 3 trong thời gian tới.', 4, 230),
(11, 'IELTS Writing - Viết Luận Chất Như Nước Cất', 'Nhiều Tác Giả', 156000, 'https://cdn1.fahasa.com/media/catalog/product/9/7/9786326100969.jpg', 'IELTS Writing - Viết Luận Chất Như Nước Cất\r\n\r\nTrong bối cảnh tiếng Anh trở thành “ngôn ngữ toàn cầu” và AI đang thay đổi cách chúng ta học tập, cuốn sách IELTS Writing - Viết luận “chất như nước cất” khuyến khích người học rèn luyện tư duy phản biện, khả năng triển khai ý tưởng mạch lạc, thuyết phục – những kỹ năng ngày càng quan trọng trong thế giới mà AI có thể viết thay con người.\r\n\r\nNguyễn Hoàng Huy (chủ biên) từng xuất phát ở mức 6.5 IELTS Writing và đã kiên trì nâng điểm số lên 9.0 tuyệt đối. Trong hành trình này, anh vừa rèn ngôn ngữ, mài tư duy, vừa học cách phân tích cấu trúc lập luận và thử nghiệm nhiều phương pháp khác nhau. Từ đó, Huy cùng nhóm cộng sự đã chắt lọc và giới thiệu đến bạn đọc 3 kỹ thuật viết “độc quyền”:\r\n\r\n- Phân tích tương phản thời gian (TCA): kỹ thuật giúp bạn đặt vấn đề vào bối cảnh quá khứ – hiện tại để xây dựng lập luận sâu sắc.\r\n\r\n- Liên kết đặc điểm – tính trạng (CTA): kỹ thuật giúp bạn giải thích hành vi bằng việc kết hợp đặc tính cá nhân và yếu tố xã hội.\r\n\r\n- Lập luận dựa trên bối cảnh (CBA): kỹ thuật giúp bạn khai thác tính đa chiều của một hiện tượng hoặc sự vật.\r\n\r\nBa kỹ thuật này được thiết kế riêng cho phần IELTS Writing Task 2, đồng thời cũng mang lại lợi ích trong việc viết luận ở bậc đại học, nghiên cứu hay công việc chuyên môn.\r\n\r\nNgoài ba kỹ thuật nêu trên, cuốn sách cung cấp 15 bài luận mẫu được chọn lọc, kèm danh mục từ vựng theo chủ đề. Mỗi bài viết đều được phân tích chi tiết từ mở bài, thân bài đến kết bài. Đây không chỉ là tài liệu ôn thi, mà còn là “công cụ tư duy” giúp người học làm chủ nghệ thuật viết luận trong mọi lĩnh vực.', 5, 2300),
(12, 'Trốn Lên Mái Nhà Để Khóc', 'Lam', 80000, 'https://cdn1.fahasa.com/media/catalog/product/b/_/b_a-1-tr_n-l_n-m_i-nh_-_-kh_c-2.jpg', 'TRỐN LÊN MÁI NHÀ ĐỂ KHÓC - NƠI CẢM XÚC ĐƯỢC BUÔNG LỎNG, KÝ ỨC ĐƯỢC CẤT LỜI\r\n\"Có những ngày chẳng ai hiểu mình, chẳng ai cần mình, chẳng ai thương mình. Và những ngày đó, mái nhà là nơi duy nhất tôi thấy an toàn.\"\r\n\r\n\"Trốn Lên Mái Nhà Để Khóc\" không chỉ là câu chuyện của riêng tác giả, mà còn là những mảnh ghép ký ức của mỗi người. Một cuốn sách dành cho những trái tim nhạy cảm, cho những ai từng giấu nước mắt sau nụ cười, từng thu mình vào một góc chỉ để đối diện với chính mình.\r\n\r\n \r\n\r\nVỀ TÁC GIẢ: Lam\r\nTác giả trẻ, nổi bật với lối viết tinh tế, giàu cảm xúc.\r\n\r\nChuyên viết về tuổi thơ, ký ức, nỗi buồn và hành trình trưởng thành.\r\n\r\nNgôn từ nhẹ nhàng nhưng chạm sâu vào tâm hồn độc giả.\r\n\r\n\"Trốn Lên Mái Nhà Để Khóc\" là nơi để những tâm hồn lạc lõng tìm thấy sự đồng điệu.\r\n\r\nTóm tắt nội dung sách \r\nMái nhà – nơi cao nhất trong căn nhà nhưng lại là nơi sâu nhất trong tâm hồn một đứa trẻ. Ở đó, Lam đã lắng nghe nhịp thở của quá khứ, nơi có giọng nói của mẹ, bàn tay của bà, những ký ức đẹp đẽ xen lẫn những nỗi đau khó gọi tên.\r\n\r\n \r\n\r\n\"Lớn lên, tôi nhận ra mái nhà không phải nơi trú ẩn, mà là nơi để chuẩn bị cho những hành trình tiếp theo. Nhưng đôi khi, tôi vẫn muốn trốn lên đó, để được khóc mà không ai nhìn thấy.\"\r\n\r\nCuốn sách là những dòng tâm sự chân thật, một hành trình quay về thời thơ ấu để tìm kiếm chính mình.\r\n\r\nCuốn sách này mang đến cho bạn điều gì?\r\nSự đồng cảm sâu sắc – Nếu bạn từng cảm thấy cô đơn, lạc lõng giữa thế giới này, hãy để những trang sách an ủi tâm hồn bạn.\r\n\r\nLời thì thầm từ quá khứ – Những ký ức tưởng chừng bị lãng quên, nhưng lại là sợi dây giữ ta không lạc mất chính mình.\r\n\r\nGóc nhìn mới về gia đình & tình thân – Để bạn hiểu rằng, đôi khi ta phải rời đi để biết mình thuộc về đâu.\r\n\r\nTại sao bạn nên đọc \"Trốn Lên Mái Nhà Để Khóc\"?\r\nAi cũng cần một nơi để trốn, để khóc, để rồi đủ mạnh mẽ bước tiếp.\r\n\r\nCó những nỗi buồn không cần giải thích, chỉ cần một cuốn sách để cảm thấy không cô đơn.\r\n\r\nTrên hành trình trưởng thành, chúng ta đều cần một mái nhà trong tim để quay về.\r\n\r\n \r\n\r\n\"Trốn Lên Mái Nhà Để Khóc\" – Cuốn sách dành cho những người đã từng lạc lõng, từng đau, từng khóc… nhưng vẫn kiên cường bước tiếp…', 6, 230),
(13, 'Mẹ Làm Gì Có Ước Mơ', 'Hạ Mer', 66000, 'https://cdn1.fahasa.com/media/catalog/product/9/8/98bde27a91ea4bb412fb.jpg', '“Ước mơ của mẹ là gì?”\r\n\r\n“Thì cho chúng mày ăn học đàng hoàng, đầy đủ để mai sau đỡ khổ.”\r\n\r\n“Không, ước mơ khác cơ.”\r\n\r\n“Mai sau chúng mày lập gia đình, chọn được đúng người, vợ chồng yêu thương nhau.”\r\n\r\n“Ước mơ dành riêng cho bản thân mẹ cơ mà.”\r\n\r\n“MẸ THÌ LÀM GÌ CÓ ƯỚC MƠ.”\r\n\r\nBạn có bao giờ hỏi ước mơ của bố mẹ là gì? Hoặc dù có hỏi bố mẹ cũng chỉ trả lời qua loa như “Làm gì có…”. Nhưng bạn biết không, làm gì có ai trên thế giới này không có ước mơ cơ chứ, chỉ là ước mơ của bố mẹ chúng ta được cất giấu rất sâu trong tim và đánh đổi bằng nụ cười của những đứa con mà thôi.\r\n\r\nTại sao mẹ lại chẳng có nổi một ước mơ cho riêng mình? Phải chăng gánh vai mẹ đã quá mỏi mệt với cơm áo gạo tiền, với những bữa ăn và học phí của con.\r\n\r\nÀ không, mẹ có ước mơ đấy chứ. Mẹ ước mơ có một người bố, rồi mẹ cho nó cả một gia đình. Mẹ ước mơ được tới trường, nên mẹ cho nó học con chữ. Mẹ ước mơ được một bữa no, nên dẫu có phải đi làm vất vả khổ cực đến đâu mẹ cũng cho nó được bữa cơm ngon. Chỉ khác một điều, ước mơ của mẹ là các con mất rồi.\r\n\r\nĐó là hình ảnh của MẸ mà bạn sẽ bắt gặp trong “Mẹ làm gì có ước mơ”. Tựa một thước phim quay chậm đưa bạn trở lại những ngày bé thơ, dưới vòng tay chai sạn nhưng đầy ấm áp của mẹ. Khi tạm cất ước mơ của mình sang một bên, ước mơ của mẹ “hóa ra con từ bao giờ” và “thế giới của mẹ chính là con”. Bố mẹ đã dồn hết khả năng của mình, dành cho con những gì tốt nhất để con được thực hiện ước mơ.\r\n\r\nChúng ta đừng chỉ mải chạy theo ước mơ của mình mà quên mất những người đã hy sinh cả cuộc đời để mình có cơ hội thực hiện ước mơ ấy. Có thể gọi điện về nhà thường xuyên hơn, hoặc nếu có thể, hãy trở về nhà nếu đã đi đủ lâu. Đó là những điều mà Hạ Mer muốn gửi gắm đến bạn qua “Mẹ làm gì có ước mơ”.\r\n\r\nHy vọng cuốn sách sẽ giúp bạn thêm trân quý từng khoảnh khắc bên cạnh những người mà mình yêu thương.', 3, 3238);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'Comic'),
(6, 'Kỹ năng sống'),
(1, 'Manga'),
(4, 'Novel'),
(5, 'Sách ngoại ngữ'),
(3, 'Tiểu thuyết');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_price` decimal(12,2) NOT NULL,
  `status` enum('APPROVED','CANCELLED','PAID','PENDING') NOT NULL,
  `ship_district` varchar(80) DEFAULT NULL,
  `ship_note` varchar(500) DEFAULT NULL,
  `ship_phone` varchar(20) DEFAULT NULL,
  `ship_province` varchar(80) DEFAULT NULL,
  `ship_recipient_name` varchar(120) DEFAULT NULL,
  `ship_street_detail` varchar(255) DEFAULT NULL,
  `ship_ward` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `total_price`, `status`, `ship_district`, `ship_note`, `ship_phone`, `ship_province`, `ship_recipient_name`, `ship_street_detail`, `ship_ward`) VALUES
(3, 3, '2026-03-29 12:07:53', 267000.00, 'PAID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, '2026-03-29 12:12:15', 133500.00, 'PAID', 'THU DUC', 'tyer', '0876337229', 'TP HCM', 'sơn trương', '1230 Đường Kha Vạn Cân', 'long thanh my'),
(5, 3, '2026-03-29 12:38:26', 150000.00, 'PENDING', 'THU DUC', NULL, '0876337229', 'TP HCM', 'sơn trương', '1230 Đường Kha Vạn Cân', 'long thanh my'),
(10, 7, '2026-04-04 19:28:02', 119000.00, 'PENDING', 'thu duc', 'ew', '0876337229', 'tp hcm', '2644 - Nguyễn Tuấn Quốc', 'fds', 'few'),
(11, 5, '2026-04-04 19:28:41', 66000.00, 'PENDING', 'thu duc', 'ewff', '0876337229', 'tp hcm', 'Quốc', 'fewf', 'few'),
(12, 5, '2026-04-04 19:30:11', 66000.00, 'APPROVED', 'thu duc', 'ewff', '0876337229', 'tp hcm', 'Quốc', 'fewf', 'few'),
(13, 7, '2026-04-05 03:08:21', 66000.00, 'PENDING', 'dsa', NULL, '0876337229', 'dsa', '2644 - Nguyễn Tuấn Quốc', 'dsad', 'sad'),
(14, 7, '2026-04-05 04:12:49', 66000.00, 'PENDING', 'vds', 'vds', '0876337229', 'dv', '2644 - Nguyễn Tuấn Quốc', 'vds', 'dvs');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `book_id`, `quantity`, `price`) VALUES
(4, 3, 5, 2, 133500.00),
(5, 4, 5, 1, 133500.00),
(6, 5, 3, 1, 150000.00),
(11, 10, 8, 1, 119000.00),
(12, 11, 13, 1, 66000.00),
(13, 12, 13, 1, 66000.00),
(14, 13, 13, 1, 66000.00),
(15, 14, 13, 1, 66000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` bigint(20) NOT NULL,
  `expiry` datetime(6) NOT NULL,
  `token` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `expiry`, `token`, `user_id`) VALUES
(22, '2026-03-31 20:37:00.000000', 'c2a65878-8455-484e-a2a8-61e53a7c3874', 4),
(25, '2026-04-05 02:42:26.000000', '26e87c0d-dbb5-4a7d-a26d-9b3e50cb6f19', 8),
(29, '2026-04-05 05:11:01.000000', 'fc74bed4-fbe2-47af-9936-70eda4b44d4c', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` enum('ADMIN','CUSTOMER') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'CUSTOMER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `district` varchar(80) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `province` varchar(80) DEFAULT NULL,
  `street_detail` varchar(255) DEFAULT NULL,
  `ward` varchar(80) DEFAULT NULL,
  `google_sub` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `full_name`, `district`, `phone`, `province`, `street_detail`, `ward`, `google_sub`) VALUES
(1, 'admin', '$2a$12$3PQJSXvCuRSif8trNLcPluJikrNc82pCjU/rGd3RuCXFc/jtvvPU2', 'admin@gmail.com', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'user2', '$2a$10$m3pTsgoD8PF/qSnFAOXvL.k3B.HuGmeYqy94EMZDLPAX5HcIN9yHq', 'user2@gmail.com', 'sơn trương', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'qqq3010', '$2a$10$5DvJNhMu1dlAVkUQ1YBIZe4Q2xlMChkAGPsutROtjkr5fzA7s..y6', 'mynamequoc@gmail.com', 'Anh Tai', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'quocquoc1', '$2a$10$gk.DxoCrGSzdtCxlahnYCeyK5VdXl0ULsLGHGc2eksGMaslrfKq5W', 'ntquoc304@gmail.com', 'Quốc', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'ntquoc301004', '$2a$10$FYQLalLHtmYXjLcNVtNNUOAOcxpfj2.vdCAd1xZN./K94Hvq5Fut.', 'ntquoc301004@gmail.com', '2644 - Nguyễn Tuấn Quốc', NULL, NULL, NULL, NULL, NULL, '106414140162126829350'),
(8, 'tiendat31082004', '$2a$10$./vNjbpoN75Vtbbi9Up2QeFrj5wQiHxdfrr6xVcwBEPDbzE2Ph/Pu', 'tiendat31082004@gmail.com', '8664_Nguyễn Tiến Đạt', NULL, NULL, NULL, NULL, NULL, '117628942325365788928');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_cart_item`
--

CREATE TABLE `user_cart_item` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_cart_item`
--

INSERT INTO `user_cart_item` (`id`, `quantity`, `book_id`, `user_id`) VALUES
(4, 1, 6, 2),
(6, 3, 6, 3),
(7, 2, 5, 3),
(8, 2, 4, 3),
(9, 1, 3, 3),
(10, 1, 1, 3),
(11, 1, 5, 2),
(12, 1, 4, 2),
(17, 2, 1, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(3, 2),
(4, 2),
(5, 2),
(7, 2),
(8, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK71lqwbwtklmljk3qlsugr1mig` (`token`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `UKfla1a4b51hmn2n4kuw14u210i` (`google_sub`);

--
-- Chỉ mục cho bảng `user_cart_item`
--
ALTER TABLE `user_cart_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user_cart_item_user_book` (`user_id`,`book_id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user_cart_item`
--
ALTER TABLE `user_cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
