<script>
    import pFrog1 from '$lib/assets/hpFrog1.png?webp'
    import pFrog2 from '$lib/assets/hpFrog2.png?webp'
    import pFrog3 from '$lib/assets/hpFrog3.png?webp'
    import pGizmo from '$lib/assets/hpGizmo.png?webp'
    import pTurtle from '$lib/assets/hpTurtle.png?webp'
    import pFog from '$lib/assets/hpFog.png?webp'
    import pTea from '$lib/assets/hpTea.png?webp'
    import pFlowers from '$lib/assets/hpFlowers.png?webp'
    import pAlgae from '$lib/assets/hpAlgae.png?webp'
    import pAmsterdam from '$lib/assets/hpAmsterdam.png?webp'
    import pPark from '$lib/assets/hpPark.png?webp'
    import pSnow from '$lib/assets/hpSnow.png?webp'
    import pHand from '$lib/assets/hpHand.png?webp'
    import pLantern from '$lib/assets/hpLantern.png?webp'
    import pMaps from '$lib/assets/hpMaps1.png?webp'
    import pRainbow from '$lib/assets/hpRainbow.png?webp'
    import pSunset from '$lib/assets/hpSunset.png?webp'
    import pForest from '$lib/assets/hpForest.png?webp'
</script>

<p class="introText">
    Selected, mostly recent personal work.
    I use HeavyPaint on an iPad to paint, and reference online images or take my own.
</p>

<div class="paintingGrid">
    <div class="format v"><img alt="Painting of a frog" src={pFrog1}/></div>
    <div class="format s"><img alt="Painting of a frog" src={pFrog2}/></div>
    <div class="format s"><img alt="Painting of a frog" src={pFrog3}/></div>
    <div class="format s"><img alt="Painting of my cat" src={pGizmo}/></div>
    <div class="format h"><img alt="Painting of a turtle" src={pTurtle}/></div>
    <div class="format v"><img alt="Painting of a cow" src={pFog}/></div>

    <div class="format v"><img alt="Painting of a tea can" src={pTea}/></div>
    <div class="format h"><img alt="Painting of flowers in a vase on a table" src={pFlowers}/></div>

    <div class="format v"><img alt="Painting of a small green lake in a forest" src={pAlgae}/></div>
    <div class="format h"><img alt="Painting of a landscape from a random Google Streetview" src={pMaps}/></div>
    <div class="format h"><img alt="Painting of a park" src={pPark}/></div>
    <div class="format v"><img alt="Painting of a forest view from above" src={pForest}/></div>
    <div class="format v"><img alt="Painting of a road surrounded by tall snow" src={pSnow}/></div>

    <div class="format s"><img alt="Painting of a lantern in Italy" src={pLantern}/></div>
    <div class="format v"><img alt="Painting of a building in Amsterdam" src={pAmsterdam}/></div>
    <div class="format s"><img alt="Painting of a rainbow above a street" src={pRainbow}/></div>
    <div class="format v"><img alt="Painting of a sunset above a street" src={pSunset}/></div>

    <div class="format s"><img alt="Painting of my hand" src={pHand}/></div>
</div>

<style>
    .introText {
        color: #AAA;
        padding-bottom: 3em;
        max-width: 40em;
        line-height: 160%;
    }
    .paintingGrid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        grid-gap: 0px;
    }
    @media only screen and (min-width: 600px) {
        .paintingGrid {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    @media only screen and (min-width: 900px) {
        .paintingGrid {
            grid-template-columns: repeat(3, 1fr);
        }
    }
    @media only screen and (min-width: 1400px) {
        .paintingGrid {
            grid-template-columns: repeat(4, 1fr);
        }
    }
    .paintingGrid > div {
        outline: solid #333 1px;
        outline-offset: -0.5px;
        aspect-ratio : 1 / 1;
        padding: 2vw;
        display: grid;
        position: relative;
        transition: padding 0.2s;
    }
    .paintingGrid > div.format.s {
        padding: 3vw;
    }
    .paintingGrid > div:hover {
        padding: 1vw;
        background-color: #111;
    }
    .paintingGrid > div.format.s:hover {
        padding: 2vw;
        background-color: #111;
    }
    .paintingGrid > div::before {
        content: "";
        padding-bottom: 100%;
        display: block;
    }
    .paintingGrid > div::before,
    .paintingGrid > div > img {
        grid-area: 1 / 1 / 2 / 2;
    }
    img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }
    .paintingGrid > div > img {
        position: absolute;
        max-width: 100%;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>