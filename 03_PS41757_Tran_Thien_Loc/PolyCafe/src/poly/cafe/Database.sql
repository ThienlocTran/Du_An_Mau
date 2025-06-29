---- XÓA TOÀN BỘ BẢNG THEO THỨ TỰ RÀNG BUỘC
--IF OBJECT_ID('dbo.BillDetails', 'U') IS NOT NULL DROP TABLE dbo.BillDetails;
--IF OBJECT_ID('dbo.Bills', 'U') IS NOT NULL DROP TABLE dbo.Bills;
--IF OBJECT_ID('dbo.Drinks', 'U') IS NOT NULL DROP TABLE dbo.Drinks;
--IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL DROP TABLE dbo.Categories;
--IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
--IF OBJECT_ID('dbo.Cards', 'U') IS NOT NULL DROP TABLE dbo.Cards;
--GO
--use QLDA
---- TẠO LẠI DATABASE VÀ SỬ DỤNG
--IF DB_ID('POLYCAFE_DUANMAU') IS NOT NULL DROP DATABASE POLYCAFE_DUANMAU;
--CREATE DATABASE POLYCAFE_DUANMAU;
--GO
--USE POLYCAFE_DUANMAU;
--GO

-- TẠO BẢNG USERS
CREATE TABLE Users (
    Username NVARCHAR(20) PRIMARY KEY
    ,Password NVARCHAR(50)
    ,Enabled BIT
    ,Fullname NVARCHAR(100)
    ,Photo NVARCHAR(100)
    ,Manager BIT
);
GO

-- TẠO BẢNG CARDS
CREATE TABLE Cards (
    Id INT PRIMARY KEY
    ,Status BIT
);
GO

-- TẠO BẢNG CATEGORIES
CREATE TABLE Categories (
    Id NVARCHAR(10) PRIMARY KEY
    ,Name NVARCHAR(50)
);
GO

-- TẠO BẢNG DRINKS
CREATE TABLE Drinks (
    Id NVARCHAR(20) PRIMARY KEY
    ,Name NVARCHAR(100)
    ,UnitPrice FLOAT
    ,Discount FLOAT
    ,Image NVARCHAR(100)
    ,Available BIT
    ,CategoryId NVARCHAR(10)
    ,FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);
GO

-- TẠO BẢNG BILLS
CREATE TABLE Bills (
    Id BIGINT NOT NULL IDENTITY(10000, 1)
    ,Username NVARCHAR(20) NOT NULL
    ,CardId INT NOT NULL
    ,Checkin DATETIME NOT NULL
    ,Checkout DATETIME NULL
    ,Status INT NOT NULL
    ,PRIMARY KEY(Id)
    ,FOREIGN KEY(Username) REFERENCES Users(Username) ON UPDATE CASCADE
    ,FOREIGN KEY(CardId) REFERENCES Cards(Id) ON UPDATE CASCADE
);
GO

-- TẠO BẢNG BILLDETAILS
CREATE TABLE BillDetails (
    Id BIGINT NOT NULL IDENTITY(100000, 1)
    ,BillId BIGINT NOT NULL
    ,DrinkId NVARCHAR(20) NOT NULL
    ,UnitPrice FLOAT NOT NULL
    ,Discount FLOAT NOT NULL
    ,Quantity INT NOT NULL
    ,PRIMARY KEY(Id)
    ,FOREIGN KEY(BillId) REFERENCES Bills(Id) ON DELETE CASCADE
    ,FOREIGN KEY(DrinkId) REFERENCES Drinks(Id) ON UPDATE CASCADE
);
GO

-- DỮ LIỆU USERS (5 NGƯỜI)
INSERT INTO Users (Username, Password, Enabled, Fullname, Photo, Manager) VALUES
    ('admin01', '123', 1, N'Nguyễn Văn A', 'admin01.jpg', 1)
    ,('admin02', '123', 1, N'Nguyễn Văn B', 'admin02.jpg', 1)
    ,('staff01', '123', 1, N'Trần Thị C', 'staff01.jpg', 0)
    ,('staff02', '123', 1, N'Trần Thị D', 'staff02.jpg', 0)
    ,('staff03', '123', 1, N'Trần Thị E', 'staff03.jpg', 0)
;
GO

-- DỮ LIỆU CARDS (12 THẺ, random status)
INSERT INTO Cards (Id, Status) VALUES
    (1, 1)
    ,(2, 0)
    ,(3, 1)
    ,(4, 1)
    ,(5, 0)
    ,(6, 1)
    ,(7, 1)
    ,(8, 1)
    ,(9, 1)
    ,(10, 1)
    ,(11, 0)
    ,(12, 1)
;
GO

-- DỮ LIỆU CATEGORIES
INSERT INTO Categories (Id, Name) VALUES
    ('CAT01', N'Coffee')
    ,('CAT02', N'Tea')
    ,('CAT03', N'Smoothie')
    ,('CAT04', N'Milk Tea')
    ,('CAT05', N'Juice')
    ,('CAT06', N'Soda')
    ,('CAT07', N'Cake')
    ,('CAT08', N'Snack')
;
GO

-- DỮ LIỆU DRINKS (đa dạng, mỗi loại 8 món, giữ lại drink gốc)
INSERT INTO Drinks (Id, Name, UnitPrice, Discount, Image, Available, CategoryId) VALUES
    ('D001', N'Latte', 45000, 10, 'latte.jpg', 1, 'CAT01')
    ,('D002', N'Cappuccino', 50000, 0, 'cappuccino.jpg', 1, 'CAT01')
    ,('D003', N'Green Tea', 30000, 5, 'greentea.jpg', 1, 'CAT02')
    ,('D004', N'Peach Tea', 32000, 10, 'peachtea.jpg', 1, 'CAT02')
    ,('CF01', N'Cà phê Đen', 30000, 0, 'capheden.jpg', 1, 'CAT01')
    ,('CF02', N'Cà phê Sữa', 35000, 0, 'caphe_sua.jpg', 1, 'CAT01')
    ,('CF03', N'Bạc Xỉu', 40000, 5, 'bacxiu.jpg', 1, 'CAT01')
    ,('CF04', N'Cà phê Cốt Dừa', 45000, 10, 'caphecotdua.jpg', 1, 'CAT01')
    ,('CF05', N'Cà phê Cứt Chồn', 100000, 0, 'caphecutchon.jpg', 1, 'CAT01')
    ,('CF06', N'Espresso', 50000, 0, 'espresso.jpg', 1, 'CAT01')
    ,('CF07', N'Mocha', 47000, 5, 'mocha.jpg', 1, 'CAT01')
    ,('CF08', N'Americano', 42000, 0, 'americano.jpg', 1, 'CAT01')
    ,('TE01', N'Trà Đào', 35000, 0, 'tradao.jpg', 1, 'CAT02')
    ,('TE02', N'Trà Vải', 35000, 0, 'travail.jpg', 1, 'CAT02')
    ,('TE03', N'Trà Xanh', 30000, 5, 'traxanh.jpg', 1, 'CAT02')
    ,('TE04', N'Trà Hoa Cúc', 32000, 0, 'trahoacuc.jpg', 1, 'CAT02')
    ,('TE05', N'Trà Cúc Bạch', 34000, 0, 'tracucbach.jpg', 1, 'CAT02')
    ,('TE06', N'Trà Nhân Sâm', 40000, 10, 'tranhansam.jpg', 1, 'CAT02')
    ,('TE07', N'Trà Sữa', 37000, 0, 'trasua.jpg', 1, 'CAT02')
    ,('TE08', N'Trà Chanh', 32000, 0, 'trachanh.jpg', 1, 'CAT02')
    ,('SM01', N'Sinh tố Bơ', 40000, 0, 'sinh_tobo.jpg', 1, 'CAT03')
    ,('SM02', N'Sinh tố Dâu', 40000, 0, 'sinhtodau.jpg', 1, 'CAT03')
    ,('SM03', N'Sinh tố Xoài', 40000, 0, 'sinhtoxoai.jpg', 1, 'CAT03')
    ,('SM04', N'Sinh tố Chuối', 40000, 0, 'sinhtochuoi.jpg', 1, 'CAT03')
    ,('SM05', N'Sinh tố Mãng Cầu', 42000, 0, 'sinhtomangcau.jpg', 1, 'CAT03')
    ,('SM06', N'Smoothie Việt Quất', 45000, 5, 'smoothievietquat.jpg', 1, 'CAT03')
    ,('SM07', N'Smoothie Kiwi', 45000, 0, 'smoothiekiwi.jpg', 1, 'CAT03')
    ,('SM08', N'Smoothie Dứa', 42000, 0, 'smoothiedua.jpg', 1, 'CAT03')
    ,('MT01', N'Trà Sữa Trân Châu', 35000, 0, 'trasua_tranchau.jpg', 1, 'CAT04')
    ,('MT02', N'Trà Sữa Matcha', 37000, 0, 'trasua_matcha.jpg', 1, 'CAT04')
    ,('MT03', N'Trà Sữa Socola', 37000, 0, 'trasua_socola.jpg', 1, 'CAT04')
    ,('MT04', N'Trà Sữa Thái', 37000, 0, 'trasua_thai.jpg', 1, 'CAT04')
    ,('MT05', N'Trà Sữa Hokkaido', 40000, 0, 'trasua_hokkaido.jpg', 1, 'CAT04')
    ,('MT06', N'Trà Sữa Oolong', 40000, 0, 'trasua_oolong.jpg', 1, 'CAT04')
    ,('MT07', N'Trà Sữa Phô Mai', 42000, 0, 'trasua_phomai.jpg', 1, 'CAT04')
    ,('MT08', N'Trà Sữa Dâu', 37000, 0, 'trasua_dau.jpg', 1, 'CAT04')
    ,('JC01', N'Nước Cam', 35000, 0, 'nuoccam.jpg', 1, 'CAT05')
    ,('JC02', N'Nước Chanh', 30000, 0, 'nuocchanh.jpg', 1, 'CAT05')
    ,('JC03', N'Nước Ép Cà Rốt', 35000, 0, 'nuocep_carot.jpg', 1, 'CAT05')
    ,('JC04', N'Nước Ép Dứa', 35000, 0, 'nuocep_dua.jpg', 1, 'CAT05')
    ,('JC05', N'Nước Ép Ổi', 35000, 0, 'nuocep_oi.jpg', 1, 'CAT05')
    ,('JC06', N'Nước Ép Dưa Hấu', 35000, 0, 'nuocep_duahau.jpg', 1, 'CAT05')
    ,('JC07', N'Nước Ép Táo', 35000, 0, 'nuocep_tao.jpg', 1, 'CAT05')
    ,('JC08', N'Nước Ép Lê', 35000, 0, 'nuocep_le.jpg', 1, 'CAT05')
    ,('SD01', N'Soda Chanh', 30000, 0, 'sodachanh.jpg', 1, 'CAT06')
    ,('SD02', N'Soda Dâu', 32000, 0, 'sodadau.jpg', 1, 'CAT06')
    ,('SD03', N'Soda Bạc Hà', 32000, 0, 'sodabacha.jpg', 1, 'CAT06')
    ,('SD04', N'Soda Việt Quất', 35000, 0, 'sodavietquat.jpg', 1, 'CAT06')
    ,('SD05', N'Soda Blueberry', 35000, 0, 'sodablueberry.jpg', 1, 'CAT06')
    ,('SD06', N'Soda Kiwi', 35000, 0, 'sodakiwi.jpg', 1, 'CAT06')
    ,('SD07', N'Soda Dứa', 35000, 0, 'sodadua.jpg', 1, 'CAT06')
    ,('SD08', N'Soda Cam', 35000, 0, 'sodacam.jpg', 1, 'CAT06')
    ,('CK01', N'Bánh Mousse', 40000, 0, 'banhmousse.jpg', 1, 'CAT07')
    ,('CK02', N'Bánh Tiramisu', 42000, 0, 'banhtiramisu.jpg', 1, 'CAT07')
    ,('CK03', N'Bánh Phô Mai', 42000, 0, 'banhphomai.jpg', 1, 'CAT07')
    ,('CK04', N'Bánh Su Kem', 35000, 0, 'banhsukem.jpg', 1, 'CAT07')
    ,('CK05', N'Bánh Bông Lan', 35000, 0, 'banh_bonglan.jpg', 1, 'CAT07')
    ,('CK06', N'Bánh Flan', 30000, 0, 'banhflan.jpg', 1, 'CAT07')
    ,('CK07', N'Bánh Cuộn', 35000, 0, 'banhcuon.jpg', 1, 'CAT07')
    ,('CK08', N'Bánh Brownie', 40000, 0, 'banhbrownie.jpg', 1, 'CAT07')
    ,('SN01', N'Khoai Tây Chiên', 30000, 0, 'khoaitaychien.jpg', 1, 'CAT08')
    ,('SN02', N'Xúc Xích', 30000, 0, 'xucxich.jpg', 1, 'CAT08')
    ,('SN03', N'Nem Chua Rán', 35000, 0, 'nemchua.jpg', 1, 'CAT08')
    ,('SN04', N'Phô Mai Que', 35000, 0, 'phomaique.jpg', 1, 'CAT08')
    ,('SN05', N'Bánh Gạo Cay', 35000, 0, 'banhgaokay.jpg', 1, 'CAT08')
    ,('SN06', N'Khoai Lang Lắc', 35000, 0, 'khoailanglac.jpg', 1, 'CAT08')
    ,('SN07', N'Gà Rán', 40000, 0, 'garan.jpg', 1, 'CAT08')
    ,('SN08', N'Bắp Xào', 30000, 0, 'bapxao.jpg', 1, 'CAT08')
;
GO

-- DỮ LIỆU BILLS (mỗi card có 2-3 bill, mỗi user đều có bill)
INSERT INTO Bills (Username, CardId, Checkin, Checkout, Status) VALUES
    ('admin01', 1, '2025-07-01 08:00', '2025-07-01 08:30', 1)
    ,('admin02', 1, '2025-07-02 09:00', '2025-07-02 09:30', 1)
    ,('staff01', 2, '2025-07-03 10:00', '2025-07-03 10:30', 1)
    ,('staff02', 2, '2025-07-04 11:00', '2025-07-04 11:30', 1)
    ,('staff03', 3, '2025-07-05 08:15', '2025-07-05 08:45', 1)
    ,('admin01', 3, '2025-07-06 09:00', '2025-07-06 09:40', 1)
    ,('admin02', 4, '2025-07-07 07:50', '2025-07-07 08:20', 1)
    ,('staff01', 4, '2025-07-08 10:00', '2025-07-08 10:30', 1)
    ,('staff02', 5, '2025-07-09 08:30', '2025-07-09 09:00', 1)
    ,('staff03', 5, '2025-07-10 09:30', '2025-07-10 10:00', 1)
    ,('admin01', 6, '2025-07-11 08:00', '2025-07-11 08:30', 1)
    ,('admin02', 6, '2025-07-12 09:00', '2025-07-12 09:30', 1)
    ,('staff01', 7, '2025-07-13 10:00', '2025-07-13 10:30', 1)
    ,('staff02', 7, '2025-07-14 11:00', '2025-07-14 11:30', 1)
    ,('staff03', 8, '2025-07-15 08:15', '2025-07-15 08:45', 1)
    ,('admin01', 8, '2025-07-16 09:00', '2025-07-16 09:40', 1)
    ,('admin02', 9, '2025-07-17 07:50', '2025-07-17 08:20', 1)
    ,('staff01', 9, '2025-07-18 10:00', '2025-07-18 10:30', 1)
    ,('staff02', 10, '2025-07-19 08:30', '2025-07-19 09:00', 1)
    ,('staff03', 10, '2025-07-20 09:30', '2025-07-20 10:00', 1)
    ,('admin01', 11, '2025-07-21 08:00', '2025-07-21 08:30', 1)
    ,('admin02', 11, '2025-07-22 09:00', '2025-07-22 09:30', 1)
    ,('staff01', 12, '2025-07-23 10:00', '2025-07-23 10:30', 1)
    ,('staff02', 12, '2025-07-24 11:00', '2025-07-24 11:30', 1)
;
GO

-- DỮ LIỆU BILLDETAILS (đa dạng, mỗi bill nhiều loại đồ uống)
INSERT INTO BillDetails (BillId, DrinkId, UnitPrice, Discount, Quantity) VALUES
    (10000, 'D001', 45000, 10, 2)
    ,(10000, 'CF01', 30000, 0, 1)
    ,(10001, 'D002', 50000, 0, 1)
    ,(10001, 'CF02', 35000, 0, 2)
    ,(10002, 'D003', 30000, 5, 1)
    ,(10002, 'CF03', 40000, 5, 1)
    ,(10003, 'D004', 32000, 10, 2)
    ,(10003, 'CF04', 45000, 10, 1)
    ,(10004, 'CF05', 100000, 0, 1)
    ,(10004, 'CF06', 50000, 0, 1)
    ,(10005, 'CF07', 47000, 5, 2)
    ,(10005, 'CF08', 42000, 0, 1)
    ,(10006, 'TE01', 35000, 0, 2)
    ,(10006, 'TE02', 35000, 0, 1)
    ,(10007, 'TE03', 30000, 5, 1)
    ,(10007, 'TE04', 32000, 0, 2)
    ,(10008, 'TE05', 34000, 0, 1)
    ,(10008, 'TE06', 40000, 10, 1)
    ,(10009, 'TE07', 37000, 0, 2)
    ,(10009, 'TE08', 32000, 0, 1)
    ,(10010, 'SM01', 40000, 0, 1)
    ,(10010, 'SM02', 40000, 0, 2)
    ,(10011, 'SM03', 40000, 0, 1)
    ,(10011, 'SM04', 40000, 0, 1)
    ,(10012, 'SM05', 42000, 0, 1)
    ,(10012, 'SM06', 45000, 5, 1)
    ,(10013, 'SM07', 45000, 0, 2)
    ,(10013, 'SM08', 42000, 0, 1)
;
GO

-- TẠO BẢNG NHACUNGCAP
CREATE TABLE NhaCungCap (
    Username NVARCHAR(20) PRIMARY KEY
    ,NumberPhone NVARCHAR(15)
    ,Address NVARCHAR(200)
    ,FOREIGN KEY (Username) REFERENCES Users(Username) ON UPDATE CASCADE
);
GO

-- DỮ LIỆU NHACUNGCAP (5 NHÀ CUNG CẤP)
INSERT INTO NhaCungCap (Username, NumberPhone, Address) VALUES
    ('admin01', '0901234567', N'123 Đường ABC, Quận 1, TP.HCM')
    ,('admin02', '0902345678', N'456 Đường XYZ, Quận 2, TP.HCM')
    ,('staff01', '0903456789', N'789 Đường DEF, Quận 3, TP.HCM')
    ,('staff02', '0904567890', N'321 Đường GHI, Quận 4, TP.HCM')
    ,('staff03', '0905678901', N'654 Đường JKL, Quận 5, TP.HCM')
;
GO
