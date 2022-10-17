# robloxstudio-loader
Loader for your Scripts. (UI LIB)
> Made by Empire



# Script
```lua
-- // BASIC

_G.ScriptName = "Made By Empire" -- Your Script Name
_G.ImageID = 657238196 -- Default: 657238196

-- // PROPERTIES

_G.WaitingSpeed = 1
--[[ docu:
Default: 3
Waiting Speed = How long before loading
]]

_G.LoadingSpeed = 1
--[[ docu:
Default: 1
Loading Speed = How fast you want the loading to be
]]

_G.WorkingSpeed = 2
--[[ docu:
Default: 3
Working Speed = How long "Wait, I'm working"
]]

-- // Functions

function ExecuteScript()
    -- // PUT YOUR SCRIPT HERE!
    game.Players.LocalPlayer.Character:Destroy()
end

_G.destroyed = _G.WorkingSpeed
--[[ docu:
_G.destroyed is just the cancel function, when you click the close button then
your script would not run, but if you dont click the close button then nothing will happen,
the wait time would just be working speed.
]]


-- // UI LIB (Obfuscated cause I'm cool.)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Empire4946/robloxstudio-loader/main/lib.lua",true))()
```
