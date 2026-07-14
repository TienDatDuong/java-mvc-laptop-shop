package laptopshop.repository;

import laptopshop.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findAll();

    Product save(Product product);

    Product findById(long id);

    void deleteById(long id);
}
