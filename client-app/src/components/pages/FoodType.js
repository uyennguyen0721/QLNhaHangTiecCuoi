import React, { useEffect, useState } from "react";
import HeaderSection from "./HeaderSection";
import Slider from "../Slider/Slider";
import Footer from '../layout/Footer'
import '../css/MenuFood.css'
import { Button } from "../layout/Button";
import API, { endpoints } from "../../configs/API";

export default function FoodType () {

    const [foodType, setFoodType] = useState([])

    useEffect(() => {
        async function fetchAPI () {
            let res = await API.get(endpoints['food_type'])
            setFoodType(res.data.results)
        }
        fetchAPI()
    })

    return (
        <>
            <HeaderSection
                src="/images/foods-bg.jpg"
                name="Thực đơn"
            />
            <div className="menu-food row">
                <div className="col-md-6 col-xs-12">
                    <h1>THỰC ĐƠN</h1>
                    <p className="introduce">Được các chuyên gia ẩm thực giàu kinh nghiệm của Glorian chế biến, thực đơn của chúng tôi luôn được đầu tư và đổi mới liên tục sẽ mang đến cho thực khách những món ăn đa dạng và có sự dung hoà giữa văn hoá ẩm thực Á - Âu, đáp ứng tất cả các nhu cầu của quý khách.</p>
                    <div className="food-type row">
                        {
                            foodType.length!==0 && foodType.map (f =>
                                <div className="col-md-4 col-xs-12">
                                    <Button
                                        className='btns'
                                        buttonStyle='btn--secondary'
                                        buttonSize='btn--medium--secondary'
                                        to={`/food-type/${f.id}/menu-foods/`}
                                        key={f.id}
                                    >
                                        {f.name}
                                    </Button>
                                </div>
                            )
                        }
                    </div>
                    <p><i>&gt;&gt; Xem tất cả món ăn <a href="/menu-foods">Tại đây</a></i></p>
                </div>
                <div className="col-md-6 col-xs-12">
                    <Slider/>
                </div>
                <div className="about">
                    <p className="introduce">GLORIAN - Nhà hàng tiệc cưới mang đến thực đơn hoàn hảo nhất cho lễ cưới của bạn</p>
                    <p>Tại thành phố Hồ Chí Minh, có rất nhiều nhà hàng tiệc cưới bạn có thể an tâm lựa chọn cho ngày trọng đại của mình. Trong đó, Glorian là một trong những địa chỉ uy tín hàng đầu. Glorian không chỉ được biết đến là một nhà hàng tổ chức tiệc cưới đẹp với những sảnh cưới riêng biệt, nhiều màu sắc khác nhau mà còn được biết đến là nhà hàng với thực đơn tiệc cưới ấn tượng và chất lượng. Các bếp trưởng tại Glorian luôn chú tâm đến thực đơn, không chỉ sao cho chất lượng nhất mà còn phù hợp với từng vùng miền, vừa hài hòa về khẩu vị, kích thích cảm xúc, lại vừa phù hợp ngân sách của cô dâu chú rể.</p>
                    <p>Không dừng lại ở những món ăn thuần túy của dân tộc, nhà hàng tiệc cưới Glorian còn nghiên cứu về ẩm thực Á, Âu để cho ra đời nhiều món ăn ngon – lạ – đẹp mắt nhưng vẫn phù hợp với khẩu vị người Việt. Để có được những điều đó là nhờ sự thấu hiểu về khẩu vị của thực khách của các đầu bếp lành nghề, dày dặn kinh nghiệm tại Glorian.</p>
                    <p>Chính những điều đó đã làm nên thương hiệu và uy tín cho nhà hàng tiệc cưới Glorian. Là một trong số ít nhà hàng không chỉ làm hài lòng cô dâu, chú rể mà còn cả chính những người tham dự.</p>
                    <p>Nếu bạn đang tìm kiếm một nhà hàng với thực đơn tiệc cưới vừa chất lượng lại phù hợp với khẩu vị của đa số khách tham dự thì đừng nên bỏ qua nhà hàng tiệc cưới Glorian. Chắc chắn rằng những gì mà Glorian mang đến sẽ khiến bạn vô cùng hài lòng. Bạn một buổi lễ trọng đại hạnh phúc và không thể nào quên.</p>
                </div>
            </div>
            <Footer />
        </>
    )
}