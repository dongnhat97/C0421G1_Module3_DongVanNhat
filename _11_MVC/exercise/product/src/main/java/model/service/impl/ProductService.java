package model.service.impl;

import model.bean.Product;
import model.repository.IProductRepository;
import model.repository.impl.ProductRepository;
import model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return this.iProductRepository.findAll();
    }

    @Override
    public void save(Product product) {
         this.iProductRepository.save(product);
    }

    @Override
    public Product findById(int id) {
        return this.iProductRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
          this.iProductRepository.update(id,product);
    }

    @Override
    public void remove(int id) {
          this.iProductRepository.remove(id);
    }
}
