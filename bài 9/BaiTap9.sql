 -- BẢNG 1: Phòng khám
CREATE TABLE PhongKham (
    MaPhongKham INT PRIMARY KEY AUTO_INCREMENT,
    TenPhongKham VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(20) UNIQUE NOT NULL
);

-- BẢNG 2: Bác sĩ
CREATE TABLE BacSi (
    MaBacSi INT PRIMARY KEY AUTO_INCREMENT,
    HoTen VARCHAR(100) NOT NULL,
    ChuyenKhoa VARCHAR(100),
    KinhNghiem INT,
    MaPhongKham INT NOT NULL,
    FOREIGN KEY (MaPhongKham) REFERENCES PhongKham(MaPhongKham)
);

-- BẢNG 3: Lịch làm việc
CREATE TABLE LichLamViec (
    MaLichLamViec INT PRIMARY KEY AUTO_INCREMENT,
    MaBacSi INT NOT NULL,
    NgayLam DATE NOT NULL,
    GioBatDau TIME NOT NULL,
    GioKetThuc TIME NOT NULL,
    FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi)
);

-- BẢNG 4: Bệnh nhân
CREATE TABLE BenhNhan (
    MaBenhNhan INT PRIMARY KEY AUTO_INCREMENT,
    HoTen VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh ENUM('Nam', 'Nữ', 'Khác'),
    SoDienThoai VARCHAR(20) UNIQUE NOT NULL
);

-- BẢNG 5: Lịch hẹn
CREATE TABLE LichHen (
    MaLichHen INT PRIMARY KEY AUTO_INCREMENT,
    MaBenhNhan INT NOT NULL,
    MaLichLamViec INT NOT NULL,
    TrangThai ENUM('Đã xác nhận', 'Đã hủy', 'Đã hoàn thành') DEFAULT 'Đã xác nhận',
    NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (MaBenhNhan) REFERENCES BenhNhan(MaBenhNhan),
    FOREIGN KEY (MaLichLamViec) REFERENCES LichLamViec(MaLichLamViec)
);

-- BẢNG 6: Hồ sơ khám bệnh
CREATE TABLE HoSoKhamBenh (
    MaHoSo INT PRIMARY KEY AUTO_INCREMENT,
    MaLichHen INT UNIQUE NOT NULL,
    ChanDoan TEXT,
    DonThuoc TEXT,
    NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (MaLichHen) REFERENCES LichHen(MaLichHen)
);

