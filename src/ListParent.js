// ItemList.jsx
import React from "react";
import ItemCard from "./GenericListItem";

const data = [
    {
        id: 1,
        title: "Project Alpha",
        details: { Status: "Active", Owner: "Alice", Created: "2023-08-12" },
    },
    {
        id: 2,
        title: "Project Beta",
        details: { Status: "Pending", Owner: "Bob", Created: "2024-01-22" },
    },
];

export default function ItemList() {
    const handleModify = (id) => {
        alert(`Modify item ${id}`);
    };

    const handleDelete = (id) => {
        alert(`Delete item ${id}`);
    };

    return (
        <div style={{ maxWidth: "600px", margin: "40px auto" }}>
            {data.map((item) => (
                <ItemCard
                    key={item.id}
                    title={item.title}
                    details={item.details}
                    onModify={() => handleModify(item.id)}
                    onDelete={() => handleDelete(item.id)}
                />
            ))}
        </div>
    );
}