;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-zhuce-copy" viewBox="0 0 1870 1024">' +
    '' +
    '<path d="M154.691125 898.451578c42.194767-101.861343 69.541948-189.634745 84.458592-307.241435L362.557324 591.210143c-16.574049 115.051524-43.92123 225.268951-83.629889 307.241435L154.691125 898.451578zM225.890477 298.816293 172.922579 128.172646l125.065012 0L350.126787 298.816293 225.890477 298.816293zM237.492312 532.30321l-54.694362-183.005125 125.065012 0 53.796601 183.005125L237.492312 532.30321zM408.135959 602.811977 408.135959 555.575937l184.66253 0L592.798489 320.293499 390.733207 320.293499 390.733207 273.126517l533.408147 0 0 47.23604-204.551389 0 0 235.282439 186.388994 0 0 47.23604-186.388994 0 0 235.21338 220.296736 0 0 47.23604L375.816563 885.330456l0-47.23604 216.981926 0L592.798489 602.811977 408.135959 602.811977zM594.455894 242.464527 561.376855 110.769895l127.55112 0 32.319396 131.694632L594.455894 242.464527z"  ></path>' +
    '' +
    '<path d="M984.153224 495.080658l31.559752 0L1015.712975 188.598867c0-30.592932 24.032371-55.454006 54.625303-55.454006l226.926356 0c30.661991 0 54.694362 24.792015 54.694362 55.454006l0 306.481791 48.824386 0L1400.783383 188.598867c0-30.592932 25.689776-55.454006 55.523064-55.454006l226.926356 0c30.592932 0 55.523064 24.792015 55.523064 55.454006l0 306.481791 28.106825 0 0 47.23604-28.106825 0 0 301.509576c0 29.833288-24.861074 55.454006-55.523064 55.454006l-123.407607 0 0-47.23604 30.592932 0c13.259239 0 24.032371-10.773132 24.032371-24.032371L1614.450499 542.316698l-90.259509 0 0 179.690316c0 73.754518-13.190181 135.838144-30.592932 177.204208l-122.578905 0c16.574049-40.60642 29.833288-101.861343 29.833288-177.204208L1400.852441 542.316698l-48.824386 0 0 301.509576c0 29.833288-24.032371 55.454006-54.694362 55.454006l-122.509846 0 0-47.23604 30.592932 0c12.430537 0 23.203669-10.773132 23.203669-24.032371L1228.620448 542.316698l-90.328568 0 0 179.690316c0 73.754518-12.499595 135.838144-29.833288 177.204208l-122.578905 0c16.574049-40.60642 29.902347-101.861343 29.902347-177.204208L1015.782034 542.316698l-31.559752 0L984.222282 495.080658zM1138.29188 495.080658l90.328568 0 0-290.736445c0-13.259239-10.773132-24.032371-23.203669-24.032371L1162.255193 180.311842c-14.087942 0-24.032371 10.704073-24.032371 24.032371L1138.222822 495.080658zM1524.260049 495.080658l90.259509 0 0-290.736445c0-13.259239-10.704073-24.032371-24.032371-24.032371l-43.023469 0c-13.190181 0-23.203669 10.704073-23.203669 24.032371L1524.260049 495.080658z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)