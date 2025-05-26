const canvas = document.getElementById('background-canvas');
canvas.style.display = 'block';
const ctx = canvas.getContext('2d');

// const pageHeight = document.documentElement.scrollHeight;
function resizeCanvas() {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  draw();
}

let prevX, prevY;
let alternating = false;
function draw(e) {
  if (e && e.buttons === 1) {
    if (!prevX) {
      prevX = e.clientX;
      prevY = e.clientY;
    }
    alternating = !alternating;
    // const randomColor = Math.floor(Math.random() * 16777215 / 2).toString(16);
    ctx.strokeStyle = alternating ? '#82d' : '#027';
    ctx.lineWidth = 20;
    ctx.lineCap = 'round';
    ctx.beginPath();
    ctx.moveTo(prevX, prevY);
    ctx.lineTo(e.clientX, e.clientY);
    ctx.stroke();
    prevX = e.clientX;
    prevY = e.clientY;
  } else {
    prevX = null;
    prevY = null;
  }
}

// window.addEventListener('resize', resizeCanvas);
resizeCanvas();
// window.addEventListener('scroll', draw);


window.addEventListener('pointermove', draw);