<script>
    import Image from "svelte-image";
    const threshold = 0.2;
</script>

<p class="introText">
    Selected, mostly recent personal work.
    I use HeavyPaint on an iPad to paint, and reference online images or take my own.
</p>

<div class="paintings">
    <div class="format s"><Image {threshold} wrapperClass="IMG s" src="images/hpFrog2.png" alt="Painting of a frog"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpFrog1.png" alt="Painting of a frog"/></div>
    <div class="format s"><Image {threshold} wrapperClass="IMG s" src="images/hpFrog3.png" alt="Painting of a frog"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpTurtle.png" alt="Painting of a turtle"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpHorse.png" alt="Painting of a horse"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpFog.png" alt="Painting of a cow"/></div>
    <div class="format s"><Image {threshold} wrapperClass="IMG s" src="images/hpGizmo.png" alt="Painting of a cat"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpTea.png" alt="Painting of a tea can"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpFlowers.png" alt="Painting of a vase with flowers"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpAlgae.png" alt="Painting of a lake in a forest"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpMaps1.png" alt="Painting of a Google Streetview screenshot"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpPark.png" alt="Painting of a park"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpForest.png" alt="Painting of a forest view from above"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpSnow.png" alt="Painting of a road surrounded by tall snow"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpAmsterdam.png" alt="Painting of a building in Amsterdam"/></div>
    <div class="format s"><Image {threshold} wrapperClass="IMG s" src="images/hpRainbow.png" alt="Painting of a rainbow above a street"/></div>
    <div class="format s"><Image {threshold} wrapperClass="IMG s" src="images/hpHand.png" alt="Painting of my hand"/></div>
    <div class="format s"><Image {threshold} wrapperClass="IMG s" src="images/hpLantern.png" alt="Painting of a lantern in Italy"/></div>
    <div class="format v"><Image {threshold} wrapperClass="IMG v" src="images/hpSunset.png" alt="Painting of a sunset above a street"/></div>
</div>


<style>
    :root {
        --grid-size: 540px;
        --format-square-padding: 70px;
        --format-other-padding: 20px;
    }
    .introText {
        color: #AAA;
        padding-bottom: 3em;
        max-width: 40em;
        line-height: 160%;
    }
    .paintings {
        display: grid;
        grid-template-columns: repeat(1, var(--grid-size));
    }
    @media only screen and (min-width: 1200px) {
        .paintings {
            grid-template-columns: repeat(2, var(--grid-size));
        }
    }
    @media only screen and (min-width: 1700px) {
        .paintings {
            grid-template-columns: repeat(3, var(--grid-size));
        }
    }
    @media only screen and (min-width: 2300px) {
        .paintings {
            grid-template-columns: repeat(4, var(--grid-size));
        }
    }
    .format {
        padding-bottom: 3vw;
    }
    :global(.IMG *) {
        width: 96vw;
    }
    @media only screen and (min-width: 600px) {
        .format {
        padding: var(--format-other-padding);
        background-color: transparent;
        outline: 1px solid #333;
        outline-offset: -0.5px;
        }
        .format.s {
            padding: var(--format-square-padding);
        }
        :global(.IMG *) {
            width: calc(var(--grid-size) - 2 * var(--format-other-padding));
            height: calc(var(--grid-size) - 2 * var(--format-other-padding));
            object-fit: contain;
        }
        :global(.IMG.s *) {
            width: calc(var(--grid-size) - 2 * var(--format-square-padding));
            height: calc(var(--grid-size) - 2 * var(--format-square-padding));
            object-fit: contain;
        }
    }
    
</style>