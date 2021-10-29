import { useState } from "react";
import { Button, Form } from "react-bootstrap";
import { useDispatch } from "react-redux";
import { useHistory } from "react-router";
import { loginUser } from "../ActionCreators/UserCreators";
import API, { endpoints } from "../../configs/API";
import cookies from 'react-cookies'

export default function Login() {
    const [username, setUsername] = useState()
    const [password, setPassword] = useState()
    const dispatch = useDispatch()
    const history = useHistory()

    const login = async (event) => {
        event.preventDefault()

        try {
            let info = await API.get(endpoints['oauth2-info'])
            /* console.info(info) */
            let res = await API.post(endpoints['login'], {
                "client_id": info.data.client_id,
                "client_secret": info.data.client_secret,
                "username": username,
                "password": password,
                "grant_type": "password"
            })

            cookies.save("access_token", res.data.access_token)

            let user = await API.get(endpoints['current-user'], {
                headers: {
                    'Authorization': `Bearer ${cookies.load("access_token")}`
                }
            })

            console.info(user)

            cookies.save("user", user.data)

            dispatch(loginUser(user.data))
            history.push("/")
        } catch(err) {
            console.error(err)
        }
    }

    return (
        <>
            <div className="row" style={{marginTop: "5%"}}>
                <div className="col-md-4"></div>
                <div className="col-md-4">
                    <h1 className="text-center text-danger">ĐĂNG NHẬP</h1>
                    <Form onSubmit={login} style={{marginTop: "5%"}}>
                        <Form.Group className="mb-3" controlId="formBasicEmail">
                            <Form.Label>Tên đăng nhập</Form.Label>
                            <Form.Control type="text"
                                        placeholder="Tên đăng nhập"
                                        value={username}
                                        onChange={(event) => setUsername(event.target.value)} />
                        </Form.Group>

                        <Form.Group className="mb-3" controlId="formBasicPassword">
                            <Form.Label>Mật khẩu</Form.Label>
                            <Form.Control type="password"
                                        placeholder="Mật khẩu"
                                        value={password}
                                        onChange={(event) => setPassword(event.target.value)} />
                        </Form.Group>

                        <Button variant="primary" type="submit">
                            Đăng nhập
                        </Button>
                    </Form>
                </div>
                <div className="col-md-4"></div>
            </div>
        </>
    )
}