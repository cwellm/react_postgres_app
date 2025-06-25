import GenericListItem from "./GenericListItem";
import "./ListView.css"
import {useEffect, useState} from "react";

const keyAddressesMap = {
    "last_name": "Last Name",
    "first_name": "First Name",
    "street": "Street",
    "house_number": "House Number",
    "postal_code": "Postal Code",
    "city": "City",
    "country": "Country",
    "email": "E-Mail",
    "telephone": "Phone Number"
};

const hiddenKeys = {
    "id": "addressId"
}

function structureInput(itemList) {
    if (!itemList) {
        return [];
    }
    const result = [];
    for (const item of itemList) {
        const o = {};
        if (!("first_name" in item && "last_name" in item)) {
            continue;
        }
        o["title"] = `${item['first_name']} ${item['last_name']}`;
        const detail = {};
        const hiddenDetail = {};
        for (const [key, val] of Object.entries(item)) {
            if (key in keyAddressesMap) {
                if (key !== "first_name" && key !== "last_name") {
                    detail[keyAddressesMap[key]] = item[key];
                }
            }
            if (key in hiddenKeys) {
                hiddenDetail[key] = item[key];
            }
        }
        o["details"] = detail;
        o["hiddenDetails"] = hiddenDetail;
        result.push(o);
    }
    return result;
}

function onDeleteItem(itemId) {
    fetch('http://localhost:3001/rpc/delete_address', {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({"id": itemId})
    }).then(res => {
        if (res.status === 204) return null;
        return res.json();
    }).then((data) => {
        alert("Item deleted successfully");
    }).catch((err) => {
        alert(`error on deleting data: $err`);
    });
/*
       e.preventDefault();
        fetch('http://localhost:3001/rpc/add_address', {
            method: 'POST',
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        }).then(
            (res) => {
                if (res.status === 204) return null; // No content
                return res.json();
            }
        ).then(
            (data) => {
                alert("Data submitted successfully.");
            }
        ).catch((err) => {
            alert("Error on submitting data. Aborting.");
        });
        navigate("/");
 */
}

function GenericListView({itemListRefreshKey, datapoint=""}) {
    const [data, setData] = useState(null);
    const [refreshTrigger, setRefreshTrigger] = useState(0);
    useEffect( () => {
        if (datapoint === "") {
            return;
        }
        fetch("http://localhost:3001/rpc/get_all_addresses")
            .then(response => {
                if (!response.ok) {
                    throw new Error("Error occured when trying to fetch addresses.");
                }
                return response.json();
            }).then((responseData) => {
                setData(responseData);
        }).catch((err) => {
            console.error('Fetch error:', err);
            alert ("Error");
            //setError(err);
            //setLoading(false);
        }); }, [refreshTrigger, itemListRefreshKey]);
        const structuredInput = structureInput(data);
        const handleDeleteItem = (itemId) => {
            onDeleteItem(itemId);
            setRefreshTrigger(refreshTrigger + 1);
        }
        return (
            <div className="generic-list-view" onClick={(e) => {
                //alert("Clicked!");
            }}>
                {structuredInput.map((item) => (
                        <GenericListItem
                            title={item.title}
                            details={item.details}
                            hiddenDetails={item.hiddenDetails}
                            onModify={(e) => {
                                alert("Modify!");
                                e.stopPropagation();
                            }}
                            onDelete={handleDeleteItem}
                        />
                    )
                )
                }
                <div className="Test">

                </div>
            </div>
        );
}

export default GenericListView;