# mythic_ui
FiveM UI Made For Mythic RP

![Mythic RP UI](https://i.imgur.com/WewLAnn.png)

Dependencies :

- [Mythic Notify](https://github.com/mythicrp/mythic_notify)
- Mythic Base - NOT PUBLICLY RELEASED

This makes use of NUI to not have to draw to the screen every frame which results in much better performance in a UI that handles everything of the UI aswell as seatbelt & vehicle ejections aswell as cruise control.

## Warning
In order to get this UI to work you either need to trigger a client event that is intended to be fired once a player has selected a character and spawned in, or modify the client script to not create the thread within a function that is called from an event (This was done for the intention of performance and not having the UI displayed while the player is on the character select screen)

>NOTE: As with most MythicRP releases at this point, this has several calls to Mythic Framework resources that have not (and may not) released publicly. This is intended as a **dev resource** at most and not a simple drag & drop to use on public servers. **Do not make any issues asking for it to be made to work on a public framework or why it isn't plug n' play.**