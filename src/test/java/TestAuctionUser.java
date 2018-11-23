import com.baizhi.auction.AuctionSpringBootApplication;
import com.baizhi.auction.dao.AuctionUserDao;
import com.baizhi.auction.entity.AuctionUser;
import com.baizhi.auction.service.AuctionUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(value = SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = AuctionSpringBootApplication.class)
public class TestAuctionUser {
    @Autowired
    private AuctionUserService auctionUserService;
    @Autowired
    private AuctionUserDao auctionUserDao;
    @Test
    public void m1(){
        AuctionUser auctionUser = auctionUserService.login("admin","123456");
        //AuctionUser auctionUser = auctionUserDao.login("admin","123456");
        System.out.println("auctionUser = " + auctionUser);
    }
}
