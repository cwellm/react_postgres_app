import {dummyDataAddresses} from "./dummy_data";
import GenericListItem from "./GenericListItem";
import { Link } from 'react-router';
import "./ListView.css"

function structureInput(itemList) {
    const result = [];
    for (const item of itemList) {
        const o = {};
        if (!("First Name" in item && "Last Name" in item)) {
            continue;
        }
        o["title"] = `${item['First Name']} ${item['Last Name']}`;
        const detail = {};
        for (const [key, val] of Object.entries(item)) {

            if (key !== "First Name" && key !== "Last Name") {
                detail[key] = val;
            }
        }
        o["details"] = detail;
        result.push(o);
    }
    return result;
}

function GenericListView() {
    const structuredInput = structureInput(dummyDataAddresses);
    return (
            <div className="generic-list-view" onClick={(e) => {alert("Clicked!");}}>
            {structuredInput.map((item) => (
            <GenericListItem
                title={item.title}
                details={item.details}
                onModify={(e) => {alert("Modify!"); e.stopPropagation();}}
                onDelete={(e) => {alert("Delete!"); e.stopPropagation();}}
            />
                )
                )
                }
            </div>
    );
}

export default GenericListView;