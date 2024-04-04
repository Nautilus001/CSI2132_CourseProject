import React, { useState, createContext } from 'react';

export const HotelsContext = createContext();

export const HotelsContextProvider = (props) => {
    const [rooms, setRooms] = useState([]);
    const [selectedRoom, setSelectedRoom] = useState(null);

    const [inputs, setInputs] = useState({
        checkin: null,
        checkout: null,
        maxPrice: null,
        city: null,
        minCapacity: null,
        chain: null,
        rating: null,
        maxRooms: null,
    });

    return (
        <HotelsContext.Provider value={{
            rooms: rooms, 
            setRooms: setRooms,
            inputs: inputs,
            setInputs: setInputs,
        }}>
            {props.children} 
        </HotelsContext.Provider>
    );
};