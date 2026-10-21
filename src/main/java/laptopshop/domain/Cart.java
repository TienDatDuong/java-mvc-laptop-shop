package laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;

import java.util.List;

@Entity
@Table(name= "carts")
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Min(value = 0)
    private int sum;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "cart")
    List<CartDetail> cartDetails;

    public long getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<laptopshop.domain.CartDetail> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<laptopshop.domain.CartDetail> cartDetails) {
        this.cartDetails = cartDetails;
    }
}
