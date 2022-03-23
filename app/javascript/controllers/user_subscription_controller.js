import { Controller } from "@hotwired/stimulus"

const apiKey = process.env.KEY_STOCKS

let socket = new WebSocket(`wss://ws.twelvedata.com/v1/quotes/price?apikey=7782c19de0ca4141a7a44025ec564df1`);

export default class extends Controller {
  static targets = ["stocks"]

  connect() {
    const insertData = (data, stocks = this.stocksTarget) => {
      stocks.querySelector(`.${(data.symbol).toLowerCase().replace(/\W/, "")} .stock-value`).innerText = `$${data["price"].toFixed(3)}`
    }
    socket.onopen = function(e) {
      socket.send(`{
        "action": "subscribe",
        "params": {
        "symbols": "AAPL,INFY,TRP,QQQ,IXIC,EUR/USD,USD/JPY,BTC/USD,ETH/BTC"
        }
        }`);
    };
    socket.onmessage = function(event) {
      let data = JSON.parse(event.data);
      insertData(data)
    };
  }

  disconnect() {
    socket.close()
    socket = new WebSocket("wss://ws.twelvedata.com/v1/quotes/price?apikey=c6562a12261f45b2862ac84916e34674");
  }

}
