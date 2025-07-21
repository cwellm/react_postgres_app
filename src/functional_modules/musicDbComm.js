import {API_URL} from "../config/config";

const keyAddressesMap = {
    "interpreter": "Interpreter",
    "musical_piece_name": "Piece",
    "music_link": "Listen",
};

const hiddenKeys = {
    "id": "musicId"
}

function structureInput(itemList) {
    let itemCount = 1;
    if (!itemList) {
        return [];
    }
    const result = [];
    for (const item of itemList) {
        const o = {};
        o["title"] = `Title ${itemCount}`;
        const detail = {};
        const hiddenDetail = {};
        for (const [key, _] of Object.entries(item)) {
            if (key in keyAddressesMap && key !== "music_link") {
                detail[keyAddressesMap[key]] = item[key];
            }
            if (key in hiddenKeys) {
                hiddenDetail[key] = item[key];
            }
            if (key === "music_link") {
                o["links"] = [];
                //for (const link of item["links"]) {
                //    o["links"].push(link);
                //}

                // at the moment, db only stores a single link, not an array
                o["links"].push(item[key]);
            }
        }
        o["details"] = detail;
        o["hiddenDetails"] = hiddenDetail;
        result.push(o);
        itemCount++;
    }
    return result;
}

function onDeleteItem(itemId) {
    fetch(`${API_URL}/rpc/delete_music`, {
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
    return fetch(`${API_URL}/rpc/get_all_music`)
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