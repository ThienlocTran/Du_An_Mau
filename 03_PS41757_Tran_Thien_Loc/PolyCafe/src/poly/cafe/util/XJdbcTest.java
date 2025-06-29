package poly.cafe.util;

import poly.cafe.util.XJdbc;

public class XJdbcTest {

    public static void main(String[] args) {
        System.out.println("=== KIỂM TRA KẾT NỐI CSDL ===");

        // Kiểm tra kết nối
        if (XJdbc.isReady()) {
            System.out.println("✅ Kết nối đã được mở sẵn.");
        } else {
            System.out.println("🔄 Đang mở kết nối...");
            XJdbc.openConnection();

            if (XJdbc.isReady()) {
                System.out.println("✅ Kết nối thành công!");
            } else {
                System.out.println("❌ Kết nối thất bại!");
            }
        }

        // Thử truy vấn đơn giản
        try {
            String sql = "SELECT COUNT(*) FROM Cards";
            Integer count = XJdbc.getValue(sql);
            System.out.println("📦 Số lượng đồ uống trong bảng Drinks: " + count);
        } catch (Exception e) {
            System.err.println("❌ Lỗi truy vấn dữ liệu: " + e.getMessage());
        }

        // Đóng kết nối
        XJdbc.closeConnection();
        System.out.println("✅ Kết nối đã đóng.");
    }
}
