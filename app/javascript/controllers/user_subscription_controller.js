import { Controller } from "@hotwired/stimulus"

let socket = new WebSocket("wss://ws.twelvedata.com/v1/quotes/price?apikey=c6562a12261f45b2862ac84916e34674");

export default class extends Controller {
  static targets = ["stocks"]

  connect() {
    const insertData = (data, stocks = this.stocksTarget) => {
      stocks.querySelector(`.${(data.symbol).toLowerCase()} .stock-value`).innerText = `$${data["price"].toFixed(3)}`
    }
    console.log(socket)
    socket.onopen = function(e) {
      console.log(socket)
      console.log("Connection established");
      socket.send(`{
        "action": "subscribe",
        "params": {
        "symbols": "AAPL,INFY,TRP,QQQ,IXIC,EUR/USD,USD/JPY,BTC/USD,ETH/BTC"
        }
        }`);
    };
    socket.onmessage = function(event) {
      let data = JSON.parse(event.data)
      console.log(data);
      insertData(data)
    };
  }

  disconnect() {
    socket.close()
    socket = new WebSocket("wss://ws.twelvedata.com/v1/quotes/price?apikey=c6562a12261f45b2862ac84916e34674");
    console.log("Unsubscribed from the chatroom")
  }

}
