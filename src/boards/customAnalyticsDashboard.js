import AddressNameLetterHistogram from "./addressNameLetterHistogram";
import CountryPieChart from "./countryPieChart";
import MostFrequentEmailDomain from "./mostFrequentEmailDomain.tsx";
import MostFrequentPostalFirstDigit from "./mostFrequentPostalFirstDigit.tsx";

import Box, { Item } from 'devextreme-react/box';

import "./analyticsDashboard.scss";

export default function CustomAnalyticsDashboard() {
    return <div className="analytics-dashboard-container">
        <Box className="analytics-dashboard-box" id="analyticsAddressHistogram"
             direction="col"
             width="100%"
             height="100%"
        >
            <Item ratio={1} baseSize={350}>
                <div className="analytics-dashboard-item">
                    <AddressNameLetterHistogram id="addressNameLetterHistogram" />
                </div>
            </Item >
            <Item baseSize={250} ratio={1} className="analytics-dashboard-item">
                <div className="analytics-dashboard-item">
                    <Box className="analytics-dashboard-box"
                        direction="row"
                         width="100%"
                         height="100%"
                    >
                        <Item ratio={1} baseSize={350}>
                            <div className="analytics-dashboard-item-row">
                                <CountryPieChart />
                            </div>
                        </Item>
                        <Item ratio={1} baseSize={250}>
                            <div className="analytics-dashboard-item-row">
                                <div className="tickerCards">
                                    <MostFrequentEmailDomain />
                                    <MostFrequentPostalFirstDigit />
                                </div>
                            </div>
                        </Item>
                    </Box>
                </div>
            </Item>
        </Box>
    </div>
}

/*

        <Box
            id="globalHeaderBox"
            direction="col"
            height={"40vh"}
            align={"center"}
        >
        <Item baseSize={250} ratio={5}>
            <Box
                direction="row"
                height="100%"
                align={"center"}
            >
                <Item baseSize={200} ratio={1} shrink={1}>
                </Item>
                <Item baseSize={200} ratio={2} shrink={2}>
                    <img src={logo} className="App-logo" alt="logo" />
                </Item>
                <Item baseSize={200} ratio={1} shrink={1}>
                </Item>
            </Box>
        </Item>
 */