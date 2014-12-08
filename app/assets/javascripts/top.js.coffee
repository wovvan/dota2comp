# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#!
# * classie - class helper functions
# * from bonzo https://github.com/ded/bonzo
# * 
# * classie.has( elem, 'my-class' ) -> true/false
# * classie.add( elem, 'my-new-class' )
# * classie.remove( elem, 'my-unwanted-class' )
# * classie.toggle( elem, 'my-class' )
# 

#jshint browser: true, strict: true, undef: true 

#global define: false 
((window) ->
  
  # class helper functions from bonzo https://github.com/ded/bonzo
  classReg = (className) ->
    new RegExp("(^|\\s+)" + className + "(\\s+|$)")
  
  # classList support for class management
  # altho to be fair, the api sucks because it won't accept multiple classes at once
  toggleClass = (elem, c) ->
    fn = (if hasClass(elem, c) then removeClass else addClass)
    fn elem, c
    return
  "use strict"
  hasClass = undefined
  addClass = undefined
  removeClass = undefined
  if "classList" of document.documentElement
    hasClass = (elem, c) ->
      elem.classList.contains c

    addClass = (elem, c) ->
      elem.classList.add c
      return

    removeClass = (elem, c) ->
      elem.classList.remove c
      return
  else
    hasClass = (elem, c) ->
      classReg(c).test elem.className

    addClass = (elem, c) ->
      elem.className = elem.className + " " + c  unless hasClass(elem, c)
      return

    removeClass = (elem, c) ->
      elem.className = elem.className.replace(classReg(c), " ")
      return
  classie =
    
    # full names
    hasClass: hasClass
    addClass: addClass
    removeClass: removeClass
    toggleClass: toggleClass
    
    # short names
    has: hasClass
    add: addClass
    remove: removeClass
    toggle: toggleClass

  
  # transport
  if typeof define is "function" and define.amd
    
    # AMD
    define classie
  else
    
    # browser global
    window.classie = classie
  return
) window

#fake jQuery
$ = (selector) ->
  document.querySelector selector

accordion = $(".accordion")

#add event listener to all anchor tags with accordion title class
accordion.addEventListener "click", (e) ->
  e.stopPropagation()
  e.preventDefault()
  if e.target and e.target.nodeName is "A"
    classes = e.target.className.split(" ")
    if classes
      x = 0

      while x < classes.length
        if classes[x] is "accordionTitle"
          title = e.target
          
          #next element sibling needs to be tested in IE8+ for any crashing problems
          content = e.target.parentNode.nextElementSibling
          
          #use classie to then toggle the active class which will then open and close the accordion
          classie.toggle title, "accordionTitleActive"
          
          #this is just here to allow a custom animation to treat the content
          if classie.has(content, "accordionItemCollapsed")
            classie.remove content, "animateOut"  if classie.has(content, "animateOut")
            classie.add content, "animateIn"
          else
            classie.remove content, "animateIn"
            classie.add content, "animateOut"
          
          #remove or add the collapsed state
          classie.toggle content, "accordionItemCollapsed"
        x++
  return
