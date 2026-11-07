package laptopshop.service;

import laptopshop.domain.Cart;
import laptopshop.domain.CartDetail;
import laptopshop.domain.Products;
import laptopshop.domain.User;
import laptopshop.repository.CartDetailRepository;
import laptopshop.repository.CartRepository;
import laptopshop.repository.ProductRepository;
import laptopshop.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartDetailRepository cartDetailRepository, CartRepository cartRepository,UserService userService) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
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

    public void handleAddProductToCart(String email,Long productId) {
        User user = userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(1);

                cart =  this.cartRepository.save(otherCart);
            }
            //find product by id
            Optional<Products> productsOptional = this.productRepository.findById(productId);
            if (productsOptional.isPresent()) {
                Products realProduct = productsOptional.get();

                //check sản phầm đã được thêm vào giỏ hàng hay chưa?
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if(oldDetail != null) {
                    CartDetail cd = new  CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);

                    //save cart_detail
                    this.cartDetailRepository.save(cd);
                }else {
//                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
//                    this.cartDetailRepository.save(oldDetail);
                }



            }

        }

    }


}
