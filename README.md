# orbscript
Script to change the colour of a glow-orb


Example usage:

```szymon@szymon-macbook ~ % ./orb.sh #00FF00
Parsing "#00FF00"
"#00FF00" is a Web Colour
Setting your gloworb to #00FF00
szymon@szymon-macbook ~ % ./orb.sh blue   
Parsing "blue"
"blue" is NOT a Web Colour
Trying to parse it as a colour name using regexp "^blue$"
Setting your gloworb to #0000ff
szymon@szymon-macbook ~ % ./orb.sh navajo white
Parsing "navajo white"
"navajo white" is NOT a Web Colour
Trying to parse it as a colour name using regexp "^navajo\ white$"
Setting your gloworb to #ffdead
szymon@szymon-macbook ~ % 
```

(I wonder -- is the fact that “Navajo White” is #FFDead coincidence or political statement?)
