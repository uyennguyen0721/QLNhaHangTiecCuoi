import { useRef, useState } from "react";
import { Button, Form } from "react-bootstrap";
import { useHistory } from "react-router";
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
          <div className="row">
            <div className="col-md-4"></div>
            <div className="col-md-4">
              <h1 className="text-center text-danger">ĐĂNG KÝ</h1>
              <Form onSubmit={register}>
                  <RegisterForm id="lastName" label="Họ"
                                type="text" value={lastName}
                                change={(event) => setLastName(event.target.value)}  />
                  <RegisterForm id="firstName" label="Tên"
                                type="text" value={firstName}
                                change={(event) => setFirstName(event.target.value)}  />
                  <RegisterForm id="email" label="Email"
                                type="email" value={email}
                                change={(event) => setEmail(event.target.value)}  />
                  <RegisterForm id="username" label="Tên đăng nhập"
                                type="text" value={username}
                                change={(event) => setUsername(event.target.value)}  />
                  <RegisterForm id="password" label="Mật khẩu"
                                type="password" value={password}
                                change={(event) => setPassword(event.target.value)}  />
                  <RegisterForm id="confirm" label="Nhập lại mật khẩu"
                                type="password" value={confirmPassword}
                                change={(event) => setConfirmPassword(event.target.value)}  />
                  <Form.Group className="mb-3" controlId="avatar">
                      <Form.Label>Ảnh đại diện</Form.Label>
                      <Form.Control type="file" ref={avatar} className="form-control" />
                  </Form.Group>

                  <Button variant="primary" type="submit">
                    Đăng ký
                  </Button>
              </Form>
            </div>
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
                      onChange={props.change} />
    </Form.Group>
  )
}