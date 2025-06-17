import React from "react";
import "./List.css";
import "./Buttons.css";

export default function GenericListItem({ title, details, onModify, onDelete }) {
    return (
        <div className="item-card">
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
            </div>
            <div className="item-actions">
                <button className="btn modify-btn" onClick={onModify}>Modify</button>
                <button className="btn delete-btn" onClick={onDelete}>Delete</button>
            </div>
        </div>
    );
}