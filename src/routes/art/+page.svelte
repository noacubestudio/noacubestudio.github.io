<script>
    import pFrog1 from '$lib/assets/hpFrog1.png'
    import pFrog2 from '$lib/assets/hpFrog2.png'
    import pFrog3 from '$lib/assets/hpFrog3.png'
    import pGizmo from '$lib/assets/hpGizmo.png'
    import pTurtle from '$lib/assets/hpTurtle.png'
    import pFog from '$lib/assets/hpFog.png'
    import pTea from '$lib/assets/hpTea.png'
</script>

<div class="paintingGrid">
    <div><img alt="Painting of a frog" src={pFrog1}/></div>
    <div><img alt="Painting of a frog" src={pFrog2}/></div>
    <div><img alt="Painting of a frog" src={pFrog3}/></div>
    <div><img alt="Painting of my cat" src={pGizmo}/></div>
    <div><img alt="Painting of a turtle" src={pTurtle}/></div>
    <div><img alt="Painting of a cow" src={pFog}/></div>
    <div><img alt="Painting of a tea can" src={pTea}/></div>
</div>

<style>
    .paintingGrid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 0px;
    }
    .paintingGrid > div {
        outline: solid #999 1px;
        outline-offset: -0.5px;
        aspect-ratio : 1 / 1;
        padding: 1vw;
        display: grid;
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