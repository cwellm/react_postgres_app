import GenericListView from './GenericListView';
import "./AddressAndAudioLists.css";
import "./Buttons.css";
import React from "react";

import { useNavigate } from 'react-router';

import 'devextreme/dist/css/dx.light.css';
import Button from 'devextreme-react/button';

import {structureInput as address_structureInput, onDeleteItem as address_onDeleteItem, fetchData as address_fetchData}
    from './functional_modules/addressDbComm'

import {structureInput as music_structureInput, onDeleteItem as music_onDeleteItem, fetchData as music_fetchData}
    from './functional_modules/musicDbComm'



function AddressAndAudioLists(itemListRefreshKey) {
    const navigate = useNavigate();
    return (
        <div className="mainAppBody" id="mainAppBody">
            <div className="address-and-audio-list">
                <div id="address-list" className="content-lists">
                    <div className="content-list-header">
                        <h2>Address List</h2>
                        <button className="btn add-btn" onClick={() => {navigate("/form_addresses");}}>Add Address</button>
                    </div>
                    <GenericListView itemListRefreshKey={itemListRefreshKey} fetchData={address_fetchData}
                                     structureInput={address_structureInput} onDeleteItem={address_onDeleteItem}/>
                </div>
                <div id="audio-list" className="content-lists">
                    <div className="content-list-header">
                        <h2>Music List</h2>
                        <button className="btn add-btn" onClick={() => {navigate("/form_music");}}>Add Music</button>

                    </div>
                    <GenericListView itemListRefreshKey={itemListRefreshKey} fetchData={music_fetchData}
                                     structureInput={music_structureInput} onDeleteItem={music_onDeleteItem}/>
                </div>
            </div>
        </div>
    )
}

export default AddressAndAudioLists;