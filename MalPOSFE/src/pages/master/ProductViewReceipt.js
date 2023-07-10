import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { toast } from "react-toastify";
import { Col, Row, Button } from "react-bootstrap";
import {
  faEdit,
  faClock,
  faAngleDown,
  faPlus,
  faXmark,
  faMinus,
  faTrashCan,
} from "@fortawesome/free-solid-svg-icons";
import { useNavigate, useLocation } from "react-router-dom";

import { CardLayout } from "../../components/cards";
import { Box } from "../../components/elements";
import { Text } from "../../components/elements";
import api from "../../api/baseUrl";

export default function ProductViewReceipt({
  products,
  deleteProduct,
  clearCart,
  increaseQty, // New prop
  decreaseQty, // New prop
}) {
  const location = useLocation();
  const navigate = useNavigate();
  const orderType = location.state?.service;

  const tax = 5; // Set the tax percentage

  const subtotal = products.reduce(
    (total, product) => total + Number(product.product_price) * product.qty,
    0
  );

  const totalTax = products.reduce(
    (total, product) =>
      total + Number(product.product_price) * product.qty * (tax / 100),
    0
  );

  const handleDelete = (id) => {
    deleteProduct(id);
  };
  const handleOrderSave = async () => {
    navigate("/checkout", {
      state: {
        selectedProducts: products,
        subtotal: subtotal + totalTax,
        totalTax: totalTax,
        orderType: orderType,
      },
    });
    // const orderData = {
    //   order_type: orderType?.toString() || "",
    //   // payment_type: payment_type,
    //   // discount: (discount || "").toString(),
    //   order_amount: (subtotal + totalTax || "").toString(),
    //   status: ("UnPaid" || "").toString(),
    //   products: products.map((product) => ({
    //     product_id: (product.md_product_id || "").toString(),
    //     qty: (product.qty || "").toString(),
    //     price: (product.price || "").toString(),
    //   })),
    // };
    // try {
    //   // Send the order data to the API
    //   const response = await api.post("/save_order", orderData);
    //   console.log("order", orderData);

    //   if (response.status === 200) {
    //     toast.success("Order has been save in draft!");
    //     navigate("/orders-line"); // navigate to order-line page
    //   } else {
    //     console.error("Failed to save order.");
    //   }
    // } catch (error) {
    //   toast.error("Something went wrong with your order.");
    // }
  };
  const emptyCart = (
    <CardLayout>
      <Row>
        <Col className="text-center">
          <h5>Empty Cart</h5>
        </Col>
      </Row>
    </CardLayout>
  );
  return (
    <div>
      <CardLayout>
        <Row className="f-13">
          <Col sm={12}>
            <FontAwesomeIcon icon={faEdit} />
            {orderType}
            <div className="text-end">
              <FontAwesomeIcon icon={faClock} /> 20:00
            </div>
          </Col>

          <Col md={12}>
            <Box className={"pv-receipt-box"}>
              {products.length === 0
                ? emptyCart
                : products.map((product, index) => (
                    <CardLayout className="mt-1" key={index}>
                      <Row>
                        <Col md={8}>
                          <Text className="bold" as="span">
                            {product.product_name} (Qty: {product.qty})
                          </Text>
                          <br />
                          <Text as="span">
                            Price : {product.product_price}
                            <Text as="span" className={"bold secound-color"}>
                              {" "}
                              ریال
                            </Text>{" "}
                          </Text>
                          <Text as="span">
                            Tax :{" "}
                            {((product.product_price * tax) / 100).toFixed(2)}
                            <Text as="span" className={"bold secound-color"}>
                              {" "}
                              ریال
                            </Text>{" "}
                          </Text>
                        </Col>
                        {/* <Col md={4} className="d-flex justify-content-end">
                          <FontAwesomeIcon
                            icon={faTrashCan}
                            color="red"
                            style={{ cursor: "pointer" }}
                            onClick={() => handleDelete(product.md_product_id)}
                          />{" "}
                        </Col> */}
                        <Col md={4} className="d-flex justify-content-end">
                          <FontAwesomeIcon
                            icon={faMinus}
                            color="red"
                            style={{ cursor: "pointer", marginRight: "10px" }}
                            onClick={() => decreaseQty(product.md_product_id)}
                          />
                          <span>{product.qty}</span>
                          <FontAwesomeIcon
                            icon={faPlus}
                            color="green"
                            style={{ cursor: "pointer", marginLeft: "10px" }}
                            onClick={() => increaseQty(product.md_product_id)}
                          />
                        </Col>
                      </Row>
                    </CardLayout>
                  ))}
            </Box>
          </Col>
          <Col md={6}>
            Tax
            <br />
            {totalTax.toFixed(2)}
            <Text as="span" className={"bold secound-color"}>
              {" "}
              ریال
            </Text>
          </Col>
          <Col md={6}>
            Total Before Tax
            <br />
            {subtotal.toFixed(2)}
            <Text as="span" className={"bold secound-color"}>
              {" "}
              ریال
            </Text>
          </Col>
          <Col md={6}>
            Total
            <br />
            {(subtotal + totalTax).toFixed(2)}
            <Text as="span" className={"bold secound-color"}>
              {" "}
              ریال
            </Text>
          </Col>
          <Row className="justify-content-between">
            <Col md={6}>
              <Button
                style={{ backgroundColor: "red" }}
                className="btn"
                onClick={clearCart}
              >
                Clear Cart
              </Button>
            </Col>
            <Col md={6}>
              <Button
                style={{ backgroundColor: "#F07632" }}
                className="btn"
                onClick={handleOrderSave}
              >
                Save Order
              </Button>
            </Col>
          </Row>
        </Row>
      </CardLayout>
    </div>
  );
}
