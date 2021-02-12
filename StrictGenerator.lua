local ChangeHistoryService = game:GetService("ChangeHistoryService")
local SoundService = game:GetService("SoundService")
local user = UserSettings()
local Selection = game:GetService("Selection")

local toolbar = plugin:CreateToolbar("Strict Scripts")
local createStrict = toolbar:CreateButton("Strict Generator", "Generate", "rbxassetid://4458901886")
local createStrictDestroy = toolbar:CreateButton("Destroy", "Destroy", "rbxassetid://149185724")

local function onStrictFolder()
	local Load = script:WaitForChild("LoadUpPlugin")
	local RandomLoad = math.random(6, 12)
	
	local SoundConfig = script.Parent:WaitForChild("Sounds")
	local Insert = SoundConfig:FindFirstChild("InsertSound"):Clone()
	Insert.Parent = SoundService
	
	local folder = Instance.new("Folder")
	folder.Name = "LuauStricts"
	
	local strict = Instance.new("Script")
	strict.Source = "--!strict\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	strict.Name = "strict"
	
	local nonstrict = Instance.new("Script")
	nonstrict.Source = "--!nonstrict\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	nonstrict.Name = "nonstrict"
	
	local nocheck = Instance.new("Script")
	nocheck.Source = "--!nocheck\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	nocheck.Name = "nocheck"
	
	while wait(0.2) do
		Load.Value += 1
		warn("Loading: " .. Load.Value .. ".")
		
		if Load.Value == RandomLoad then
			assert(RandomLoad, "ERR0R")
			folder.Parent = game:GetService("ServerScriptService")
			wait(1)
			nocheck.Parent = folder
			nonstrict.Parent = folder
			strict.Parent = folder
			break
		end
	end
	
	warn("Luau strict folder has been inserted to: " .. game.ServerScriptService.Name .. " !")
	warn("Plugin version: " .. script.Parent.Configuration.PluginVersion.Value .. ".")
	SoundService:PlayLocalSound(Insert)
	Insert.Ended:Wait()
	Insert:Destroy()
	ChangeHistoryService:SetWaypoint("Created Stricts!")
end

local function onDestroyFolder()
	local Destroy = script.Parent:WaitForChild("Sounds")
	local DestroyClone = Destroy.DestroySound:Clone()
	
	local folder = game.ServerScriptService:WaitForChild("LuauStricts")
	
	SoundService:PlayLocalSound(DestroyClone)
end

delay(1, function()
	onDestroyFolder()
end)

createStrict.Click:Connect(onStrictFolder)
createStrictDestroy.Click:Connect(onDestroyFolder)
