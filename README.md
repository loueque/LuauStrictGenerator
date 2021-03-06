# LuauStrictGenerator
Generates variety of Luau type checkers, see: https://devforum.roblox.com/t/luau-type-checking-release/878947

Generate different types of scripts (set-up by me, future by users) from having ``--strict`` or having a full-on code with ``foo()`` and ``bar()``

Some examples of this code are:

```lua
--!nonstrict

local foobar
foobar = time()

local tab = {'foo', 'bar', 'foobar'}

local function foo()
	local t = tick()
	print(foobar)
	warn(_VERSION)

	table.insert(tab, 'noob')

	for index, value in ipairs(tab) do
	print(index, value)
	end
end

local function bar()
	local t = tick()
	print(foobar)
	warn(_G)

	table.insert(tab, 'game.Workspace.Name')

	for index, value in ipairs(tab) do 
	print(index, value)
	end
end

foo()
bar()
```
Un-coded ones (they're named with 'uncoded') have only comments, for preview:

```lua
--strict

print(string.upper("that's pretty much it"))
```

---

Future plans for plugin-users and/or contributors:

* Configure your code with '--!strict' and '--!nonstrict'
* Better compatibility for spawning (spawn())! 🎨
* Cleaner way to create instances (Janitor?) 🤔
* Allow users to customize their code + preference.
* Faster loading... :zap:
* ..and more! :smile:

Notes from me (loueque):

* Hi. :)

---

Want a suggestion? File a Pull request!
Fix a bug in the git? File an issue!

Provided version: 0.124
Creator version: 0.124b (DEBUG)
