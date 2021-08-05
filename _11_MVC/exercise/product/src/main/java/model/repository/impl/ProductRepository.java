package model.repository.impl;

import model.bean.Product;
import model.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepository implements IProductRepository {
    static Map<Integer, Product> products = new TreeMap<>();

    static {
        products.put(1, new Product(1, "Iphone", 2500, "Khả dụng", "Apple"));
        products.put(2, new Product(2, "ipad", 1500, "Khả dụng", "Apple"));
        products.put(3, new Product(3, "Samsung", 2000, "gold", "Samsung"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
         products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
