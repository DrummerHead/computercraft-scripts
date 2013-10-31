# ComputerCraft Scripts

For the game [Minecraft](https://minecraft.net/) using the mod [ComputerCraft](http://www.computercraft.info/)

## Recommended usage

NOTE: Instructions focused on Windows 7 since this is where I'm doing this stuff. PC be my gaming platform. The scripts work wherever.

After having successfully [installed the mod](http://www.computercraft.info/download/) ([this video helped me](http://www.youtube.com/watch?v=wHN_YomZbcs)), [create a mining turtle](http://computercraft.info/wiki/Turtle#Recipes), access its console and type `label set {{name}}` where `{{name}}` is the name of your turtle. Choose a cute name. Save and quit.

Go to folder `%APPDATA%\.minecraft\config`, edit the file `CCTurtle.cfg` and set `B:turtlesNeedFuel=false` so you don't have to manage fuel (These scripts relay on this fact).

Go to folder `%APPDATA%\.minecraft\saves\{{name_of_your_save}}\computer` and you should see numbered folder(s) and labels.txt. The file labels.txt will tell you which folder belongs to which turtle. In this folder throw whatever script you want to use. Then you execute the script from the turtle's console.

Don't use the internal console for editing since the editor's functionalities are non-existent. In Windows you can [use gvim](http://www.vim.org/download.php) and even copy over your settings from your OS X environment (it's still vim), that's what I did. Then you play the game windowed and maximized, and the editor in the other monitor. Profit.


## Documentation

I recommend reading/watching:

* [Back To Basics video](http://www.youtube.com/watch?v=QoAvjIucm90)
* [Turtle API](http://computercraft.info/wiki/Turtle_%28API%29)
* [Programming in Lua](http://www.lua.org/pil/contents.html)

In a hurry? Already know another imperative programming language? then check:

* [Logical Operators](http://www.lua.org/pil/3.3.html)
* [Local Variables and Blocks](http://www.lua.org/pil/4.2.html)
* [if then else](http://www.lua.org/pil/4.3.1.html)
* [while](http://www.lua.org/pil/4.3.2.html)
* [Numeric for](http://www.lua.org/pil/4.3.4.html)
* [Functions](http://www.lua.org/pil/5.html)

That's enough to be dangerous
