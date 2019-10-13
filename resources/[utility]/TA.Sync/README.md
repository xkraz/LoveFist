# TA.Sync
TA.Sync : Automated deductions based on player count, Client Sided. [38.80% to 10.00%]


### Hypothosis

Every Minute the clients count how many people are in the server and all adjust how mant cars, peds and other things there are.

## Prerequisites

Add it to your server.cfg

```
start TA.Sync
```

## The Config.lua

The only place you should need to edit: *unless you want to modify the entire thing to your liking.*

To refine the traffic down to a manageable level, I have used **1000** as the divider, the default for the natives to be called is 1.0, no traffic is 0.0 and double is 2.0.

Based on this I wanted to start at around 40% normal density and scale it down to a manageable 10% when a server is full.

```
Config.TrafficX     = 388
Config.PedestrianX  = 493
Config.ParkedX      = 488
Config.Divider      = 1000
Config.iPlayers     = 0
Config.Static       = 2.25
Config.Dispatch     = false
```
So in this case, *388* would become *0.388*.

Note: Do not let the overall final number be below 0.0!

## License

This project is licensed under the GNU v3.0 License - see the [LICENSE.md](LICENSE) file for details
