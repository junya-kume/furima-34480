function calc() {
  const price = document.getElementById("price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("keyup", function(){
    tax.innerHTML = parseInt(price.value * 0.1, 10);
    profit.innerHTML = (price.value - tax.innerHTML);
  });
}
window.addEventListener("load", calc);