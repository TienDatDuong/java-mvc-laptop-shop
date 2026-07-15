package laptopshop.service;

import laptopshop.domain.Products;
import laptopshop.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Products> getAllProducts() {
        return this.productRepository.findAll();
    };

    public Products handSaveUser(Products product) {
        return this.productRepository.save(product);
    }

    public Products getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }


}
