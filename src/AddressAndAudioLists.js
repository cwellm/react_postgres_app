import GenericListView from './GenericListView';
import "./AddressAndAudioLists.css";
import "./Buttons.css";
import React from "react";

import { useNavigate } from 'react-router';


function AddressAndAudioLists(itemListRefreshKey) {
    const navigate = useNavigate();
    return (
        <div className="address-and-audio-list">
            <div id="address-list" className="content-lists">
                <div className="content-list-header">
                    <h2>Address List</h2>
                    <button className="btn add-btn" onClick={() => {navigate("/form_addresses");}}>Add Address</button>
                </div>
                <GenericListView itemListRefreshKey={itemListRefreshKey} datapoint="a"/>
            </div>
            <div id="audio-list" className="content-lists">
                <div className="content-list-header">
                    <h2>Music List</h2>
                    <button className="btn add-btn" onClick={() => {navigate("/form_music");}}>Add Music</button>

                </div>
                <GenericListView itemListRefreshKey={itemListRefreshKey} datapoint="a"/>
            </div>
        </div>
    )
}

export default AddressAndAudioLists;