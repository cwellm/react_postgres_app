import AddressNameLetterHistogram from "./addressNameLetterHistogram";
import CountryPieChart from "./countryPieChart";
import MostFrequentEmailDomain from "./mostFrequentEmailDomain.tsx";
import MostFrequentPostalFirstDigit from "./mostFrequentPostalFirstDigit.tsx";

import Button from "devextreme-react/button";

import { useNavigate } from 'react-router';


export default function CustomAnalyticsDashboard() {
    const navigate = useNavigate();

    return <div>
        <Button
            text="Lists Overview"
            onClick={() => {
                navigate("/");
            }}
            stylingMode="contained"
            icon="isblank"
        />
        <AddressNameLetterHistogram />
        <CountryPieChart />
        <MostFrequentEmailDomain />
        <MostFrequentPostalFirstDigit />
    </div>
}