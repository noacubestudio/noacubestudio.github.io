var cols, rows
var scl = 50
var w = 1500
var h = 1500

var terrain = []

function setup () {
    createCanvas (innerWidth, innerHeight, WEBGL)
    ortho (-width / 2, width / 2, height / 2, -height / 2, 0, 2000)

    cols = w / scl
    rows = h / scl

    for (var x = 0; x < cols; x++) {
        terrain [x] = []
        for (var y = 0; y < rows; y++) {
          terrain [x] [y] = 0 // specify a default value for now
        }
    }
}

function draw () {
    background (245)
    
    orbitControl ()

    rotateX (0.5)
    rotateY (-QUARTER_PI)
    translate (- w / 2, 0, - h / 2)

    fill (255)
    
    for (var y = 0; y < rows - 1; y++) {
        beginShape (TRIANGLE_STRIP)
        for (var x = 0; x < cols; x++) {
            vertex (x * scl, terrain [x] [y], y * scl)
            vertex (x * scl, terrain [x] [y + 1], (y + 1) * scl)
        }
        endShape ()
    }
    push ()
    translate (w / 2, 0, h / 2)
    box (scl)
    pop ()
}