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

<style>
    nav {
        display: flex;
        gap: 0.2em;
        flex-direction: row;
        align-items: center;
        margin-bottom: 3em;
        height: 40px;
    }
    img {
        padding-right: 1em;
    }
    .navbutton {
        display: table;
    }
    a {
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
    .active {
        color: white;
        background-color: #222;
    }
    a:hover:not(.active){
        background-color: #111;
    }
</style>