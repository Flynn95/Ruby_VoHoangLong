import { Controller } from "@hotwired/stimulus"

const characterMapping = {
  '0': '⬜️',
  '1': '1️⃣',
  '2': '2️⃣',
  '3': '3️⃣',
  '4': '4️⃣',
  '5': '5️⃣',
  '6': '6️⃣',
  '7': '7️⃣',
  '8': '8️⃣',
  '9': '💣',
}

export default class extends Controller {
  reveal() {
    let cells = document.querySelectorAll('span.board-cell')

    cells.forEach(cell => {
      if (cell.dataset.revealed === 'true') {
        return
      }

      if (cell.dataset.number !== '9' && cell.dataset.number !== '0') {
        cell.innerHTML = characterMapping[cell.dataset.number]
        cell.dataset.revealed = true
      }
    })
  }

  hide() {
    let cells = document.querySelectorAll('span.board-cell')

    cells.forEach(cell => {
      if (cell.dataset.revealed !== 'true') {
        return
      }

      if (cell.dataset.number !== '9' && cell.dataset.number !== '0') {
        cell.innerHTML = '⬜️'
        cell.dataset.revealed = false
      }
    })
  }
}
