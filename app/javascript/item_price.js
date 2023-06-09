window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price");
  const netProfitElement = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    netProfitElement.innerHTML = Math.floor( inputValue - addTaxDom.innerHTML );
  });
});