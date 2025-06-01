package image;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import java.util.ArrayList;
import java.util.HashMap;

public class StripeSessionHelper {

    public static Session createSession() throws StripeException {
        // String secretKey = "sk_test_51P7hlRSIE4KEYpsDtKCqe7hvBU499acOrlEcEuLrog8OopjaIv3dkTMD5JAVS7nDXYNhhkyGx5guqKW1t1cHdhG1005hlutYMF";
        Stripe.apiKey = secretKey;

        String successUrl = "https://yourdomain.com/success.jsp";
        String cancelUrl = "https://yourdomain.com/cancel.jsp";

        HashMap<String, Object> lineItem = new HashMap<>();
        lineItem.put("price_data", new HashMap<String, Object>() {{
            put("currency", "inr");
            put("product_data", new HashMap<String, Object>() {{
                put("name", "T-shirt");
            }});
            put("unit_amount", 2000); // $20
        }});
        lineItem.put("quantity", 1);

        ArrayList<Object> lineItems = new ArrayList<>();
        lineItems.add(lineItem);

        HashMap<String, Object> params = new HashMap<>();
        params.put("success_url", successUrl);
        params.put("cancel_url", cancelUrl);
        params.put("payment_method_types", new String[]{"card"});
        params.put("line_items", lineItems);
        params.put("mode", "payment");

   
        return Session.create(params);
    }
}