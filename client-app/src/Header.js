import React from 'react'
import 'bootstrap/dist/css/bootstrap.min.css';
import { Container, Navbar, Nav, NavDropdown, Form, FormControl, Button } from 'react-bootstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faSearch} from '@fortawesome/free-solid-svg-icons'

export default function Header () {
    return (
        <Navbar expand="lg" variant="light" bg="light">
            <Container fluid>
                <Navbar.Brand href="#home">
                    <img src="/public/logo.png" alt="logo" className="d-inline-block align-top"/>
                </Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="mr-auto">
                        <Nav.Link href="#home">Trang chủ</Nav.Link>
                        <Nav.Link href="#link">Sảnh tiệc</Nav.Link>
                        <NavDropdown title="Thực đơn" id="basic-nav-dropdown">
                            <NavDropdown.Item href="#action/3.1">Khai vị ba món</NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.2">Món bò</NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.3">Món tôm</NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.4">Món tráng miệng</NavDropdown.Item>
                        </NavDropdown>
                        <Nav.Link href="#link">Đồ uống</Nav.Link>
                        <NavDropdown title="Dịch vụ" id="basic-nav-dropdown">
                            <NavDropdown.Item href="#action/3.1">Tiệc cưới</NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.2">Tiệc hội nghị</NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.3">Tiệc sinh nhật</NavDropdown.Item>
                        </NavDropdown>
                    </Nav>
                    <Form inline>
                        <FormControl type="text" placeholder="Search" className="mr-sm-2" />
                        <Button variant="outline-success">
                            <FontAwesomeIcon icon={faSearch} color="gold"size="lg"/>
                        </Button>
                    </Form>
                </Navbar.Collapse>
            </Container>
        </Navbar>
    )
}