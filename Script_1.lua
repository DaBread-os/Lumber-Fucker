local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Lumber Fucker", "Midnight")
--local Window = Library.CreateLib("Lumber Fucker", colors)


--Home
local Home = Window:NewTab("Home")
local HomeSection = Home:NewSection("Home info")
HomeSection:NewLabel("-------------------------")
HomeSection:NewLabel("Developed By: Bread?#1483")
HomeSection:NewLabel("-------------------------")


--Player
local Player = Window:NewTab("Local Player")
local PlayerSection = Player:NewSection("Local Player")

PlayerSection:NewButton("Fly", "Go Fly Bitch!", function()
    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.HumanoidRootPart 
local flying = true
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "e" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)





PlayerSection:NewSlider("Walkspeed", "humanoid walkspeed", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    --game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s	

_G.WS = s;
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
Humanoid.WalkSpeed = _G.WS;
end)
Humanoid.WalkSpeed = _G.WS;
end)

PlayerSection:NewSlider("Jump Power", "humanoid jump power", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Infinite Jump", "Go Jump Bitch!", function()
    local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
  end)
end)

PlayerSection:NewButton("Flip", "Go Flip Bitch!", function()
    pl=game.Players.LocalPlayer me=pl.Character xl=me.Torso['Right Shoulder'] t=Instance.new("HopperBin",pl.Backpack) t.Name="the_Parkour_Flip" local debounce=false function _restoreproperties() Holder = player.Character Torso = Holder:FindFirstChild("Torso") RightS = Torso:FindFirstChild("Right Shoulder") LeftS = Torso:FindFirstChild("Left Shoulder") RightH = Torso:FindFirstChild("Right Hip") LeftH = Torso:FindFirstChild("Left Hip") RightS.MaxVelocity = .15 LeftS.MaxVelocity = .15 RightH.MaxVelocity = .1 LeftH.MaxVelocity = .1 RightS.DesiredAngle = 0 LeftS.DesiredAngle = 0 LeftH.DesiredAngle = 0 RightH.DesiredAngle = 0 end function ManageAnimation(value) Holder = player.Character Player = player if value == "no anim" then Anim = Holder:FindFirstChild("Animate") if Anim~=nil then Anim.Disabled = true Anim.Parent = Player end elseif value == "re-anim" then Anim = Player:FindFirstChild("Animate") if Anim~=nil then Anim.Disabled = false Anim.Parent = Holder end end end function Down(ml) for i=1, ml.velocity.y/3 do ml.velocity = ml.velocity+Vector3.new(0,-4.25,0) wait() end ml:Remove() end function Flip() if debounce==true then return end debounce=true Char = player.Character Human = Char.Humanoid Torso = Char.Torso CF = Torso.CFrame Human.PlatformStand = false Human.Sit = true VelUp = Instance.new("BodyVelocity") VelUp.velocity = Vector3.new(0,-5000,0)+Torso.CFrame.lookVector*-30 VelUp.P = VelUp.P*-1000 VelUp.maxForce = Vector3.new(10000,10000,10000)*999 VelUp.Parent = Torso coroutine.resume(coroutine.create(Down),VelUp) Gyro = Instance.new("BodyGyro") Gyro.P = Gyro.P*10 Gyro.maxTorque = Vector3.new(100000,100000,100000)*999 Gyro.cframe = CF Gyro.Parent = Torso for i=1, 16 do Gyro.cframe = Gyro.cframe*CFrame.fromEulerAnglesXYZ(math.pi/9,math.pi/-18,0) wait() end Gyro.cframe = CF wait() Gyro:Remove() Human.PlatformStand = false Human.Sit = false _restoreproperties() debounce=false end function onActive(mouse) player = game.Players.LocalPlayer if player==nil then return end mouse.Button1Down:connect(function() Flip() end) end script.Parent = t.Selected:connect(onActive)
 end)

PlayerSection:NewButton("Reset To Default", "humanoid defaults", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50	
end)

--Settings
local Settings = Window:NewTab("Settings")
local SettingsSection = Settings:NewSection("Settings")

local colors = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

for theme, color in pairs(themes) do
    SettingsSection:NewColorPicker(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end
SettingsSection:NewColorPicker("Color Text", "Color Info", Color3.fromRGB(0,0,0), function(color)
    print(color)
    -- Second argument is the default color
end)

