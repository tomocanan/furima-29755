window.addEventListener("load",function(){
  const item_price = document.getElementById("item-price")
//金額を入力すると処理を開始する
  item_price.addEventListener("keyup", function(){
    console.log("ok");
//値取得して計算する
    var data = item_price.value;
    console.log(data);
    var profit = Math.round(data * 0.9)
    var fee = data - profit
//表示する
    var fee_span = document.getElementById("add-tax-price");
    fee_span.textContent = fee;
    var profit_span = document.getElementById("profit");
    profit_span.textContent = profit;
  });
});
