//Importamos los estulos de bootstrap
import styles from "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" assert { type: "css" };
export class myProduct extends HTMLElement{
    constructor(){
        super();
    }
    async components(){
        return await ( await fetch("view/my-product.html")).text();
    }
    connectedCallback(){
        document.adoptedStyleSheets.push(styles);
        this.components().then(html=>{
            this.innerHTML=html;
        })
    }
}
customElements.define("my-product",myProduct);