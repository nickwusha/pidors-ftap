local player = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local coregui = game:GetService("CoreGui")
local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()

local ts = game:GetService("TweenService")

local config = {

	parent = coregui,

	universalfont = Enum.Font.FredokaOne, textsize = 24,
	universaltextcolor = Color3.fromRGB(140, 180, 101),
	accentcolor = Color3.fromRGB(125, 160, 90), bgcolor = Color3.fromRGB(39, 53, 20),

	title = {
		Title = "pidor's FTAP", TitleFont = Enum.Font.FredokaOne, TitleColor = Color3.fromRGB(165, 211, 118), TitleBgColor = Color3.fromRGB(71, 95, 48), TitleSize = 24
	}

}

local jpgui = Instance.new("ScreenGui"); jpgui.IgnoreGuiInset = true; 
local jumpscare = Instance.new("ImageLabel"); jumpscare.Image = "rbxassetid://123752358241390"; jumpscare.BackgroundColor3 = Color3.new(1,1,1); jumpscare.BackgroundTransparency = 1; jumpscare.Size = UDim2.new(1,0,1,0); jumpscare.ScaleType = Enum.ScaleType.Crop; jumpscare.Parent = jpgui
local title = Instance.new("TextLabel"); title.Text = "press right shift to toggle"; title.BackgroundTransparency = 1; title.TextColor3 = Color3.new(1,1,1); title.Font = Enum.Font.FredokaOne; title.AnchorPoint = Vector2.new(0.5, 0.5); title.Size = UDim2.new(0.8, 0, 0.3, 0); title.Position = UDim2.new(0.5, 0, 0.75, 0); title.Parent = jumpscare; title.TextScaled = true
local jumpscaresound = Instance.new("Sound"); jumpscaresound.SoundId = "rbxassetid://131169447699141"; jumpscaresound.PlaybackSpeed = 1; jumpscaresound.Volume = 0.75; jumpscaresound.Parent = jpgui

jpgui.Parent = config.parent; jumpscaresound:Play()

task.wait(2)


ts:Create(jumpscare, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {ImageTransparency = 1}):Play()
ts:Create(title, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {TextTransparency = 1}):Play()


task.wait(1.5);







local toggles = {
	poisongrab = false,

	paintgrab = false,
	lazergrab = false,

	jesusmode = false,

	noclipgrab = false,
	skygrab = false,

	ultragrab = false,
	settingtpkey = false,
	pressingtpkey = false,

	clicktpkey = Enum.KeyCode.LeftAlt,

	clouds = true,

	grab = nil
}

local lightningpresets = {
	Default = {Name = "Default", Ambient = Color3.fromRGB(119, 119, 119), OutdoorAmbient = Color3.fromRGB(200, 200, 200), Brightness = 2, ClockTime = 14, Technology = Enum.Technology.Voxel, GlobalShadows = true},
	Custom = {Name = "Morning", Ambient = Color3.fromRGB(99, 124, 163), OutdoorAmbient = Color3.fromRGB(99, 124, 163), Brightness = 1, ClockTime = 7.1, Technology = Enum.Technology.Future, GlobalShadows = true},
	FPS = {Name = "FPS", Ambient = Color3.fromRGB(255, 255, 255), OutdoorAmbient = Color3.fromRGB(255, 255, 255), Brightness = 0, ClockTime = 12, Technology = Enum.Technology.Voxel, GlobalShadows = false}
}

local lightning = {
	Brightness = lightningpresets.Default.Brightness,
	Ambient = lightningpresets.Default.Ambient,
	OutdoorAmbient = lightningpresets.Default.OutdoorAmbient,
	ClockTime = lightningpresets.Default.ClockTime,
	Technology = lightningpresets.Default.Technology,
	GlobalShadows = lightningpresets.Default.GlobalShadows
}



local menu = {
	maingui = Instance.new("ScreenGui"),
	mainframe = Instance.new("Frame"),
	title = Instance.new("TextLabel")
}

local rounded = Instance.new("UICorner"); rounded.CornerRadius = UDim.new(0, 12)
local rounded2 = Instance.new("UICorner"); rounded2.CornerRadius = UDim.new(0, 6)
local outline = Instance.new("UIStroke"); outline.Color = config.accentcolor; outline.Thickness = 2; outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local function copyrounded2(parent)
	local rund = rounded2:Clone(); rund.Parent = parent
end

local checkmarkbase = Instance.new("TextButton"); outline = outline:Clone(); outline.Parent = checkmarkbase; checkmarkbase.Font = config.universalfont; checkmarkbase.Size = UDim2.new(0, 30, 0, 30); checkmarkbase.BackgroundColor3 = config.bgcolor; checkmarkbase.TextSize = config.textsize; checkmarkbase.TextColor3 = config.accentcolor; checkmarkbase.Text = ""
local checktitlebase = Instance.new("TextLabel"); checktitlebase.Font = config.universalfont; checktitlebase.TextColor3 = config.universaltextcolor; checktitlebase.TextSize = config.textsize; checktitlebase.Size = UDim2.new(0, 140, 0, 30); checktitlebase.BackgroundTransparency = 1; checktitlebase.TextXAlignment = Enum.TextXAlignment.Left checktitlebase.Text = "?"
local textboxbase = Instance.new("TextBox"); textboxbase.Font = config.universalfont; outline = outline:Clone(); copyrounded2(textboxbase); outline.Parent = textboxbase; textboxbase.Size = UDim2.new(0, 30, 0, 30); textboxbase.BackgroundColor3 = config.bgcolor; textboxbase.TextSize = config.textsize; textboxbase.TextColor3 = config.accentcolor; textboxbase.Text = ""
local tabbase = checkmarkbase:Clone(); tabbase.TextSize = tabbase.TextSize / 2; tabbase.TextYAlignment = Enum.TextYAlignment.Bottom; tabbase.TextColor3 = config.title.TitleColor; rounded2 = rounded2:Clone(); rounded2.Parent = tabbase; tabbase.Size = UDim2.new(0, 63, 0, 32); tabbase.BackgroundTransparency = 0.5; tabbase.BackgroundColor3 = config.title.TitleBgColor; tabbase.ZIndex = 2;	tabbase.Position = UDim2.new(0,0,0,6)

menu.maingui.Parent = config.parent; menu.maingui.IgnoreGuiInset = true; menu.maingui.DisplayOrder = 11; menu.maingui.Name = config.title.Title
menu.title.Parent = menu.mainframe; menu.title.Size = UDim2.new(1, 0, 0, 25); menu.title.ZIndex = 3; menu.title.BackgroundColor3 = config.title.TitleBgColor; menu.title.Text = config.title.Title; menu.title.Font = config.title.TitleFont; menu.title.TextColor3 = config.title.TitleColor; menu.title.TextSize = config.title.TitleSize; rounded = rounded:Clone(); rounded.Parent = menu.title; outline = outline:Clone(); outline.Parent = menu.title
menu.mainframe.Parent = menu.maingui; menu.mainframe.Draggable = true; menu.mainframe.Active = true; menu.mainframe.BackgroundColor3 = config.bgcolor; menu.mainframe.Size = UDim2.new(0,320,0,240); menu.mainframe.Position = UDim2.new(0.5, 0, 0.5, 0); menu.mainframe.AnchorPoint = Vector2.new(0.5, 0.5); rounded = rounded:Clone(); rounded.Parent = menu.mainframe; outline = outline:Clone(); outline.Parent = menu.mainframe

local maintab = {
	frame = Instance.new("Frame"),

	tabbutton = tabbase:Clone(),

	poisontitle = checktitlebase:Clone(), nocliptitle = checktitlebase:Clone(), skytitle = checktitlebase:Clone(), clicktitle = checktitlebase:Clone(),
	poisontoggle = checkmarkbase:Clone(), nocliptoggle = checkmarkbase:Clone(), skytoggle = checkmarkbase:Clone(), clicktoggle = checkmarkbase:Clone(),
	keybindtitle = checktitlebase:Clone(), keybindbutton = checkmarkbase:Clone()
}

maintab.tabbutton.Parent = menu.mainframe; maintab.tabbutton.Position = UDim2.new(0, tabbase.Size.X.Offset * 0, 0, tabbase.Position.Y.Offset); maintab.tabbutton.Text = "Main"

maintab.frame.BackgroundTransparency = 1; maintab.frame.Parent = menu.mainframe; maintab.frame.BackgroundTransparency = 1; maintab.frame.BorderSizePixel = 0

maintab.poisontitle.Text = "Poison Grab"; maintab.poisontitle.Position = UDim2.new(0, 70, 0, 70); maintab.poisontitle.Parent = maintab.frame
maintab.nocliptitle.Text = "Noclip Grab"; maintab.nocliptitle.Position = UDim2.new(0, 70, 0, 105); maintab.nocliptitle.Parent = maintab.frame
maintab.skytitle.Text = "Void Grab"; maintab.skytitle.Position = UDim2.new(0, 70, 0, 140); maintab.skytitle.Parent = maintab.frame
maintab.clicktitle.Text = "Ultra Grab"; maintab.clicktitle.Position = UDim2.new(0, 70, 0, 175); maintab.clicktitle.Parent = maintab.frame
maintab.keybindtitle.Text = "TP key: "..tostring(toggles.clicktpkey.Name)..""; maintab.keybindtitle.Position = UDim2.new(0, 110, 0, 210); maintab.keybindtitle.Parent = nil

maintab.poisontoggle.Parent = maintab.frame; maintab.nocliptoggle.Parent = maintab.frame; maintab.skytoggle.Parent = maintab.frame; maintab.clicktoggle.Parent = maintab.frame
maintab.poisontoggle.Position = UDim2.new(0, 30, 0, maintab.poisontitle.Position.Y.Offset); maintab.nocliptoggle.Position = UDim2.new(0, 30, 0, maintab.nocliptitle.Position.Y.Offset); maintab.skytoggle.Position = UDim2.new(0, 30, 0, maintab.skytitle.Position.Y.Offset); maintab.clicktoggle.Position = UDim2.new(0, 30, 0, maintab.clicktitle.Position.Y.Offset);
maintab.keybindbutton.Parent = nil; maintab.keybindbutton.Position = UDim2.new(0, 30, 0, maintab.keybindtitle.Position.Y.Offset); maintab.keybindbutton.Size = UDim2.new(0, 70, 0, 30)

copyrounded2(maintab.poisontoggle);copyrounded2(maintab.nocliptoggle);copyrounded2(maintab.skytoggle);copyrounded2(maintab.clicktoggle)

maintab.poisontoggle.MouseButton1Click:Connect(function()		--POISON
	if toggles.poisongrab == false then
		toggles.poisongrab = true; maintab.poisontoggle.Text = "X"
	else
		toggles.poisongrab = false; maintab.poisontoggle.Text = ""
	end
end)
maintab.nocliptoggle.MouseButton1Click:Connect(function()		--NOCLIP
	if toggles.noclipgrab == false then
		toggles.noclipgrab = true; maintab.nocliptoggle.Text = "X"
	else
		toggles.noclipgrab = false; maintab.nocliptoggle.Text = ""
	end
end)
maintab.skytoggle.MouseButton1Click:Connect(function()			--SKY
	if toggles.skygrab == false then
		toggles.skygrab = true; maintab.skytoggle.Text = "X"
	else
		toggles.skygrab = false; maintab.skytoggle.Text = ""
	end
end)
maintab.clicktoggle.MouseButton1Click:Connect(function()		--ULTRA
	if toggles.ultragrab == false then
		toggles.ultragrab = true; maintab.clicktoggle.Text = "X"
	else
		toggles.ultragrab = false; maintab.clicktoggle.Text = ""
	end
end)


local misctab = {
	frame = Instance.new("Frame"),

	tabbutton = tabbase:Clone(),

	painttitle = checktitlebase:Clone(), painttoggle = checkmarkbase:Clone(),
	lazertitle = checktitlebase:Clone(), lazertoggle = checkmarkbase:Clone(),
	jesustitle = checktitlebase:Clone(), jesustoggle = checkmarkbase:Clone()
}

misctab.tabbutton.Parent = menu.mainframe; misctab.tabbutton.Position = UDim2.new(0, (tabbase.Size.X.Offset + 1) * 1, 0, tabbase.Position.Y.Offset); misctab.tabbutton.Text = "Misc"

misctab.painttitle.Text = "Paint Grab"; misctab.painttitle.Position = UDim2.new(0, 70, 0, 70); misctab.painttitle.Parent = misctab.frame;	misctab.lazertitle.Text = "Radioactive Grab"; misctab.lazertitle.Position = UDim2.new(0, 70, 0, 105); misctab.lazertitle.Parent = misctab.frame;	misctab.jesustitle.Text = "Jesus Mode"; misctab.jesustitle.Position = UDim2.new(0, 70, 0, 140); misctab.jesustitle.Parent = misctab.frame
misctab.painttoggle.Position = UDim2.new(0, 30, 0, misctab.painttitle.Position.Y.Offset); misctab.painttoggle.Parent = misctab.frame;	misctab.lazertoggle.Position = UDim2.new(0, 30, 0, misctab.lazertitle.Position.Y.Offset); misctab.lazertoggle.Parent = misctab.frame;	misctab.jesustoggle.Position = UDim2.new(0, 30, 0, misctab.jesustitle.Position.Y.Offset); misctab.jesustoggle.Parent = misctab.frame;
copyrounded2(misctab.painttoggle);	copyrounded2(misctab.lazertoggle);	copyrounded2(misctab.jesustoggle)

misctab.painttoggle.MouseButton1Click:Connect(function()	--PAINT
	if toggles.paintgrab == false then
		toggles.paintgrab = true; misctab.painttoggle.Text = "X"
	else
		toggles.paintgrab = false; misctab.painttoggle.Text = ""
	end
end)
misctab.lazertoggle.MouseButton1Click:Connect(function()	--RADIOACTIVE
	if toggles.lazergrab == false then
		toggles.lazergrab = true; misctab.lazertoggle.Text = "X"
	else
		toggles.lazergrab = false; misctab.lazertoggle.Text = ""
	end
end)
misctab.jesustoggle.MouseButton1Click:Connect(function()	--JESUS
	if toggles.jesusmode == false then
		toggles.jesusmode = true; misctab.jesustoggle.Text = "X"
	else
		toggles.jesusmode = false; misctab.jesustoggle.Text = ""
	end
end)



local weathertab = {
	frame = Instance.new("Frame"),

	tabbutton = tabbase:Clone(),

	clocktimetitle = checktitlebase:Clone(), clocktimebox = textboxbase:Clone(),
	brightnesstitle = checktitlebase:Clone(), brightnessbox = textboxbase:Clone(),
	globaltitle = checktitlebase:Clone(), globalbox = checkmarkbase:Clone(),
	cloudstitle = checktitlebase:Clone(), cloudstoggle = checkmarkbase:Clone(),

	techlist = Instance.new("Frame"),
	tech1 = checkmarkbase:Clone(), tech2 = checkmarkbase:Clone(), tech3 = checkmarkbase:Clone(),
	technote = checkmarkbase:Clone(),
	preset1 = checkmarkbase:Clone(), preset2 = checkmarkbase:Clone(), preset3 = checkmarkbase:Clone()
}

--painful shit down there

weathertab.tabbutton.Parent = menu.mainframe; weathertab.tabbutton.Position = UDim2.new(0, (tabbase.Size.X.Offset + 1) * 2, 0, tabbase.Position.Y.Offset); weathertab.tabbutton.Text = "Weather"
weathertab.clocktimetitle.Parent = weathertab.frame; weathertab.clocktimetitle.Text = "Time"; weathertab.clocktimetitle.TextSize = 16; weathertab.clocktimetitle.Position = UDim2.new(0, 70, 0, 70)
weathertab.clocktimebox.Parent = weathertab.frame; weathertab.clocktimebox.TextSize = 16; weathertab.clocktimebox.Position = UDim2.new(0, 30, 0, 70)
weathertab.brightnesstitle.Parent = weathertab.frame; weathertab.brightnesstitle.Text = "Brightness"; weathertab.brightnesstitle.TextSize = 16; weathertab.brightnesstitle.Position = UDim2.new(0, 160, 0, 70)
weathertab.brightnessbox.Parent = weathertab.frame; weathertab.brightnessbox.TextSize = 16; weathertab.brightnessbox.Position = UDim2.new(0, 120, 0, 70)
weathertab.globaltitle.Parent = weathertab.frame; weathertab.globaltitle.Text = "Global Shadows"; weathertab.globaltitle.TextSize = 16; weathertab.globaltitle.Position = UDim2.new(0, 70, 0, 105)
weathertab.globalbox.Parent = weathertab.frame; copyrounded2(weathertab.globalbox) weathertab.globalbox.TextSize = 16; weathertab.globalbox.Position = UDim2.new(0, 30, 0, 105)
weathertab.cloudstitle.Parent = weathertab.frame; weathertab.cloudstitle.Text = "Clouds"; weathertab.cloudstitle.TextSize = 12; weathertab.cloudstitle.Position = UDim2.new(0, 250, 0, 45)
weathertab.cloudstoggle.Parent = weathertab.frame; weathertab.cloudstoggle.TextSize = 16; weathertab.cloudstoggle.Position = UDim2.new(0, 253, 0, 70); copyrounded2(weathertab.cloudstoggle)
weathertab.technote.Parent = weathertab.frame; weathertab.technote.Text = "Technology"; weathertab.technote.ZIndex = 2; weathertab.technote.TextSize = 16; weathertab.technote.TextColor3 = config.universaltextcolor; copyrounded2(weathertab.technote); weathertab.technote.Size = UDim2.new(0, 80, 0, 30); weathertab.technote.Position = UDim2.new(0, 180, 0, 105)
weathertab.techlist.Parent = weathertab.technote; weathertab.techlist.Visible = false; weathertab.techlist.Position = UDim2.new(0, 0, 1, 0); weathertab.techlist.Size = UDim2.new(0, weathertab.technote.Size.X.Offset, 0, weathertab.technote.Size.Y.Offset * 3); weathertab.techlist.BackgroundColor3 = config.bgcolor; outline = outline:Clone(); outline.Parent = weathertab.techlist; copyrounded2(weathertab.techlist)
weathertab.tech1.Size = UDim2.new(1, 0, 0.3, 0); weathertab.tech1.Position = UDim2.new(0, 0, 0, 0); weathertab.tech1.Parent = weathertab.techlist; weathertab.tech2.Size = UDim2.new(1, 0, 0.3, 0); weathertab.tech2.Position = UDim2.new(0, 0, 0.3, 0); weathertab.tech2.Parent = weathertab.techlist; weathertab.tech3.Size = UDim2.new(1, 0, 0.3, 0); weathertab.tech3.Position = UDim2.new(0, 0, 0.6, 0); weathertab.tech3.Parent = weathertab.techlist; 
weathertab.tech1.Text = "Voxel"; weathertab.tech2.Text = "Shadow Map"; weathertab.tech3.Text = "Future"; weathertab.tech1.TextSize = 16; weathertab.tech2.TextSize = 16; weathertab.tech3.TextSize = 16
weathertab.preset1.Parent = weathertab.frame; weathertab.preset1.Size = UDim2.new(0, 140, 0, 20); weathertab.preset1.Text = lightningpresets.Default.Name; weathertab.preset1.Position = UDim2.new(0, 30, 0, 150); copyrounded2(weathertab.preset1); weathertab.preset1.TextSize = 16
weathertab.preset2.Parent = weathertab.frame; weathertab.preset2.Size = UDim2.new(0, 140, 0, 20); weathertab.preset2.Text = lightningpresets.Custom.Name; weathertab.preset2.Position = UDim2.new(0, 30, 0, 172); copyrounded2(weathertab.preset2); weathertab.preset2.TextSize = 16
weathertab.preset3.Parent = weathertab.frame; weathertab.preset3.Size = UDim2.new(0, 140, 0, 20); weathertab.preset3.Text = lightningpresets.FPS.Name; weathertab.preset3.Position = UDim2.new(0, 30, 0, 194); copyrounded2(weathertab.preset3); weathertab.preset3.TextSize = 16

--painful shit up there

weathertab.cloudstoggle.MouseButton1Click:Connect(function()	--CLOUDS
	if toggles.clouds == false then
		toggles.clouds = true; weathertab.cloudstoggle.Text = "X"
	else
		toggles.clouds = false; weathertab.cloudstoggle.Text = ""
	end
end)
weathertab.globalbox.MouseButton1Click:Connect(function()	--SHADOWS
	if lightning.GlobalShadows == false then
		lightning.GlobalShadows = true; weathertab.globalbox.Text = "X"
	else
		lightning.GlobalShadows = false; weathertab.globalbox.Text = ""
	end
end)


weathertab.clocktimebox.FocusLost:Connect(function()
	lightning.ClockTime = tonumber(weathertab.clocktimebox.Text)
end)
weathertab.brightnessbox.FocusLost:Connect(function()
	lightning.Brightness = tonumber(weathertab.brightnessbox.Text)
end)
weathertab.technote.MouseButton1Click:Connect(function()
	if weathertab.techlist.Visible ~= true then
		weathertab.techlist.Visible = true
	else 
		weathertab.techlist.Visible = false
	end
end)
weathertab.tech1.MouseButton1Click:Connect(function()
	lightning.Technology = Enum.Technology.Voxel
end)
weathertab.tech2.MouseButton1Click:Connect(function()
	lightning.Technology = Enum.Technology.ShadowMap
end)
weathertab.tech3.MouseButton1Click:Connect(function()
	lightning.Technology = Enum.Technology.Future
end)

weathertab.preset1.MouseButton1Click:Connect(function()
	lightning.Brightness = lightningpresets.Default.Brightness
	lightning.ClockTime = lightningpresets.Default.ClockTime
	lightning.Ambient = lightningpresets.Default.Ambient
	lightning.OutdoorAmbient = lightningpresets.Default.OutdoorAmbient
	lightning.GlobalShadows = lightningpresets.Default.GlobalShadows
	lightning.Technology = lightningpresets.Default.Technology
end)
weathertab.preset2.MouseButton1Click:Connect(function()
	lightning.Brightness = lightningpresets.Custom.Brightness
	lightning.ClockTime = lightningpresets.Custom.ClockTime
	lightning.Ambient = lightningpresets.Custom.Ambient
	lightning.OutdoorAmbient = lightningpresets.Custom.OutdoorAmbient
	lightning.GlobalShadows = lightningpresets.Custom.GlobalShadows
	lightning.Technology = lightningpresets.Custom.Technology
end)
weathertab.preset3.MouseButton1Click:Connect(function()
	lightning.Brightness = lightningpresets.FPS.Brightness
	lightning.ClockTime = lightningpresets.FPS.ClockTime
	lightning.Ambient = lightningpresets.FPS.Ambient
	lightning.OutdoorAmbient = lightningpresets.FPS.OutdoorAmbient
	lightning.GlobalShadows = lightningpresets.FPS.GlobalShadows
	lightning.Technology = lightningpresets.FPS.Technology
	toggles.clouds = false
end)




--tab 4: general stuff

local humanoidtab = {
	frame = Instance.new("Frame"),

	tabbutton = tabbase:Clone(),

	p1title = checktitlebase:Clone(),
	p1button = checkmarkbase:Clone(),
	p1box = textboxbase:Clone()
}

humanoidtab.tabbutton.Parent = menu.mainframe; humanoidtab.tabbutton.Position = UDim2.new(0, (tabbase.Size.X.Offset + 1) * 3, 0, tabbase.Position.Y.Offset); humanoidtab.tabbutton.Text = "🏃‍ stuff"

--tab 5: destruction

local desttab = {
	frame = Instance.new("Frame"),

	tabbutton = tabbase:Clone(),

	killtext = checktitlebase:Clone(),
	killbutton = checkmarkbase:Clone()
}

desttab.tabbutton.Parent = menu.mainframe; desttab.tabbutton.Position = UDim2.new(0, (tabbase.Size.X.Offset + 1) * 4, 0, tabbase.Position.Y.Offset); desttab.tabbutton.Text = "Misc 2"

desttab.killtext.Parent = desttab.frame; desttab.killtext.Text = "more to be added later since i'm lazy"; desttab.killtext.TextSize = 20; desttab.killtext.Size = UDim2.new(0, menu.mainframe.Size.X.Offset, 0, 32); desttab.killtext.Position = UDim2.new(0, 0, 0, 50); desttab.killtext.TextXAlignment = Enum.TextXAlignment.Center
desttab.killbutton.Parent = desttab.frame; desttab.killbutton.Text = "Kill Script"; desttab.killbutton.Position = UDim2.new(0, menu.mainframe.Size.X.Offset / 2, 0, 128); desttab.killbutton.Size = UDim2.new(0, 110, 0, desttab.killbutton.Size.Y.Offset); desttab.killbutton.AnchorPoint = Vector2.new(0.5, 0); copyrounded2(desttab.killbutton) desttab.killbutton.TextColor3 = Color3.fromRGB(250, 0, 0)

desttab.killbutton.MouseButton1Click:Connect(function()
	if jpgui then
		jpgui:Destroy()
	end
	rs = nil; 
	menu.maingui:Destroy(); script:Destroy(); script.Enabled = false
end)

--tabs

maintab.tabbutton.MouseButton1Click:Connect(function()
	maintab.frame.Visible = 		true
	misctab.frame.Visible = 		false
	weathertab.frame.Visible = 		false
	humanoidtab.frame.Visible = 	false
	desttab.frame.Visible = 		false
end)
misctab.tabbutton.MouseButton1Click:Connect(function()
	maintab.frame.Visible = 		false
	misctab.frame.Visible = 		true
	weathertab.frame.Visible = 		false
	humanoidtab.frame.Visible = 	false
	desttab.frame.Visible = 		false
end)
weathertab.tabbutton.MouseButton1Click:Connect(function()
	maintab.frame.Visible = 		false
	misctab.frame.Visible = 		false
	weathertab.frame.Visible = 		true
	humanoidtab.frame.Visible = 	false
	desttab.frame.Visible = 		false
end)
humanoidtab.tabbutton.MouseButton1Click:Connect(function()
	maintab.frame.Visible = 		false
	misctab.frame.Visible = 		false
	weathertab.frame.Visible = 		false
	humanoidtab.frame.Visible = 	true
	desttab.frame.Visible = 		false
end)
desttab.tabbutton.MouseButton1Click:Connect(function()
	maintab.frame.Visible = 		false
	misctab.frame.Visible = 		false
	weathertab.frame.Visible = 		false
	humanoidtab.frame.Visible = 	false
	desttab.frame.Visible = 		true
end)

maintab.frame.BackgroundTransparency = 1; maintab.frame.Parent = menu.mainframe; maintab.frame.BackgroundTransparency = 1; maintab.frame.BorderSizePixel = 0
misctab.frame.BackgroundTransparency = 1; misctab.frame.Parent = menu.mainframe; misctab.frame.BackgroundTransparency = 1; misctab.frame.BorderSizePixel = 0
weathertab.frame.BackgroundTransparency = 1; weathertab.frame.Parent = menu.mainframe; weathertab.frame.BackgroundTransparency = 1; weathertab.frame.BorderSizePixel = 0
desttab.frame.BackgroundTransparency = 1; desttab.frame.Parent = menu.mainframe; desttab.frame.BorderSizePixel = 0
humanoidtab.frame.BackgroundTransparency = 1; humanoidtab.frame.Parent = menu.mainframe; humanoidtab.frame.BorderSizePixel = 0

--closing tabs

misctab.frame.Visible = false; weathertab.frame.Visible = false; desttab.frame.Visible = false; humanoidtab.frame.Visible = false

--[[uis.InputBegan:Connect(function(key)
	if key.KeyCode then
		if toggles.settingtpkey == true then
			toggles.keybind = key.KeyCode
			maintab.keybindtitle.Text = "TP key: "..tostring(key.KeyCode.Name)
			toggles.settingtpkey = false
		end

		if key.KeyCode == toggles.clicktpkey then
			toggles.pressingtpkey = true
		end

	end
end)

uis.InputEnded:Connect(function(key)
	if key.KeyCode then
		if key.KeyCode == toggles.clicktpkey then
			toggles.pressingtpkey = false
		end
	end
end)]]

local poisonparts = {

}

local lazerparts = {

}

local paintparts = {

}

--updating affecting parts

local function updatepaintparts()
	for E, old in pairs(paintparts) do
		table.remove(paintparts, E)
	end
	for _, part in pairs(workspace.Map.FactoryIsland:GetDescendants()) do
		if part:IsA("BasePart") then
			if part.Name == "PaintPlayerPart" then
				table.insert(paintparts, part)
			end
		end
	end
end
local function updatelazerparts()
	for E, old in pairs(lazerparts) do
		table.remove(lazerparts, E)
	end
	for _, part in pairs(workspace.Map.AlwaysHereTweenedObjects.InnerUFO:GetDescendants()) do
		if part:IsA("BasePart") then
			if part.Name == "PaintPlayerPart" then
				table.insert(lazerparts, part)
			end
		end
	end
end
local function updatepoisonparts()
	for E, old in pairs(poisonparts) do
		table.remove(poisonparts, E)
	end
	for _, part in pairs(workspace.Map:GetDescendants()) do
		if part:IsA("BasePart") then
			if part.Name == "PoisonHurtPart" then
				table.insert(poisonparts, part)
			end
		end
	end
end

--affecting parts

local function teleportpoison()
	for _, ppart in pairs(poisonparts) do
		if ppart:IsA("BasePart") then
			if toggles.grab ~= nil then
				ppart.Position = toggles.grab.Position
				if ppart.Size ~= Vector3.new(2,2,2) then
					ppart.Size = Vector3.new(2,2,2)
				end
			end
		end
	end
end
local function teleportlazer()
	for _, ppart in pairs(lazerparts) do
		if ppart:IsA("BasePart") then
			if toggles.grab ~= nil then
				ppart.Position = toggles.grab.Position
				if ppart.Size ~= Vector3.new(2,2,2) then
					ppart.Size = Vector3.new(2,2,2)
				end
			end
		end
	end
end
local function teleportpaint()
	for _, ppart in pairs(paintparts) do
		if ppart:IsA("BasePart") then
			if toggles.grab ~= nil then
				ppart.Position = toggles.grab.Position
				if ppart.Size ~= Vector3.new(2,2,2) then
					ppart.Size = Vector3.new(2,2,2)
				end
			end
		end
	end
end

--removing parts

local function banishpoison()
	for _, ppart in pairs(poisonparts) do
		if ppart:IsA("BasePart") then
			if ppart.Position ~= Vector3.new(0, -50, 0) then
				ppart.Position = Vector3.new(0, -50, 0)
			end
		end
	end
end
local function banishlazer()
	for _, ppart in pairs(lazerparts) do
		if ppart:IsA("BasePart") then
			if ppart.Position ~= Vector3.new(0, -50, 0) then
				ppart.Position = Vector3.new(0, -50, 0)
			end
		end
	end
end
local function banishpaint()
	for _, ppart in pairs(paintparts) do
		if ppart:IsA("BasePart") then
			if ppart.Position ~= Vector3.new(0, -50, 0) then
				ppart.Position = Vector3.new(0, -50, 0)
			end
		end
	end
end

--clipping parts

local function actualnoclip(part)
	for i, p in pairs(part:GetDescendants()) do
		if p:IsA("BasePart") then
			if p.CanCollide ~= false then
				p.CanCollide = false
			end
		end
	end
end
local function clipgrab()
	if toggles.grab ~= nil then
		if toggles.grab.WeldConstraint.Part1.Parent:IsA("Model") then
			for i, p in pairs(toggles.grab.WeldConstraint.Part1.Parent:GetDescendants()) do
				if p:IsA("BasePart") then
					if p.CanCollide ~= true then
						p.CanCollide = true
					end
				end
			end
		end
	end
end
local function noclipgrab()
	if toggles.grab ~= nil then
		if toggles.grab.WeldConstraint.Part1.Parent:FindFirstChildOfClass("Humanoid") then
			actualnoclip(toggles.grab.WeldConstraint.Part1.Parent)
		end
		if toggles.grab.WeldConstraint.Part1.Parent:IsA("Model") and toggles.grab.WeldConstraint.Part1:IsDescendantOf(workspace.Map) == false then
			actualnoclip(toggles.grab.WeldConstraint.Part1.Parent)
		end
	end
end
local function ultragrab()
	if toggles.grab ~= nil then
		toggles.grab.Parent.DragPart.AlignPosition.MaxForce = math.huge; toggles.grab.Parent.DragPart.AlignPosition.Responsiveness = math.huge;	toggles.grab.Parent.DragPart.AlignOrientation.MaxTorque = math.huge; toggles.grab.Parent.DragPart.AlignOrientation.Responsiveness = math.huge
	end
end
local function skygrab()
	if toggles.grab ~= nil then
		if toggles.grab.WeldConstraint.Part1:IsDescendantOf(workspace.Map) == false then
			noclipgrab(); toggles.grab.AssemblyLinearVelocity = Vector3.new(512000, -2000, 512000)
			for _, part in pairs(toggles.grab.WeldConstraint.Part1.Parent:GetDescendants()) do
				if part:IsA("BasePart") then
					part.AssemblyLinearVelocity = Vector3.new(512000, -2000, 512000)
				end
			end
		end
	end
end

workspace.ChildAdded:Connect(function(newchild)
	if newchild:IsA("Model") and newchild.Name == "GrabParts" then
		toggles.grab = newchild.GrabPart
		if toggles.poisongrab == true then
			updatepoisonparts()
		end
		if toggles.lazergrab == true then
			updatelazerparts()
		end
		if toggles.paintgrab == true then
			updatepaintparts()
		end
	end
	newchild.Destroying:Connect(function()
		toggles.grab = nil
		banishpoison()
		banishlazer()
		banishpaint()
	end)
end)

rs.RenderStepped:Connect(function()
	
	if toggles.grab ~= nil then

		if toggles.poisongrab == true then
			teleportpoison()
		end

		if toggles.noclipgrab == true then
			noclipgrab()
		else

		end

		if toggles.skygrab == true then
			skygrab()
		end
		if toggles.ultragrab == true then
			ultragrab()
		end
		if toggles.paintgrab == true then
			teleportpaint()
		end
		if toggles.lazergrab == true then
			teleportlazer()
		end

	else
		banishpoison(); banishlazer(); banishpaint()
	end

	if toggles.clouds == true then
		if workspace.Terrain:FindFirstChildWhichIsA("Clouds") then
			workspace.Terrain:FindFirstChildWhichIsA("Clouds").Enabled = true
		end
	else
		if workspace.Terrain:FindFirstChildWhichIsA("Clouds") then
			workspace.Terrain:FindFirstChildWhichIsA("Clouds").Enabled = false
		end
	end

	if game.Lighting.Brightness ~= lightning.Brightness then
		game.Lighting.Brightness = tonumber(lightning.Brightness)
	end
	if game.Lighting.ClockTime ~= lightning.ClockTime then
		game.Lighting.ClockTime = tonumber(lightning.ClockTime)
	end
	if game.Lighting.Ambient ~= lightning.Ambient then
		game.Lighting.Ambient = lightning.Ambient
	end
	if game.Lighting.OutdoorAmbient ~= lightning.OutdoorAmbient then
		game.Lighting.OutdoorAmbient = lightning.OutdoorAmbient
	end
	if game.Lighting.Technology ~= lightning.Technology then
		game.Lighting.Technology = lightning.Technology
	end
	if game.Lighting.GlobalShadows ~= lightning.GlobalShadows then
		game.Lighting.GlobalShadows = lightning.GlobalShadows
	end

	if toggles.jesusmode == true then
		local water = workspace:WaitForChild("Map"):WaitForChild("AlwaysHereTweenedObjects"):WaitForChild("Ocean").Object.ObjectModel

		if water then
			for i, v in pairs(water:GetChildren()) do
				if v:IsA("BasePart") then
					if v.CanCollide ~= true then
						v.CanCollide = true
					end
				end
			end
		end
	else
		local water = workspace:WaitForChild("Map"):WaitForChild("AlwaysHereTweenedObjects"):WaitForChild("Ocean").Object.ObjectModel

		if water then
			for i, v in pairs(water:GetChildren()) do
				if v:IsA("BasePart") then
					if v.CanCollide ~= false then
						v.CanCollide = false
					end
				end
			end
		end
	end

end)

local showingmenu = true

uis.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.RightShift then
		if showingmenu == false then
			menu.maingui.Enabled = true
			showingmenu = true
		else
			menu.maingui.Enabled = false
			showingmenu = false
		end

	end
end)

task.wait(1.5); jpgui:Destroy()
