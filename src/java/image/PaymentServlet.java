
package image;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session stripeSession = null;
        try {
            stripeSession = StripeSessionHelper.createSession();
        } catch (StripeException ex) {
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("sessionData", stripeSession);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }
}