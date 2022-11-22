<script>
    import { base } from "$app/paths";
    import { page } from '$app/stores';
    import logo from '$lib/assets/logo.svg';
    import '$lib/styles/normalize.css';
    import '$lib/styles/global.css';
</script>

<nav>
    <img alt="Personal logo wordmark spelling noa" src={logo} />

    <a href="{base}/" class:active={$page.url.pathname === "/"}>Index</a>
    <a href="{base}/art" class:active={$page.url.pathname === "/art"}>Art</a>
    <a href="{base}/music" class:active={$page.url.pathname === "/music"}>Music</a>
</nav>

<slot></slot>

<style>
    nav {
        display: flex;
        align-items: center;
        gap: 2em;
        margin-bottom: 3em;
    }
    a {
        font-weight: 600;
        text-decoration: none;
        color: black;
        font-size: 1.1em;
    }
    .active {
        color: gray;
    }
    a:hover {
        text-decoration: underline;
    }
</style>