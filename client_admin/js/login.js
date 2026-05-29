let banner = document.querySelector('.banner')
let blankBox = document.querySelector('.blank-box')
let block = document.querySelector('.block')
let k = false
let moveBlock = document.querySelector('.move-block')
let isDrop = false
let startX = 0
let offsetX = 0
let targetleft = 0

function getClientX(event) {
  return event.touches ? event.touches[0].clientX : event.clientX
}

function setSliderLeft(left) {
  let maxX = banner.offsetWidth - block.offsetWidth
  let nextLeft = Math.max(0, Math.min(left, maxX))
  block.style.left = nextLeft + 'px'
  moveBlock.style.left = nextLeft + 'px'
  return nextLeft
}

function startDrag(event) {
  if (k) {
    return
  }
  startX = getClientX(event)
  offsetX = block.offsetLeft
  isDrop = true
  event.preventDefault()
}

function moveDrag(event) {
  if (!isDrop || k) {
    return
  }
  let left = setSliderLeft(offsetX + getClientX(event) - startX)
  if (Math.abs(left - targetleft) <= 5) {
    setSliderLeft(targetleft)
    moveBlock.classList.add('is-success')
    layer.msg('验证成功')
    isDrop = false
    k = true
  }
  event.preventDefault()
}

function endDrag() {
  isDrop = false
}

moveBlock.addEventListener('mousedown', startDrag)
moveBlock.addEventListener('touchstart', startDrag, { passive: false })
document.addEventListener('mousemove', moveDrag)
document.addEventListener('touchmove', moveDrag, { passive: false })
document.addEventListener('mouseup', endDrag)
document.addEventListener('touchend', endDrag)

function randomPosition() {
  let maxX = banner.offsetWidth - block.offsetWidth - 12
  let maxY = banner.offsetHeight - block.offsetHeight - 12
  let ranX = Math.round(Math.random() * (maxX - 120) + 120)
  let ranY = Math.round(Math.random() * maxY + 6)

  targetleft = ranX
  blankBox.style.left = ranX + 'px'
  blankBox.style.top = ranY + 'px'

  block.style.top = ranY + 'px'
  block.style.backgroundPosition = -ranX + 'px ' + -ranY + 'px'
  setSliderLeft(0)
}

randomPosition()
