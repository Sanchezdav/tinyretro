// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application'

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue'

// Import all the macro components of the application
import * as instances from '../instances'
import store from '../store'
import Routes from '../routes/index.js.erb'

Vue.use(TurbolinksAdapter)
window.Routes = Routes

document.addEventListener('turbolinks:load', () => {
  // --------- Vue -----------
  // Initialize available instances
  Object.keys(instances).forEach((instanceName) => {
    const instance = instances[instanceName]
    const elements = document.querySelectorAll(instance.el)

    elements.forEach((element) => {
      const props = JSON.parse(element.getAttribute('data-props'))

      new Vue({
        el: element,
        store,
        render: h => h(instance.component, { props })
      })
    })
  })

  // --------- Bulma -----------
  let notification = document.querySelector('.alert')

  if (notification) {
    setTimeout(function () {
      notification.classList.add('hidden')
    }, 2000)
  }

  // Get all "navbar-burger" elements
  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach(function ($el) {
      $el.addEventListener('click', function () {

        // Get the target from the "data-target" attribute
        var target = $el.dataset.target;
        var $target = document.getElementById(target);

        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
