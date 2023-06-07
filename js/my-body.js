//Importamos los estulos de bootstrap
import styles from "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" assert { type: "css" };
export class myBody extends HTMLElement{
    constructor(){
        super();
        document.adoptedStyleSheets.push(styles);
    }
    async components(){
        return await ( await fetch("view/my-body.html")).text();
    }
    add(){
        let prodClon = this.product.cloneNode(true);
        this.querySelector('#products').insertAdjacentElement("beforeend", prodClon);
    }
    connectedCallback(){
        this.components().then(html=>{
            this.innerHTML=html;
            this.product = this.querySelector('my-product');
            this.btnAdd = document.querySelector('#add');
            this.btnAdd.addEventListener("click", this.add.bind(this));
        })
    }
}
customElements.define("my-body",myBody);