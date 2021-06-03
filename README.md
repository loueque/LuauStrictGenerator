# Luau-Stricerator
Generates variety of Luau type checkers, see: https://devforum.roblox.com/t/luau-type-checking-release/878947

Generate different types of scripts (set-up by me, future by users) from having ``--strict`` or having a full-on code with ``foo()`` and ``bar()``

Some examples of this code are:

```lua
--!strict

type x = boolean
type y = string
type z = any

function foo(a: boolean, b: boolean)
	local a:x = true
	local b:y = 'hello'

	return warn(a, b)
end

function bar(c: any)
	local c:z = nil

	return c
end
```
Un-coded ones (they're named with 'uncoded') have only comments, for preview:

```lua
--strict
```

---

Future plans for plugin-users and/or contributors:

* Configure your code with '--!strict' and '--!nonstrict'
* Allow users to customize their code + preference.
* ..and more! :smile:

Notes from me (loueque):

* Hi. :)

---

Want a suggestion? File a Pull request!
Fix a bug in the git? File an issue!

Provided version: v1.5
