-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Modkey
modkey = "Mod4"

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "F1",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey, "Control" }, "s", function () awful.spawn.with_shell("systemctl suspend") end,
              {description = "suspend and lock screen", group = "awesome"}),

    awful.key({ modkey,"Control" }, 'l', function() awful.spawn.with_shell("betterlockscreen -l blur") end,
	  			    {description = 'lock the screen', group = 'awesome'}),
    
		awful.key({ modkey						}, 's', function() awful.spawn.with_shell("/home/cylian/.config/polybar/scripts/powermenu.sh") end,
	      			{description = 'open powermenu', group = 'awesome'}),

    awful.key({			  						}, "#122", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%") end,
              {description = "volume -5%", group = "audio"}),

    awful.key({   	  						}, "#123", function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") end,
              {description = "volume +5%", group = "audio"}),

    awful.key({			  						}, "#121", function () awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end,
              {description = "mute/unmute", group = "audio"}),

    awful.key({ modkey, 	  			}, "d", function () mouse.screen.selected_tag.selected = false end,
              {description = "show desktop", group = "client"}),

    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(1) end,
        {description = "focus next by index", group = "client"}),

    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),

    awful.key({ modkey,           }, "w", function () awful.spawn.with_shell("~/.scripts/randwal") end,
              {description = "random wallpaper + colors", group = "launcher"}),
    awful.key({ modkey,           }, "p", function () awful.spawn.with_shell("alacritty -e ~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug") end,
              {description = "launch ncmpcpp", group = "launcher"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ "Mod1",           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "everyone knows what alt+tab does", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    awful.key({			  }, "Print", function () awful.util.spawn_with_shell("maim -s -u | xclip -selection clipboard -t image/png -i") end,
    	      {description = "screenshot", group = "screen"}),
    awful.key({ modkey, "Shift" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.util.spawn([[rofi -run-command "/bin/bash -i -c '{cmd}'" -show drun -show-icons -theme-str 'window {width: 35%;}']]) end,
              {description = "run prompt", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey 		  }, "q",      	function (c) c:kill()                         		end,
              {description = "close", group = "client"}),
    awful.key({ modkey,  	  }, "space",  awful.client.floating.toggle                      	   ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", 	function (c) c:swap(awful.client.getmaster()) 		end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      	function (c) c:move_to_screen()               		end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t", 	function (c) c.ontop = not c.ontop            		end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",	function (c) c.minimized = true		      		end,
    	      {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m", 	function (c) c.maximized = not c.maximized c:raise() 	end,
              {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
