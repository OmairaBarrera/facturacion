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
  selection(e) {
    let $ = e.target;
    if ($.nodeName == "BUTTON") {
        let box = e.target.parentNode.parentNode;
        let inputs = box.querySelectorAll(`input`);
        if ($.innerHTML == "-") {
            inputs.forEach(element => {
                if (element.name == "amount" && element.value == 0) {
                    box.parentNode.remove();
                } else if (element.name == "amount") {
                    element.value--;
                }
            });
        } else if ($.innerHTML == "+") {
            inputs.forEach(element => {
                if (element.name == "amount") {
                    element.value++;
                }
            });
        }
    }
  }
  connectedCallback() {
    this.components().then((html) => {
      this.innerHTML = html;
      this.container = document.querySelector("#products");
      this.container.addEventListener("click", this.selection);
    });
  }
}
customElements.define("my-product", myProduct);
