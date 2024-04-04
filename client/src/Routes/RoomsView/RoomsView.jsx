import React, { useEffect, useContext } from "react";
import HotelSearch from "../../apis/HotelSearch";
import styles from "./styles.module.css";
import RoomPreview from "../../components/RoomPreview/RoomPreview";
import { HotelsContext } from "../../context/HotelsContext";



const RoomsView = (props) => {
        const {hotels, setHotels} = useContext(HotelsContext);
    useEffect(() => {
        const fetchData = async () => {
            try{
                const response = await HotelSearch.get("/hotels");
                setHotels(response.data.data.hotels);
            } catch (err) {
                console.error(err.message, hotels);
            }
        }
        fetchData(); 
    }, []);

    return (
        <div className={styles.roomscontainer}>
            <RoomPreview />
        </div>
    )
}

export default RoomsView;