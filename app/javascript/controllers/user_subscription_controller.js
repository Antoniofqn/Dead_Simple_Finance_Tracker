import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

const socket = new WebSocket("wss://ws.twelvedata.com/v1/quotes/price?apikey=c6562a12261f45b2862ac84916e34674");

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["stocks"]

  connect() {
    socket.onopen = function(e) {
      console.log("Connection established");
      socket.send(`{
        "action": "subscribe",
        "params": {
        "symbols": "AAPL,INFY,TRP,QQQ,IXIC,EUR/USD,USD/JPY,BTC/USD,ETH/BTC"
        }
        }`);
    };
    socket.onmessage = function(event) {
      console.log(`[message] Data received from server: ${event.data}`);
    };
  }

  disconnect() {
    socket.close()
    console.log("Unsubscribed from the chatroom")
  }
}
