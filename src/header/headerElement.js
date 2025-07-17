import React from "react";
import logo from '../app_logo_transparent.png';

import Box, { Item } from 'devextreme-react/box';
import "./headerElement.scss";



export default function HeaderElement() {
    return (
    <header className="AddressesAndMusic App-header">
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
        <Item baseSize={10} ratio={2}>
            <Box
                direction="row"
                height={"10vh"}
                align={"center"}
            >
                <Item ratio={1} shrink={1}>
                    <div className="h1-container">
                        <h1 id="headerHeading">Addresses & Music</h1>
                    </div>
                </Item>
            </Box>
        </Item>
        </Box>
    </header>
    );
};
