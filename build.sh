npx create-next-app $1 --example with-typescript
cd $1
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
npx tailwindcss init -p
mkdir styles
cd styles
echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" >> globals.css
cd ../pages
echo "import '../styles/globals.css'
import type { AppProps } from 'next/app'

function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}
export default MyApp" >> _app.tsx
cd ..
rm tailwind.config.js
echo "module.exports = {
  mode: 'jit',
  purge: ['./pages/**/*.{js,ts,jsx,tsx}', './components/**/*.{js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}" >> tailwind.config.js