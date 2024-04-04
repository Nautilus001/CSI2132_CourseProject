import React, { useContext, useEffect } from "react";
import { HotelsContext } from "../../context/HotelsContext";
import { useNavigate } from "react-router-dom";
import HotelSearch from "../../apis/HotelSearch";


const RoomsView = () => {

    const { setSelectedRoom } = useContext(HotelsContext);
    const { setInfoType } = useContext(HotelsContext);
    const { rooms, setRooms } = useContext(HotelsContext);

    const navigate = useNavigate();

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await HotelSearch.get("/rooms");
                setRooms(response.data.data.rooms);
            } catch (err) {
                console.error(err.message);
            }
        }
        fetchData();
    },[]);

    const handleClick = (r) => {
        setSelectedRoom(r)
        setInfoType("room")
        navigate(`/${r.roomid}/info`);
    }

    function extractCityName(address) {
        const parts = address.split(','); 
        const city = parts[parts.length - 1].trim(); 
        return(city); 
    }

    function starsOutOfFive(n) {
        if (typeof n !== 'number' || isNaN(n) || n < 0 || n > 5) {
            return 'Invalid input. Please provide a number between 0 and 5.';
        }
    
        const solidStars = '★'.repeat(n);
    
        const emptyStars = '☆'.repeat(5 - n);
    
        const stars = solidStars + emptyStars;
    
        return stars;
    }

    return (
        <div>
            <table className="table table-hover">
                <thead className="bg-secondary" style={{ position: "sticky", top: 0 }}>
                    <tr>
                        <td>Hotel</td>
                        <td>Capacity</td>
                        <td>Views</td>
                        <td>Price</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    {rooms.map((room) => {
                            return(
                                <tr onClick={()=>{handleClick(room)}} style={{cursor: "pointer"}}>
                                    <td className="align-middle">
                                        <div>
                                            <div>{room.hotelname}</div>
                                            <div>{extractCityName(room.hoteladdress)}</div>
                                            <div>{starsOutOfFive(room.category)}</div>
                                        </div>
                                    </td>
                                    <td className="align-middle">{room.capacity}</td>
                                    <td className="align-middle">
                                        <div>
                                            <div>{room.seaview ? "Sea view" : ""}</div>
                                            <div>{room.mountainview ? "Mountain view" : ""}</div>
                                            <div>{room.extendable ? "Extendable" : ""}</div>
                                        </div>
                                    </td>
                                    <td className="h6 align-middle">${room.pricepernight}</td>
                                </tr>
                            )
                        })}
                </tbody>
            </table>
        </div>
    )
}

export default RoomsView;
