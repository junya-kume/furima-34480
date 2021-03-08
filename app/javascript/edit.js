function calc() {
  const price = document.getElementById("price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const p_value = price.value
  const tax_v = parseInt(p_value * 0.1, 10);
  const pro_v = p_value - tax_v;

  tax.innerHTML = tax_v
  profit.innerHTML = pro_v
}
window.addEventListener("load", calc);