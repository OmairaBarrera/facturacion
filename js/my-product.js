//Importamos los estulos de bootstrap
import styles from "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" assert { type: "css" };
export class myProduct extends HTMLElement {
  constructor() {
    super();
    document.adoptedStyleSheets.push(styles);
  }
  async components() {
    return await (await fetch("view/my-product.html")).text();
  }
  //modificar esta parte del codigo ya que no funciona cuando se clona el elemento
  /* sumAmount() {
        this.amount = document.querySelector(".amount");
        this.amount.value++;
    }
    resAmount() {
        this.container =  document.querySelector(".products")
        this.amount = document.querySelector(".amount");
        this.amount.value == 0 ? this.container.remove() : this.amount.value--;
    } */
  operaciones(e) {
    this.amount = document.querySelector("#amount");
    let btn = e.target.nodeName;
    if (btn == "BUTTON") {
      e.target.textContent === "+" ? this.amount.value++ : null;
      e.target.textContent === "-"
        ? this.amount.value == 0
          ? e.target.parentNode.parentNode.parentNode.remove()
          : this.amount.value--
        : false;
    }
  }
  connectedCallback() {
    this.components().then((html) => {
      this.innerHTML = html;
      this.container = document.querySelector(".products");
      this.container.addEventListener("click", this.operaciones);
      /* this.btnSum.addEventListener("click", this.sumAmount);
            this.btnRes = document.querySelector(".btn-res");
            this.btnRes.addEventListener("click", this.resAmount); */
    });
  }
}
customElements.define("my-product", myProduct);
