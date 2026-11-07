package laptopshop.repository;

import laptopshop.domain.Cart;
import laptopshop.domain.CartDetail;
import laptopshop.domain.Products;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail,Long> {
    boolean existsByCartAndProduct(Cart cart, Products product);

    CartDetail findByCartAndProduct(Cart cart, Products product);

}
