# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load = -> 
    images = document.querySelectorAll(".store .entry > img")
    console.log(images)
    for img in images
        console.log(img)
        img.addEventListener "click", (event) ->
            clicked_image = event.target
            addToCartButton = clicked_image.parentElement.getElementsByClassName("add-to-cart-button")
            console.log(addToCartButton)            
            addToCartButton[0].click()


document.addEventListener "DOMContentLoaded", load