import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["value"]

  connect() {
    // console.log(this.valueTarget)
  }

  format(){

      let size = this.valueTarget.value.length;
      let cleanString = "";

      for(let i = 0; i < size; i ++){
        if(this.valueTarget.value[i] !== "," && this.valueTarget.value[i] !== ".") {
          cleanString += this.valueTarget.value[i]
        }
      }

      if(cleanString !=="")cleanString = String(parseInt(cleanString))

      size = cleanString.length
      this.valueTarget.value = cleanString;

      for (let i = 0; i < 3 - size; i++) {
        this.valueTarget.value =  "0" + this.valueTarget.value
      }
      size = this.valueTarget.value.length

      cleanString = ""
      let z = 0
      for (let i = size - 3; i > -1; i--) {
        if(z%3 == 0 && z > 0) cleanString += "."
        cleanString += this.valueTarget.value[i]
        z += 1
      }

      cleanString = cleanString.split("").reverse().join("")

      this.valueTarget.value = cleanString + this.valueTarget.value.substr(size - 2)

      size = this.valueTarget.value.length

      this.valueTarget.value = this.valueTarget.value.substr(0, size - 2) + "," + this.valueTarget.value.substr(size - 2)

    }

  }
