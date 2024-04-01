import React, { useState } from "react";
import styles from "./styles.module.css";
import RoomPreview from "../../components/RoomPreview/RoomPreview";


const RoomsViewPage = ({  }) => {

    return (
        <div className={styles.roomscontainer}>
            <RoomPreview />
        </div>
    )
}

export default RoomsViewPage;