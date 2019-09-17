Server Event: "log"
~~~ARGS~~~
_text: The text you want to output to server CONSOLE
  (Colors available)
  -- attributes
  {label = '{reset}', num = 0},
  {label = '{clear}', num  = 0},
  {label = '{bright}', num  = 1},
  {label = '{dim}', num  = 2},
  {label = '{underscore}', num  = 4,},
  {label = '{blink}', num  = 5},
  {label = '{reverse}', num  = 7},
  {label = '{hidden}', num  = 8},

  -- foreground
  {label = '{black}', num  = 30},
  {label = '{red}', num  = 31},
  {label = '{green}', num  = 32},
  {label = '{yellow}', num  = 33},
  {label = '{blue}', num  = 34},
  {label = '{magenta}', num  = 35},
  {label = '{cyan}', num  = 36},
  {label = '{white}', num  = 37},

  -- background
  {label = '{onblack}', num  = 40},
  {label = '{onred}', num  = 41},
  {label = '{ongreen}', num  = 42},
  {label = '{onyellow}', num  = 43},
  {label = '{onblue}', num  = 44},
  {label = '{onmagenta}', num  = 45},
  {label = '{oncyan}', num  = 46},
  {label = '{onwhite}', num  = 47}
_title(OPTIONAL): The name of the log, will change the color to cyan

(if calling from client side script)
TriggerServerEvent('log', _text, _title)

(if calling from server side script)
TriggerEvent('log', 'Pulled out item: {green}' .. name, 'Get Safe Item')

TriggerEvent('log', '{red}R {green}G {blue}B') -Will output [Console Log] R G B (with colored letters)
