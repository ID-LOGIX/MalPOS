import React, { useState } from "react";
import { Row, Col, Form } from "react-bootstrap";
import { CardLayout, FloatCard } from "../../components/cards";
import ProductsTable from "../../components/tables/ProductsTable";
import LabelField from "../../components/fields/LabelField";
import { Pagination, Breadcrumb } from "../../components";
import Anchor from "../../components/elements/Anchor";
import PageLayout from "../../layouts/PageLayout";
import data from "../../data/master/productList.json";
import { Button, Input, Box, Label } from "../../components/elements";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSearch, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Modal } from "react-bootstrap";
import { Link } from "react-router-dom";

export default function ProductList() {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <PageLayout>
      <Row>
        <Col xl={12}>
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
        </Col>
        {/* {data?.float.map((item, index) => ( */}
        {/* <Col> */}
        <FloatCard
        // variant={item.variant}
        // digit={item.digit}
        // title={item.title}
        // icon={item.icon}
        />
        {/* </Col> */}
        {/* ))} */}
        {/* <Col>
                <CardLayout>
                    
                    <Box className="filterAndSeach-pl">
                        <Box>
                            <Form>
                                <Form.Control type="search" placeholder="Search" />
                            </Form>
                        </Box>
                        <Box>
                            <Form>
                                <Form.Select>
                                    <option>Select</option>
                                    <option value="option1">Option 1</option>
                                    <option value="option2">Option 2</option>
                                    <option value="option3">Option 3</option>
   </Form.Select>
                            </Form>

                        </Box>
                        <Box>
                            <Button className="add-product-btn-pl">Add Product</Button>

                        </Box>
                    </Box>
                    
                </CardLayout>
                </Col> */}
        <Col xl={12}>
          <CardLayout>
            <Row>
              <Col xs={12} sm={12} md={3} lg={3}>
                <div style={{ position: "relative" }}>
                  <Form.Control
                    type="search"
                    placeholder="Search"
                    className="search-pl"
                  />
                  <span
                    style={{
                      position: "absolute",
                      top: "50%",
                      right: "10px",
                      transform: "translateY(-50%)",
                    }}
                  >
                    <button type="submit">
                      <FontAwesomeIcon icon={faSearch} />
                    </button>
                  </span>
                </div>
              </Col>
              <Col md={7}>
                <Row className="product-filter-pl">
                  {data?.product.filter.map((item, index) => (
                    <Col
                      xs={12}
                      sm={6}
                      md={2}
                      lg={2}
                      key={index}
                      className="col-2-filters"
                    >
                      {/* <LabelField
                                            label="Select options" 
                                            type="checkbox" 
                                            option={item.option}
                                            labelDir="label-col"
                                            fieldSize="field-select  w-100 h-md "
                                                /> */}

                      <LabelField
                        type={item.type}
                        // label={item.label}
                        option={item.option}
                        placeholder={item.placeholder}
                        labelDir="label-col"
                        fieldSize="field-select  w-100 h-md "
                      />
                    </Col>
                  ))}
                </Row>
              </Col>
              <Col sm={12} md={2} lg={2}>
                <Button className="add-product-btn-pl" onClick={handleShow}>
                  + Create
                </Button>
              </Col>
              <Modal
                show={show}
                onHide={handleClose}
                className="manage-m-dialog-box"
              >
                <Modal.Header closeButton>
                  <Modal.Title>
                    Select the type of product that you want to create
                  </Modal.Title>
                </Modal.Header>
                <Modal.Body>
                  <Box>
                    <Row>
                      <Col md={12}>
                        <Row>
                          <Col md={2} className="col-2">
                            <Box className={"faDish-img"}>
                              <img src="/images/product/pizza.jpg" alt="img" />
                            </Box>
                          </Col>
                          <Col md={8}>
                            <h6>Dish</h6>
                            <p>Creating of Product Conating Ingredients</p>
                          </Col>
                          <Col md={2} className="col-2">
                            <Link to="/constructure-dish">
                              <FontAwesomeIcon
                                className="faPlus"
                                icon={faPlus}
                              />
                            </Link>
                          </Col>
                        </Row>
                      </Col>
                      <Col md={12}>
                        <Row>
                          <Col md={2} className="col-2">
                            <Box className={"faDish-img"}>
                              <img src="/images/product/drink.jpg" alt="img" />
                            </Box>
                          </Col>
                          <Col md={8}>
                            <h6>Goods</h6>

                            <p>Good Create Description</p>
                          </Col>
                          <Col md={2} className="col-2">
                            <Link to="/constructure-product">
                              <FontAwesomeIcon
                                className="faPlus"
                                icon={faPlus}
                              />
                            </Link>
                          </Col>
                        </Row>
                      </Col>
                    </Row>
                  </Box>
                </Modal.Body>
                <Modal.Footer></Modal.Footer>
              </Modal>
              <Col xl={12}>
                <ProductsTable
                // thead={data?.product.thead}
                // tbody={data?.product.tbody}
                />
                <Pagination />
              </Col>
            </Row>
          </CardLayout>
        </Col>
      </Row>
    </PageLayout>
  );
}
