import React, { useContext } from "react";
import { HotelsContext } from "../../context/HotelsContext";
import { useNavigate } from "react-router-dom";



const UpdateView = () => {

    const { selectedRoom, setSelectedRoom } = useContext(HotelsContext);
    const { selectedHotel, setSelectedHotel } = useContext(HotelsContext);
    const { selectedEmployee, setSelectedEmployee } = useContext(HotelsContext);
    const { selectedCustomer, setSelectedCustomer } = useContext(HotelsContext);
    const { selectedBooking, setSelectedBooking } = useContext(HotelsContext);
    const { inputs, setInputs } = useContext(HotelsContext);
    const { user_role, setUserRole } = useContext(HotelsContext);
    const { infoType, setInfoType } = useContext(HotelsContext);

    const navigate = useNavigate();
    
    const handleClose = () => {
        navigate(`/booknow`);
    }

    const handlePrimary = () => {
        switch(infoType){
        case "room":
            navigate(`/booknow/${selectedRoom.roomid}`);
            break;
        }
    }

    const handleChange = (event) => { 
        const name = event.target.name; 
        const value = event.target.value;
        switch(infoType){
            case "room":
                setSelectedRoom(values => ({...values, [name]: value}))
                break;
            }
        
    }

    const handleSecondary = () => {
        navigate(`/${selectedRoom.roomid}/update`);
    }

    const handleTertiary = () => {
        navigate(`/${selectedRoom.roomid}/checkin`);
    }

    const extractCityName = (address) => {
        if(address != null){
        const parts = address.split(','); 
        const city = parts[parts.length - 1].trim(); 
        return(city); 
        }
        return (null);
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
        <form>
            <div className="container col-auto shadow p-5 rounded-3">
                <div className="text-end">
                    <button type="button" className="btn-close" onClick={handleClose}></button>
                </div>
                <div className="row">
                    <div className="col-sm-1 shadow rounded border py-3" id="mainInfo">
                        {infoType === "room" && (
                            <div className="text-align-center">
                                <div className="h6 m-3">Room</div>
                                <input className="form-control" type="text" name="roomnumber" value={selectedRoom.roomnumber} onChange={handleChange} />
                            </div>
                        )}
                        {infoType === "hotel" && (
                            <div className="text-align-center">
                                <input className="form-control" type="text" name="hotelname" value={selectedHotel.hotelname} onChange={handleChange} />
                                
                            </div>
                        )}
                        {infoType === "employee" && (
                            <div className="text-align-center">
                                <input className="form-control" type="text" name="name" value={selectedEmployee.name} onChange={handleChange} />
                                <input className="form-control" type="text" name="eid" value={selectedEmployee.eid} onChange={handleChange} />
                            </div>
                        )}
                    </div>
                    <div className="col" id="desc2">
                        {infoType === "hotel" && (
                            <div>
                                <input className="form-control" type="text" name="hotelname" value={selectedRoom.hotelname} onChange={handleChange} />
                                <input className="form-control" type="text" name="city" value={extractCityName(selectedRoom.hoteladdress)} onChange={handleChange} />
                                <select 
                                    className="form-select" 
                                    name="rating"
                                    value={selectedRoom.rating || "1"}
                                    onChange={handleChange}
                                >
                                    <option value={null}>Any</option>
                                    <option value={1}>★☆☆☆☆</option>
                                    <option value={2}>★★☆☆☆</option>
                                    <option value={3}>★★★☆☆</option>
                                    <option value={4}>★★★★☆</option>
                                    <option value={5}>★★★★★</option>
                                </select> 
                            </div>
                        )}
                        
                    </div>
                    <div className="col">
                        <div>
                            <div className="form-check form-switch">
                                <label className="form-check-label" htmlFor="seaview">
                                    Sea view 🌊
                                </label>
                                <input className="form-check-input" type="checkbox" id="seaview" name="seaview" checked={selectedRoom.seaview} onChange={handleChange} />
                                
                            </div>
                            <div className="form-check form-switch">
                                <input className="form-check-input" type="checkbox" id="mountainview" name="mountainview" checked={selectedRoom.mountainview} onChange={handleChange} />
                                <label className="form-check-label" htmlFor="mountainview">
                                    Mountain view ⛰️
                                </label>
                            </div>
                            <div className="form-check form-switch">
                                <input className="form-check-input" type="checkbox" id="extendable" name="extendable" checked={selectedRoom.extendable} onChange={handleChange} />
                                <label className="form-check-label" htmlFor="extendable">
                                    Extendable
                                </label>
                            </div>
                        </div>
                    </div>
                    <div className="col text-right">
                        {infoType === 'room' && (
                            <div>
                                <div>
                                    <label className="form-label">Price Per Night: </label>
                                    <input className="form-control" type="number" name="pricepernight" value={selectedRoom.pricepernight} onChange={handleChange} />
                                    <label className="form-label">Capacity: </label>
                                    <input className="form-control" type="number" name="capacity" value={selectedRoom.capacityz} onChange={handleChange} />
                                </div>
                            </div>
                        )}
                        {infoType === 'booking' && (
                            <div>
                                <div>Check-In: <input className="form-control" type="date" name="checkin" value={inputs.checkin} onChange={handleChange} /></div>
                                <div>Check-Out: <input className="form-control" type="date" name="checkout" value={inputs.checkout} onChange={handleChange} /></div>
                            </div>
                        )}
                        
                    </div>
                </div>
                <div className="row align-items-center">
                    <div className="col-3"></div>
                    <div className="col-6"></div>
                    <div className="col-3"></div>
                </div>
                <div className="row align-items-center pt-4 text-center">
                    <div className="col">
                        <button className="btn-success" onClick={handleSecondary}>Cancel</button>
                    </div>
                    <div className="col">
                        <button className="btn-success" onClick={handlePrimary}>Save</button>
                    </div>
                    <div className="col">
                        <button className="btn-success" onClick={handleTertiary}>Delete</button>
                    </div>
                </div>
            </div>
        </form>
    )
    }

    export default UpdateView;

