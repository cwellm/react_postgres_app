import {API_URL} from "../config/config";

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
    fetch(`${API_URL}/rpc/delete_address`, {
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
        if (data?.code) {
            alert(`There was a problem deleting: ${data.details}`);
            return;
        }
        alert("Item deleted successfully");
    }).catch((err) => {
        alert(`error on deleting data: $err`);
    });
}

function fetchData() {
    return fetch(`${API_URL}/rpc/get_all_addresses`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Error occurred when trying to fetch addresses.");
            }
            return response.json();
        }).catch((err) => {
                console.error('Fetch error:', err);
                alert (`Error: ${err}`);
            }
        );
}

export {structureInput, onDeleteItem, fetchData};