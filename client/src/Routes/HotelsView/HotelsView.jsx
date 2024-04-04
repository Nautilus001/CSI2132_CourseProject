import React, { useContext, useEffect } from "react";
import { HotelsContext } from "../../context/HotelsContext";
import { useNavigate } from "react-router-dom";
import HotelSearch from "../../apis/HotelSearch";


const HotelsView = () => {

    const { setSelectedHotel } = useContext(HotelsContext);
    const { setInfoType } = useContext(HotelsContext);
    const { hotels, setHotels } = useContext(HotelsContext);

    const navigate = useNavigate();

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await HotelSearch.get("/hotels");
                setHotels(response.data.data.hotels);
            } catch (err) {
                console.error(err.message);
            }
        }
        fetchData();
    },[]);

    const handleClick = (h) => {
        setSelectedHotel(h)
        setInfoType("hotel")
        navigate(`/${h.hotelid}/info`);
    }

    return (
        <div>
            <table className="table table-hover">
                <thead className="bg-secondary" style={{ position: "sticky", top: 0 }}>
                    <tr>
                        <td>Hotel ID</td>
                        <td>Hotel Name</td>
                        <td>Chain Name</td>
                        <td>Category</td>
                        <td>Address</td>
                        <td>Rooms</td>
                        <td>Email</td>
                        <td>Phone</td>
                    </tr>
                </thead>
                <tbody>
                    {hotels.map((h) => {
                        return(
                            <tr onClick={()=>{handleClick(h)}} style={{cursor: "pointer"}}>
                                <td>{h.hotelid}</td>
                                <td>{h.hotelname}</td>
                                <td>{h.chainname}</td>
                                <td>{h.category}</td>
                                <td>{h.hoteladdress}</td>
                                <td>{h.numrooms}</td>
                                <td>{h.contactemail}</td>
                                <td>{h.contactphone}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </table>
        </div>
    )
}

export default HotelsView;
