import './TickerCard.scss';

class SimpleTickerCardProps {
    constructor(label, values, className=null) {
        this.label = label;
        this.values = values;
        this.className = className? className : "";
    }
}

export class SimpleTickerCard extends SimpleTickerCardProps {
    basicCardDOM() {
        const container = document.createElement("div");
        container.className = `simple-ticker-card ${this.className}`;

        const labelChild = document.createElement("div");
        labelChild.className = "label";
        labelChild.textContent = this.label;
        container.appendChild(labelChild);

        this.values.forEach((value, index) => {
            const div = document.createElement('div');
            div.textContent = value;
            div.className = "value";
            container.appendChild(div);
        })
        return container;
    };
}
