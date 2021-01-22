module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/**/*.html.slim',
    './app/**/*.js.erb',
    './app/helpers/**/*.rb',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    screens: {
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
    },
    extend: {
      colors: {
        carrot: {
          '50':  '#faf7ee',
          '100': '#faf1d4',
          '200': '#f7e4a1',
          '300': '#f3ce5e',
          '400': '#edab25',
          '500': '#e9860f',
          '600': '#d7610a',
          '700': '#b2480e',
          '800': '#8c3814',
          '900': '#702e14',
        },
        beaver: {
          '50':  '#fefdfb',
        }
      }
    },
  },
  variants: {
    extend: {
    },
  },
  plugins: [],
}
