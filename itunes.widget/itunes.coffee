# Execute the shell command.
command: "osascript -e 'tell application \"iTunes\" to if player state is playing then name of current track & \"|\" & artist of current track'"

# Set the refresh frequency (milliseconds).
refreshFrequency: 5000

# Render the output.
render: (output) -> """
  <table id='itunes'></table>
"""

# Update the rendered output.
update: (output, domEl) -> 
  dom = $(domEl)
  
  # Parse the JSON created by the shell script.
  data = output.split('\|')
  html = ""
  
  if data[0] != ''
    html += "<p class='song'>#{data[0]}</p>"
    html += "<p class='artist'>#{data[1]}</p>"
  else
    html += "<p class='song'>iTunes is not playing</p>"

  # Set our output.
  $(itunes).html(html)

# CSS Style
# CSS Style
style: """
  margin:0
  padding:0px
  left:250px
  top: 815px
  width: 230px
  background:rgba(#000, .50)
  /*border:1px solid rgba(#000, .25)*/
  border-radius :5px
  font-family Helvetica Neue
      
  #itunes

  .song
    text-align:center
    width: 100%
    padding:2px
    color: rgba(#FFF,0.75)
    
  .artist
    /*height:32px*/
    text-align:center
    width:100%
    color: rgba(#FFF,0.75)
"""