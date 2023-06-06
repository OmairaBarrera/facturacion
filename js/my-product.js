//Importamos los estulos de bootstrap
import styles from "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" assert { type: "css" };
export class myProduct extends HTMLElement{
    constructor(){
        super();
        document.adoptedStyleSheets.push(styles);
    }
    async components(){
        return await ( await fetch("view/my-product.html")).text();
    }
    sumAmount() {
        this.amount = document.querySelector("#amount");
        this.amount.value++;
    }
    resAmount() {
        this.container =  document.querySelector(".products")
        this.amount = document.querySelector("#amount");
        this.amount.value == 0 ? this.container.remove() : this.amount.value--;
    }
    connectedCallback(){
        this.components().then(html=>{
            this.innerHTML=html;
            this.btn = document.querySelector("#btn-sum");
            this.btn.addEventListener("click", this.sumAmount);
            this.btn = document.querySelector("#btn-res");
            this.btn.addEventListener("click", this.resAmount);
        })
        
    }
}
customElements.define("my-product",myProduct);