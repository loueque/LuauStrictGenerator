local ChangeHistoryService = game:GetService("ChangeHistoryService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
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
	
	local folder = Instance.new("Folder")
	folder.Name = "LuauStricts"
	
	Insert.Parent = SoundService
	
	local strict = Instance.new("Script")
	strict.Source = "--!strict\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	strict.Name = "strict"
	
	local nonstrict = Instance.new("Script")
	nonstrict.Source = "--!nonstrict\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	nonstrict.Name = "nonstrict"
	
	local nocheck = Instance.new("Script")
	nocheck.Source = "--!nocheck\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	nocheck.Name = "nocheck"
	
	local nolint = Instance.new("Script")
	nolint.Source = "--!nolint\n\nlocal foobar\nfoobar = time()\n\nlocal tab = {'foo', 'bar', 'foobar'}\n\nlocal function foo()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_VERSION)\n\n\ttable.insert(tab, 'noob')\n\n\tfor index, value in ipairs(tab) do\n\tprint(index, value)\n\tend\nend\n\nlocal function bar()\n\tlocal t = tick()\n\tprint(foobar)\n\twarn(_G)\n\n\ttable.insert(tab, 'game.Workspace.Name')\n\n\tfor index, value in ipairs(tab) do \n\t\print(index, value)\n\tend\nend\n\nfoo()\nbar()\n"
	nolint.Name = "nocheck"
	
	while wait(0.1) do
		Load.Value += 1
		warn("Loading: " .. Load.Value .. ".")
		
		if Load.Value == RandomLoad then
			assert(RandomLoad, "ERR0R")
			folder.Parent = game:GetService("ServerScriptService")
			Load.Value = 0
			nocheck.Parent = folder
			nonstrict.Parent = folder
			nolint.Parent = folder
			strict.Parent = folder
			
			if Load.Value > 12 then
				break
			end
			
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
	local folder = game.ServerScriptService:FindFirstChild("LuauStricts")
	
	folder:Destroy()
	SoundService:PlayLocalSound(DestroyClone)
	
	if folder.Parent ~= nil then
		onStrictFolder()
	end
	
	folder.AncestryChanged:Connect(function(_, parent)
		if not parent then
			print(folder.Parent)
			folder.Parent = game:GetService("ServerScriptService")
		else
			warn("Folder hasn't changed it's ancestor")
		end
	end)
end

game.Loaded:Connect(function()
	assert(game.Loaded, "not loaded")
	
	if not game.Loaded then
		game.Loaded:Wait()
		
		if game.Loaded then
			print("Game has loaded!")
		end
	end
end)

game:BindToClose(function()
	local co = coroutine.wrap(function()
		local Audio = script.Parent:WaitForChild("Sounds")
		local onCloseClone = Audio.onClose:Clone()

		if RunService:IsStudio() then
			print(coroutine.isyieldable())
			return onCloseClone:Play()
		elseif RunService:IsClient() and RunService:IsServer() then
			warn(string.lower("What"))
			return error(string.upper("should be studio; running on server and client"))
		end

		RunService.PostSimulation:Wait()

		warn("closed")
	end)
	warn("closed")
end)

createStrict.Click:Connect(onStrictFolder)
createStrictDestroy.Click:Connect(onDestroyFolder)
