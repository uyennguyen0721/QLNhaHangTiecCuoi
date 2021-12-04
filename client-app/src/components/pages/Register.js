import { useRef, useState } from "react";
import { Button, Form } from "react-bootstrap";
import { useHistory } from "react-router-dom";
import API, { endpoints } from "../../configs/API";

export default function Register() {
    const [username, setUsername] = useState()
    const [password, setPassword] = useState()
    const [confirmPassword, setConfirmPassword] = useState()
    const [firstName, setFirstName] = useState()
    const [lastName, setLastName] = useState()
    const [email, setEmail] = useState()
    const avatar = useRef()
    const history = useHistory()

    const register = (event) => {
        event.preventDefault()
        let registerUser = async () => {
            const formData = new FormData()
            formData.append("first_name", firstName)
            formData.append("last_name", lastName)
            formData.append("email", email)
            formData.append("password", password)
            formData.append("username", username)
            formData.append("avatar", avatar.current.files[0])

            try {
                await API.post(endpoints['register'], formData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                })

                history.push("/login")
            } catch (err) {
                console.error(err)
            }

        }

        if (password !== null && password === confirmPassword) {
            registerUser()
        }
    }


    return (
        <>
          <div className="row" style={{marginLeft: "2%", marginRight: "2%"}}>
            <div className="col-md-4 col-xs-12"></div>
            <div className="col-md-4 col-xs-12 card" style={{marginBottom: "5%", backgroundColor: "#CECEF6"}}>
              <div style={{margin: "5%"}}>
                <h1 className="text-center text-danger">ĐĂNG KÝ</h1>
                <Form onSubmit={register}>
                    <RegisterForm id="lastName" label="Họ"
                                    type="text" value={lastName} placeholder="Họ"
                                    change={(event) => setLastName(event.target.value)}  />
                    <RegisterForm id="firstName" label="Tên"
                                    type="text" value={firstName}
                                    placeholder="Tên"
                                    change={(event) => setFirstName(event.target.value)}  />
                    <RegisterForm id="email" label="Email"
                                    type="email" value={email}
                                    placeholder="Email"
                                    change={(event) => setEmail(event.target.value)}  />
                    <RegisterForm id="username" label="Tên đăng nhập"
                                    type="text" value={username}
                                    placeholder="Tên đăng nhập"
                                    change={(event) => setUsername(event.target.value)}  />
                    <RegisterForm id="password" label="Mật khẩu"
                                    type="password" value={password}
                                    placeholder="Mật khẩu"
                                    change={(event) => setPassword(event.target.value)}  />
                    <RegisterForm id="confirm" label="Nhập lại mật khẩu"
                                    type="password" value={confirmPassword}
                                    placeholder="Nhập lại mật khẩu"
                                    change={(event) => setConfirmPassword(event.target.value)}  />
                    <Form.Group className="mb-3" controlId="avatar">
                        <Form.Label>Ảnh đại diện</Form.Label>
                        <Form.Control type="file" ref={avatar} className="form-control" />
                    </Form.Group>

                    <Button className="form-control" variant="primary" type="submit">
                        Đăng ký
                    </Button>
                    <p class="text-right" style={{marginTop: "3%"}}>Bạn đã có tài khoản? <a href="/login">Đăng nhập</a></p>
                </Form>
              </div>
            </div>
            <div className="col-md-4 col-xs-12"></div>
          </div>
        </>
    )
}

function RegisterForm(props) {
    return (
    <Form.Group className="mb-3" controlId={props.id}>
        <Form.Label>{props.label}</Form.Label>
        <Form.Control type={props.type}
                      value={props.value}
                      onChange={props.change}
                      placeholder={props.placeholder} />
    </Form.Group>
  )
}