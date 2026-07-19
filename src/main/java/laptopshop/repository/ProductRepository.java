package laptopshop.repository;

import laptopshop.domain.Products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Products, Long> {
    List<Products> findAll();

    Products save(Products product);

    Products findById(long id);

    void deleteById(long id);
}
