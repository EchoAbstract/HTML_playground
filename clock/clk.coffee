
time = () ->
  now = new Date()
  hr = ("0" + now.getHours()).slice(-2)
  mn = ("0" + now.getMinutes()).slice(-2)
  se = ("0" + now.getSeconds()).slice(-2)
  ms = ("0" + now.getMilliseconds()).slice(-3)
#  "#{hr}:#{mn}:#{se}.#{ms}"
  "#{hr}:#{mn}:#{se}"

## Assumes jQuery

fixSize = () ->
#  test.style.fontSize = fontSize;
  test = document.getElementById "Test"
  textHeight = test.clientHeight + 1
  textWidth = test.clientWidth + 1

  windowSize =
    width: window.innerWidth or document.body.clientWidth
    height: window.innerHeight or document.body.clientHeight

  adjWidth = (windowSize.width / 2.0) - (textWidth / 2.0)
  adjHeight = (windowSize.height / 2.0) - (textHeight / 2.0)

  console.log "Window Size: #{JSON.stringify windowSize}"
  console.log("Here: #{adjHeight}, #{adjWidth}")
  $('#clk-body').offset({ top: adjHeight, left: adjWidth})
  $('#stripe').offset({ top: adjHeight, left:adjWidth})
  $('#stripe').height(textHeight)
  $('#stripe').width(textWidth)

fixSize()

update = () ->
  $('#clk-body #clk-inner').replaceWith("<p id=\"clk-inner\">#{time()}</p>")

# 1hz
setInterval update, 1000
# 100hz
#setInterval update, 50
