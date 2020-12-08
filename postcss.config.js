const environment = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require("tailwindcss")("./app/javascript/css/tailwind.config.js"),
    require("autoprefixer"),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}

// Purgecssで最終的なCSSのサイズを減らす。使っているクラスだけ抽出する設定
if (process.env.RAILS_ENV === "production") {
  environment.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/**/*.html.erb',
        './app/**/*.html.slim',
        './app/**/*.js.erb',
        './app/helpers/**/*.rb',
      ],
      whitelist: ['img', 'video', ':root'],
    })
  )
}

module.exports = environment
