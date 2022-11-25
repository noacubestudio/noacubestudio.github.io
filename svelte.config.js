import svelteImage from 'svelte-image';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    paths: {
      base: process.env.NODE_ENV === "production" ? "" : "",
    },
  },
  preprocess: [
    svelteImage({
      placeholder: "blur"
    }),
  ],
};

export default config;
