import React, { useState, createContext } from 'react';

export const HotelsContext = createContext();

export const HotelsContextProvider = (props) => {
    const [rooms, setRooms] = useState([]);
    const [selectedRoom, setSelectedRoom] = useState(null);
    const [user_role, setUserRole] = useState(0);

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
            user_role: user_role,
            setUserRole: setUserRole,
        }}>
            {props.children} 
        </HotelsContext.Provider>
    );
};