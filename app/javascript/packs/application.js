// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// このエントリーポイントから、JS,CSSを読み込む import->JS&CSSの読み込み

// JS----------------------
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// yarn経由でインストールしたもの
require("jquery")
require("@nathanvda/cocoon")
require("bootstrap")
require("chartkick").use(require("highcharts"))
require("toastr")
// fontawesomeはJS版を使用
import '@fortawesome/fontawesome-free/js/all';

// 自前のJS
require ('message_counter.js')

//画像読み込み用
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

// CSS----------------------
import '../stylesheets/application.scss';
import '../css/tailwind.scss';
import 'toastr';

window.toastr = require('toastr')
window.jQuery = window.$ = require('jquery')

toastr.options = {
  "closeButton": true
}
