import 'devextreme/dist/css/dx.light.css';
import './App.css';

import {Routes, Route } from "react-router";

import AddressAndAudioLists from "./AddressAndAudioLists";
import AddressForm from "./forms/AddressForm";
import MusicForm from "./forms/MusicForm";
import FormContainer from "./forms/FormContainer";

import {useEffect, useState} from "react";
import {useLocation} from "react-router";
import CustomAnalyticsDashboard from "./boards/customAnalyticsDashboard";

import HeaderElement from "./header/headerElement";
import NavigationElement from "./navigation/navigationElement";

function App() {
    const [itemListRefreshKey, setItemListRefreshKey] = useState(0);
    const location = useLocation();
    useEffect(() => {
        if (location.pathname === '/') {
            setItemListRefreshKey(prev => prev + 1);
        }
    }, [location.pathname]);
  return (
    <div className="App">
        <div className="App-header-div">
            <HeaderElement />
        </div>
        <div className="App-nav-div">
            <NavigationElement />
        </div>
        <div className="AppBody">
                <Routes>
                    <Route path="/" element={<AddressAndAudioLists itemListRefreshKey={itemListRefreshKey}/>} />
                    <Route path={"/form_addresses"} element={<FormContainer childForm={<AddressForm />} />} />
                    <Route path={"/form_music"} element={<FormContainer childForm={<MusicForm />} />} />
                    {/*<Route path={"/dashboard"} element={<AnalyticsDashboard />} /> */}
                    <Route path={"/analytics-dashboard"} element={<CustomAnalyticsDashboard />} />
                </Routes>
        </div>
    </div>
  );
}

export default App;
