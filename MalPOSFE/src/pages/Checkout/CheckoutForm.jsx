import { Row, Col, Button, Form } from "react-bootstrap";
import React, { useState, useEffect, useRef } from "react";
import { toast } from "react-toastify";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTrashCan } from "@fortawesome/free-solid-svg-icons";

import { Text } from "../../components/elements";
import api from "../../api/baseUrl";
import { CardLayout } from "../../components/cards";

const CheckoutForm = ({ orderId, location, navigate }) => {
  const [selectedProducts, setSelectedProducts] = useState([]);
  const [paymentMethods, setPaymentMethods] = useState([
    { method: "cash", amount: "" },
  ]);
  const [currentProduct, setCurrentProduct] = useState([]);
  const [orderType, setOrderType] = useState("");
  const [discount, setDiscount] = useState("");
  const [amountToPay, setAmountToPay] = useState(0);
  const [totalTax, setTotalTax] = useState(0);
  const [initialSubtotal, setInitialSubtotal] = useState(0);
  const [paymentMethod, setPaymentMethod] = useState("cash");
  const [cardHolderName, setCardHolderName] = useState("");
  const [cardNumber, setCardNumber] = useState("");

  const [rowId, setRowId] = useState(null);
  const didRun = useRef(false);

  const completeBill = async () => {
    // Create the paidAmount array
    const paidAmount = paymentMethods.map((payment) => ({
      tender_type: (payment.method || "").toString(),
      payment_amount: (payment.amount || "").toString(),
    }));
    const orderData = {
      order_type: orderType.toString() || "",
      payment_type: paymentMethod,
      discount: (discount || "").toString(),
      order_amount: (initialSubtotal + totalTax || "").toString(),
      status: "Paid",
      paidAmount,
      products: selectedProducts.map((product) => ({
        product_id: (product.md_product_id || "").toString(),
        qty: (product.qty || "").toString(),
        price: (product.price || "").toString(),
      })),
    };

    try {
      // Send the order data to the API
      if (rowId == null) {
        const response = await api.post(`/save_order`, orderData);
        console.log("order", response);
        toast.success("Order has been successfully placed! Bill");
        navigate("/orders-line");
      } else {
        const response = await api.post(`/checkout_order/${rowId}`, orderData);
        console.log("order", response);
        toast.success("Order has been successfully placed! Bill2");
        navigate("/orders-line");
      }
    } catch (error) {
      toast.error("Something went wrong with your order.");
      console.log(orderData);
    }
  };

  const addPaymentMethod = () => {
    setPaymentMethods([...paymentMethods, { method: "cash", amount: "" }]);
  };

  const updatePaymentMethod = (index, field, value) => {
    const newPaymentMethods = [...paymentMethods];
    newPaymentMethods[index][field] = value;
    setPaymentMethods(newPaymentMethods);
  };
  const saveToDraft = async () => {
    const paidAmount = paymentMethods.map((payment) => ({
      tender_type: (payment.method || "").toString(),
      payment_amount: (payment.amount || "").toString(),
    }));
    if (orderId == null) {
      const orderData = {
        order_type: orderType?.toString() || "",
        payment_type: paymentMethod,
        discount: (discount || "").toString(),
        paidAmount,
        order_amount: (initialSubtotal + totalTax || "").toString(),
        status: ("UnPaid" || "").toString(),
        products: selectedProducts.map((product) => ({
          product_id: (product.md_product_id || "").toString(),
          qty: (product.qty || "").toString(),
          price: (product.price || "").toString(),
        })),
      };
      try {
        // Send the order data to the API
        const response = await api.post("/save_order", orderData);
        console.log("order", orderData);

        if (response.status === 200) {
          toast.success("Order has been save in draft!");
          navigate("/orders-line"); // navigate to order-line page
        } else {
          console.error("Failed to save order.");
        }
      } catch (error) {
        toast.error("Something went wrong with your order.");
      }
    }
  };

  const getOrderInfo = async () => {
    if (location.state.id != null) {
      const id = parseInt(location.state.id);
      setRowId(id);
      try {
        const response = await api.get(`/edit_order/${id}`);
        setCurrentProduct(response.data);
        setAmountToPay(response.data.order_amount);
        setInitialSubtotal(response.data.order_amount);
        setOrderType(response.data.order_type);
      } catch (error) {
        toast.error("Something went wrong with your order.");
      }
    } else {
      setSelectedProducts(location.state?.selectedProducts);
      setAmountToPay(location.state?.subtotal);
      setInitialSubtotal(location.state?.subtotal);
      setOrderType(location.state?.orderType);
      setTotalTax(location.state?.totalTax);
    }
  };

  useEffect(() => {
    if (!didRun.current) {
      getOrderInfo();
      didRun.current = true;
    }
    setAmountToPay(initialSubtotal - (discount || 0));
    // calculate total amount from payment methods
    let totalPaymentMethodsAmount = paymentMethods.reduce(
      (total, payment) => total + Number(payment.amount || 0),
      0
    );

    // calculate remaining amount and set to state
    const remainingAmount =
      initialSubtotal - (discount || 0) - totalPaymentMethodsAmount;
    setAmountToPay(remainingAmount >= 0 ? remainingAmount : 0); // to avoid negative values

    const paymentMethodsArray = paymentMethods.map((payment) => payment.method);

    // Check if the array includes both 'cash' and 'card'
    if (
      paymentMethodsArray.includes("cash") &&
      paymentMethodsArray.includes("card")
    ) {
      // If so, update the payment method to 'card & cash' before making the post request
      setPaymentMethod("card & cash");
    }
  }, [discount, initialSubtotal, paymentMethod, paymentMethods]);

  const handleDiscountChange = (e) => {
    const discountValue = e.target.value;
    setDiscount(discountValue);
  };

  const removePaymentMethod = (index) => {
    setPaymentMethods(paymentMethods.filter((_, i) => i !== index));
  };
  return (
    <>
      {" "}
      <Row>
        <CardLayout>
          <Row>
            <Col md={6}>
              <h2>Amount To Pay:</h2>
            </Col>
            <Col md={6}>
              <Text as="h4" className="bold" style={{ color: "#F07632" }}>
                {initialSubtotal} ریال
              </Text>
            </Col>
          </Row>
        </CardLayout>
        <CardLayout>
          <div className="d-flex justify-content-end">
            <Button onClick={addPaymentMethod}>Add payment method</Button>
          </div>
          <Row>
            {paymentMethods.map((payment, index) => (
              <Row
                className={`justify-content-center mb-3 ${
                  index !== 0 ? "cus-margin" : ""
                }`}
                key={index}
              >
                <Col md={3}>
                  <Form.Group>
                    <Form.Label className="prominent-label">
                      Payment Method {index + 1}
                    </Form.Label>
                    <Form.Control
                      as="select"
                      value={payment.method}
                      onChange={(e) =>
                        updatePaymentMethod(index, "method", e.target.value)
                      }
                      className="small-field"
                    >
                      <option value="cash">Cash</option>
                      <option value="card">Card</option>
                    </Form.Control>
                  </Form.Group>
                </Col>
                <Col md={3}>
                  <Form.Group>
                    <Form.Label className="prominent-label">
                      {payment.method === "cash"
                        ? "Enter Cash Amount"
                        : "Enter Card Amount"}
                    </Form.Label>
                    <Form.Control
                      type="number"
                      value={payment.amount}
                      onChange={(e) =>
                        updatePaymentMethod(index, "amount", e.target.value)
                      }
                      className="small-field"
                    />
                  </Form.Group>
                </Col>
                {index !== 0 && (
                  <Col md={1}>
                    <FontAwesomeIcon
                      icon={faTrashCan}
                      onClick={() => removePaymentMethod(index)}
                      style={{
                        cursor: "pointer",
                        paddingTop: "44",
                        color: "red",
                      }}
                    />
                  </Col>
                )}
              </Row>
            ))}
          </Row>

          <Row className="justify-content-center">
            <Col md={4}>
              <Form.Group>
                <Form.Label>Discount ریال</Form.Label>
                <Form.Control
                  className="pop-out-input"
                  type="number"
                  min={0}
                  max={initialSubtotal}
                  placeholder="Enter Discount"
                  value={discount}
                  onChange={handleDiscountChange}
                />
              </Form.Group>
            </Col>
            <Col md={4}>
              <Form.Label>After Discount ریال</Form.Label>
              <Form.Control
                className="pop-out-input"
                type="number"
                placeholder="Enter Discount"
                value={amountToPay}
                readOnly
              />
            </Col>
          </Row>

          <Row className="justify-content-center py-3">
            <Col md={2}>
              <Button
                style={{ backgroundColor: amountToPay > 0 ? "grey" : "green" }} // If there is remaining amount, color will be grey, otherwise green
                onClick={completeBill}
                className="w-100"
                disabled={amountToPay > 0} // Button will be disabled if amountToPay > 0
              >
                Pay Now
              </Button>
            </Col>
            {rowId == null ? (
              <Col md={2}>
                <Button
                  style={{ backgroundColor: "blue" }}
                  onClick={saveToDraft}
                  className="w-100"
                >
                  Save as Draft
                </Button>
              </Col>
            ) : (
              ""
            )}
          </Row>
        </CardLayout>
      </Row>
    </>
  );
};

export default CheckoutForm;
