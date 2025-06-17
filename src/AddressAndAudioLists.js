import GenericListView from './GenericListView';
import "./AddressAndAudioLists.css";
import "./Buttons.css";
import React from "react";

function AddressAndAudioLists() {
    return (
        <div className="address-and-audio-list">
            <div id="address-list" className="content-lists">
                <div className="content-list-header">
                    <h2>Address List</h2>
                    <button className="btn add-btn" onClick={() => {alert("Add Address")}}>Add Address</button>
                </div>
                <GenericListView />
            </div>
            <div id="audio-list" className="content-lists">
                <div className="content-list-header">
                    <h2>Music List</h2>
                    <button className="btn add-btn" onClick={() => {alert("Add Music")}}>Add Music</button>

                </div>
                <GenericListView />
            </div>
        </div>
    )
}

export default AddressAndAudioLists;