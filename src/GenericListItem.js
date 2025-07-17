import React, {useState} from "react";
import "./List.css";
import "./Buttons.css";

import DeleteCancelOptions  from "./popups/DeleteCancel";

export default function GenericListItem({ title, details, links, hiddenDetails, onModify, onDelete }) {
    const [confirmDelete, setConfirmDelete] = useState(false);
    if (!links) {
        links = [];
    }
    return (
        <div className="item-card">
            {!confirmDelete ? (
            <div className="regularItemNonDelete">
            <div className="item-left">
                <h2 className="item-title">{title}</h2>
                <ul className="item-details">
                    {Object.entries(details).map(([key, val]) => (
                        <li key={key} className="item-line">
                            <div className="item-key">{key}:</div>
                            <div className="item-val">{val}</div>
                        </li>
                    ))}
                </ul>
                <ul className="item-details">
                    {links.map((link) => (
                        <li className="item-line">
                            <a href={link} target="_blank" rel="noopener noreferrer">Listen</a>
                        </li>
                    ))}
                </ul>
                {
                    Object.entries(hiddenDetails).map(([key, val]) => (
                        <input key={key} type="hidden" name={key} value={val} />
                    ))
                }
            </div>
            <div className="item-actions">
                <button className="btn modify-btn" onClick={onModify}>Modify</button>
                <button className="btn delete-btn" onClick={() =>{setConfirmDelete(true);}}>Delete</button>
            </div>
            </div>) :
                <div className="regularItemDelete">
                    <DeleteCancelOptions
                        onConfirmDelete={() => {onDelete(hiddenDetails.id); setConfirmDelete(false);}}
                        onCancel={() => {setConfirmDelete(false);}}
                    />
                </div>
            }
        </div>
    );
}