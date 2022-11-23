<script>
    import pFrog1 from '$lib/assets/hpFrog1.png?webp'
    import pFrog2 from '$lib/assets/hpFrog2.png?webp'
    import pFrog3 from '$lib/assets/hpFrog3.png?webp'
    import pGizmo from '$lib/assets/hpGizmo.png?webp'
    import pTurtle from '$lib/assets/hpTurtle.png?webp'
    import pFog from '$lib/assets/hpFog.png?webp'
    import pTea from '$lib/assets/hpTea.png?webp'
    import pAlgae from '$lib/assets/hpAlgae.png?webp'
    import pAmsterdam from '$lib/assets/hpAmsterdam.png?webp'
    import pPark from '$lib/assets/hpPark.png?webp'
    import pSnow from '$lib/assets/hpSnow.png?webp'
</script>

<div class="paintingGrid">
    <div class="format v"><img alt="Painting of a frog" src={pFrog1}/></div>
    <div class="format s"><img alt="Painting of a frog" src={pFrog2}/></div>
    <div class="format s"><img alt="Painting of a frog" src={pFrog3}/></div>
    <div class="format s"><img alt="Painting of my cat" src={pGizmo}/></div>
    <div class="format h"><img alt="Painting of a turtle" src={pTurtle}/></div>
    <div class="format v"><img alt="Painting of a cow" src={pFog}/></div>
    <div class="format v"><img alt="Painting of a tea can" src={pTea}/></div>
    <div class="format v"><img alt="Painting of a small green lake in a forest" src={pAlgae}/></div>
    <div class="format v"><img alt="Painting of a building in Amsterdam" src={pAmsterdam}/></div>
    <div class="format h"><img alt="Painting of a park" src={pPark}/></div>
    <div class="format v"><img alt="Painting of a road surrounded by tall snow" src={pSnow}/></div>
</div>

<style>
    .paintingGrid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 0px;
    }
    .paintingGrid > div {
        outline: solid #333 1px;
        outline-offset: -0.5px;
        aspect-ratio : 1 / 1;
        padding: 2vw;
        display: grid;
    }
    .paintingGrid > div.format.s {
        padding: 3vw;
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
</style>