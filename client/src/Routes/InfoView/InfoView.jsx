import React, { useContext } from "react";
import { HotelsContext } from "../../context/HotelsContext";
import { useNavigate } from "react-router-dom";



const InfoView = () => {

  const {selectedRoom, setSelectedRoom} = useContext(HotelsContext);
  const {selectedHotel, setSelectedHotel} = useContext(HotelsContext);
  const {selectedEmployee, setSelectedEmployee} = useContext(HotelsContext);
  const {selectedCustomer, setSelectedCustomer} = useContext(HotelsContext);
  const {selectedBooking, setSelectedBooking} = useContext(HotelsContext);
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
    <div className="container col-auto shadow p-5 rounded-3">
      <div className="text-end">
        <button type="button" className="btn-close" onClick={handleClose}></button>
      </div>
      <div className="row text-center">
        <div className="col-sm-1 shadow rounded text-center border py-3" id="mainInfo">
            {infoType === "room" && (
              <div className="text-align-center">
                <div className="h6">Room</div>
                <div className="h3">{selectedRoom.roomnumber}</div>
              </div>
            )}
            {infoType === "hotel" && (
              <div className="text-align-center">
                <div className="h3">{selectedHotel.hotelname}</div>
                <div className="h6">{starsOutOfFive(selectedHotel.rating)}</div>
              </div>
            )}
            {infoType === "employe" && (
              <div className="text-align-center">
                <div className="h3">{selectedEmployee.name}</div>
                <div className="h6">{selectedEmployee.eid}</div>
              </div>
            )}
          </div>
        <div className="col" id="desc2">
          <div>
              <div>{selectedRoom.hotelname}</div>
              <div>{extractCityName(selectedRoom.hoteladdress)}</div>
              <div>{starsOutOfFive(selectedRoom.category)}</div>
          </div>
        </div>
        <div className="col">
          <div>
              <div>{selectedRoom.seaview ? "Sea view 🌊" : ""}</div>
              <div>{selectedRoom.mountainview ? "Mountain view ⛰️" : ""}</div>
              <div>{selectedRoom.extendable ? "Extendable" : ""}</div>
          </div>
        </div>
        <div className="col text-right">
          <div>
            <div>Check-In: {inputs.checkin}</div>
            <div>Check-Out: {inputs.checkout}</div>
          </div>
        </div>
      </div>
      <div className="row align-items-center">
        <div className="col-3"></div>
        <div className="col-6"></div>
        <div className="col-3"></div>
      </div>
      <div className="row align-items-center pt-4 text-center">
        <div className="col">
          {user_role >= 1 && (
            <button className="btn-success" onClick={handleSecondary}>Update</button>
          )}
        </div>
        <div className="col">
          <button className="btn-success" onClick={handlePrimary}>Book Now</button>
        </div>
        <div className="col">
          {user_role >= 1 && (
            <button className="btn-success" onClick={handleTertiary}>Check-In</button>
          )}
        </div>
      </div>
    </div>
  )
}

export default InfoView;

