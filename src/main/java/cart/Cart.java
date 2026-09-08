package cart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class Cart implements Serializable {

    private List<Product> items;

    public Cart() {
        items = new ArrayList<>();
    }

    // Thêm sản phẩm vào giỏ
    public void addProduct(Product product) {

        for (Product item : items) {

            // Nếu sản phẩm đã có trong giỏ
            if (item.getCode().equals(product.getCode())) {

                // Không tự động tăng số lượng
                return;
            }
        }

        // Nếu sản phẩm chưa có thì thêm vào giỏ
        items.add(product);
    }

    // Lấy danh sách sản phẩm
    public List<Product> getItems() {
        return items;
    }

    // Xóa sản phẩm
    public void removeProduct(String productCode) {

        for (int i = 0; i < items.size(); i++) {

            if (items.get(i).getCode().equals(productCode)) {

                items.remove(i);

                return;
            }
        }
    }

    // Cập nhật số lượng
    public void updateQuantity(String productCode, int quantity) {

        for (Product product : items) {

            if (product.getCode().equals(productCode)) {

                product.setQuantity(quantity);

                return;
            }
        }
    }

    // Tính tổng tiền
    public double getTotal() {

        double total = 0;

        for (Product product : items) {

            total += product.getAmount();
        }

        return total;
    }

    // Kiểm tra giỏ hàng có rỗng không
    public boolean isEmpty() {

        return items.isEmpty();
    }
}