import React, { useState, useEffect, useContext } from "react";

import { Row, Col, Dropdown } from "react-bootstrap";
import data from "../../data/receipts.json";
import {
  Table,
  Thead,
  Tbody,
  Th,
  Tr,
  Td,
} from "../../components/elements/Table";
import { Pagination, Breadcrumb } from "../../components";
import { CardLayout } from "../../components/cards/";
import PageLayout from "../../layouts/PageLayout";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faFilter } from "@fortawesome/free-solid-svg-icons";
import { Anchor, Box, Text, Button } from "../../components/elements";

import CustomPagination from "../../components/CustomPagination";
import CustomSearch from "../../components/CustomSearch";
import { useNavigate } from "react-router-dom";

import api from "../../api/baseUrl";
import { DrawerContext } from "../../context/RightDrawer";

export default function OrderReceipt() {
  const navigate = useNavigate();
  const [receipts, setReceipts] = useState([]);
  const [paymentTypeFilter, setPaymentTypeFilter] = useState("");
  const [orderTypeFilter, setOrderTypeFilter] = useState("");
  const [statusTypeFilter, setStatusTypeFilter] = useState("");

  const [currentPage, setCurrentPage] = useState(1);
  const [searchTerm, setSearchTerm] = useState("");
  const [perPage] = useState(5);

  const { toggleFromRight, toggleDrawer } = useContext(DrawerContext);
  // console.log("Sidebar: drawer =", drawer, "fromRight =", fromRight);

  const fetchAllReceipts = async () => {
    try {
      const response = await api.get("/order_receipts");
      setReceipts(response.data);
      console.log(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  const handleGenerateReportClick = () => {
    navigate("/report", { state: { receipts: currentReceipts } });
  };

  const getFilteredReceipts = () => {
    return receipts.filter(
      (receipt) =>
        (paymentTypeFilter === "" ||
          receipt.payment_type === paymentTypeFilter) &&
        (orderTypeFilter === "" || receipt.order_type === orderTypeFilter) &&
        (statusTypeFilter === "" || receipt.status === statusTypeFilter)
    );
  };

  //   Pagination Logic
  const indexOfLastUser = currentPage * perPage;
  const indexOfFirstUser = indexOfLastUser - perPage;
  // const filteredReceipts = receipts.filter((receipt) =>
  //   receipt.status.toLowerCase().includes(searchTerm.toLowerCase())
  // );
  const filteredReceipts = getFilteredReceipts().filter((receipt) =>
    receipt.status.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const currentReceipts = filteredReceipts.slice(
    indexOfFirstUser,
    indexOfLastUser
  );

  const paginate = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const handleEdit = (id) => {
    console.log("dasda", id);
    navigate("/checkout", {
      state: {
        id: id,
      },
    });
  };

  const handlePaymentTypeChange = async (paymentType) => {
    setPaymentTypeFilter(paymentType);
    try {
      const response = await api.get(`/order_receipts/${paymentType}`);
      setReceipts(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  const handleOrderTypeChange = async (orderType) => {
    setOrderTypeFilter(orderType);
    try {
      const response = await api.get(`/order_receipts/${orderType}`);
      setReceipts(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  const handleStatusTypeChange = async (statusType) => {
    setStatusTypeFilter(statusType);
    try {
      const response = await api.get(`/order_receipts/${statusType}`);
      setReceipts(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  // const filteredReceiptsBox = receipts.filter(
  //   (receipt) =>
  //     receipt.status.toLowerCase().includes(searchTerm.toLowerCase()) &&
  //     (paymentTypeFilter === "" ||
  //       receipt.payment_type === paymentTypeFilter) &&
  //     (orderTypeFilter === "" || receipt.order_type === orderTypeFilter)
  // );

  // const handleToggle = () => {
  //   toggleFromRight();
  //   toggleDrawer();
  // };

  useEffect(() => {
    fetchAllReceipts();
  }, []);
  return (
    <PageLayout>
      <CardLayout>
        <Breadcrumb title={data?.pageTitle}>
          {data?.breadcrumb.map((item, index) => (
            <li key={index} className="mc-breadcrumb-item">
              {item.path ? (
                <Anchor className="mc-breadcrumb-link" href={item.path}>
                  {item.text}
                </Anchor>
              ) : (
                item.text
              )}
            </li>
          ))}
        </Breadcrumb>
      </CardLayout>

      <CardLayout>
        <Row>
          <Col xs={12} sm={12} md={3} lg={3}>
            <CustomSearch
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </Col>
          <Row className="justify-content-around">
            <Col xs={12} sm={12} md={3} lg={3}>
              <Dropdown>
                <Dropdown.Toggle variant="secondary" id="payment-type-dropdown">
                  Payment Type
                </Dropdown.Toggle>
                <Dropdown.Menu>
                  <Dropdown.Item
                    onClick={() => handlePaymentTypeChange("cash")}
                    active={paymentTypeFilter === "cash"}
                  >
                    Cash
                  </Dropdown.Item>
                  <Dropdown.Item
                    onClick={() => handlePaymentTypeChange("card")}
                    active={paymentTypeFilter === "card"}
                  >
                    Card
                  </Dropdown.Item>
                </Dropdown.Menu>
              </Dropdown>
            </Col>
            <Col xs={12} sm={12} md={3} lg={3}>
              <Dropdown>
                <Dropdown.Toggle variant="secondary" id="order-type-dropdown">
                  Order Type
                </Dropdown.Toggle>
                <Dropdown.Menu>
                  <Dropdown.Item
                    onClick={() => handleOrderTypeChange("Delivery")}
                    active={orderTypeFilter === "Delivery"}
                  >
                    Delivery
                  </Dropdown.Item>
                  <Dropdown.Item
                    onClick={() => handleOrderTypeChange("Takeaway")}
                    active={orderTypeFilter === "Takeaway"}
                  >
                    Takeaway
                  </Dropdown.Item>
                  <Dropdown.Item
                    onClick={() => handleOrderTypeChange("In-store")}
                    active={orderTypeFilter === "In-store"}
                  >
                    In-store
                  </Dropdown.Item>
                </Dropdown.Menu>
              </Dropdown>
            </Col>

            <Col xs={12} sm={12} md={3} lg={3}>
              <Dropdown>
                <Dropdown.Toggle variant="secondary" id="order-type-dropdown">
                  Status
                </Dropdown.Toggle>
                <Dropdown.Menu>
                  <Dropdown.Item
                    onClick={() => handleStatusTypeChange("Paid")}
                    active={statusTypeFilter === "Paid"}
                  >
                    Paid
                  </Dropdown.Item>
                  <Dropdown.Item
                    onClick={() => handleStatusTypeChange("UnPaid")}
                    active={statusTypeFilter === "UnPaid"}
                  >
                    UnPaid
                  </Dropdown.Item>
                </Dropdown.Menu>
              </Dropdown>
            </Col>

            <Col xs={12} sm={12} md={3} lg={3}>
              <Button
                className="btn btn-success"
                style={{ backgroundColor: "green" }}
                onClick={handleGenerateReportClick}
              >
                Generate Report
              </Button>
            </Col>
          </Row>

          <Box className="mc-table-responsive">
            <Table className="mc-table">
              <Thead className="mc-table-head primary">
                <Tr>
                  {data.product.thead.map((item, i) => (
                    <Th key={i}>{item}</Th>
                  ))}
                </Tr>
              </Thead>
              <Tbody className="mc-table-body even">
                {currentReceipts &&
                  currentReceipts?.map((receipt) => (
                    <Tr key={receipt.td_sale_order_id}>
                      <Td>
                        <Box className="mc-table-check">
                          <Text>{receipt.td_sale_order_id}</Text>
                        </Box>
                      </Td>
                      <Td>{receipt.customer}</Td>
                      <Td>{receipt.order_type}</Td>
                      <Td>{receipt.order_amount}</Td>
                      <Td>{receipt.discount}</Td>
                      <Td>{receipt.payment_type}</Td>
                      <Td>
                        <p
                          className={
                            receipt.status !== "UnPaid"
                              ? "mc-table-badge green"
                              : "mc-table-badge red"
                          }
                        >
                          {receipt.status}
                        </p>
                      </Td>
                      <Td>{receipt.created_at}</Td>
                      <Td>
                        <div className="mc-table-action">
                          <Button
                            className={`mc-table-action ${
                              receipt.status !== "UnPaid"
                                ? "disabled"
                                : "material-icons edit "
                            }`}
                            disabled={receipt.status !== "UnPaid"}
                            onClick={() => handleEdit(receipt.td_sale_order_id)}
                          >
                            <FontAwesomeIcon icon={faEdit} />
                          </Button>
                        </div>
                      </Td>
                    </Tr>
                  ))}
              </Tbody>
            </Table>
            <CustomPagination
              perPage={perPage}
              totalUsers={filteredReceipts.length}
              paginate={paginate}
              currentPage={currentPage}
            />
          </Box>
        </Row>
      </CardLayout>
    </PageLayout>
  );
}
