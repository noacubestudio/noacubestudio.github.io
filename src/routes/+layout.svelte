<script>
    import { base } from "$app/paths";
    import { page } from '$app/stores';
    import logo from '$lib/assets/logo.svg';
    import '$lib/styles/normalize.css';
    import '$lib/styles/global.css';
</script>

<nav>
    <img alt="Personal logo wordmark spelling noa" src={logo} />

    <div class="navbutton"><a href="{base}/" class:active={$page.url.pathname === "/"}>projects</a></div>
    <div class="navbutton"><a href="{base}/art" class:active={$page.url.pathname === "/art"}>artworks</a></div>
</nav>

<slot></slot>

<footer>
    <p style="padding-right: 2em;">Noa Hoffmann © 2022</p>
    <div class="footerbutton"><a href="mailto:noa.cubestudio@gmail.com">Mail</a></div>
    <div class="footerbutton"><a rel="external" href="https://twitter.com/noa.cubestudio">Twitter</a></div>
</footer>

<style>
    nav {
        display: flex;
        gap: 0.2em;
        flex-direction: row;
        align-items: center;
        margin-bottom: 3vw;
        height: 40px;
    }
    img {
        padding-right: 1em;
    }
    .navbutton {
        display: table;
    }
    .navbutton > a {
        display: table-cell;
        height: 40px;
        padding-inline: 16px;
        border-radius: 20px;
        background-color: #000;

        vertical-align: middle;
        text-align: center;
        font-weight: 500;
        text-decoration: none;
        color: gray;
        font-size: 1.1em;
    }
    a.active {
        color: white;
        background-color: #222;
    }
    a:hover:not(.active){
        background-color: #111;
    }
    footer {
        color: gray;
        padding-top: 3vw;
        display: flex;
        gap: 0em;
    }
    .footerbutton {
        display: table;
    }
    .footerbutton > a {
        display: table-cell;
        height: 40px;
        padding-inline: 16px;
        border-radius: 20px;

        vertical-align: middle;
        text-align: center;
        color: gray;
        text-decoration: none;
    }
</style>