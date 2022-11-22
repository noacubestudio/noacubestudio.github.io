<script>
    import { base } from "$app/paths";
    import logo from '$lib/assets/logo.svg';
    import '$lib/styles/normalize.css';
    import '$lib/styles/global.css';
</script>

<nav>
    <img alt="Personal logo wordmark spelling noa" src={logo} />

    <a href="{base}/">Index</a>
    <a href="{base}/art">Art</a>
    <a href="{base}/music">Music</a>
</nav>

<slot></slot>

<style>
    nav {
        display: flex;
        align-items: center;
        gap: 2em;
    }
    a {
        font-weight: 600;
        text-decoration: none;
        color: black;
    }
</style>