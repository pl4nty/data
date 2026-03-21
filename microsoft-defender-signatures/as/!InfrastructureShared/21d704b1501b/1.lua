-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21d704b1501b\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
if #l_0_1 < 20 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:sub(1, 256)
local l_0_3 = {}
l_0_3.powershell = true
l_0_3.POWERSHELL = true
l_0_3.Powershell = true
l_0_3.PowerShell = true
l_0_3.powerShell = true
l_0_3.POWERshell = true
l_0_3.powerSHELL = true
l_0_3.PowerSHELL = true
l_0_3.powershELL = true
l_0_3.POwershell = true
local l_0_4 = l_0_2:lower()
local l_0_5 = "powershell"
local l_0_6 = #l_0_5
local l_0_7 = 1
while 1 do
  local l_0_8 = l_0_4:find(l_0_5, l_0_7, true)
  if not l_0_8 then
    return mp.CLEAN
  end
  if not l_0_3[l_0_2:sub(l_0_8, l_0_8 + l_0_6 - 1)] then
    return mp.INFECTED
  end
  l_0_7 = l_0_8 + l_0_6
end
l_0_8 = mp
l_0_8 = l_0_8.CLEAN
return l_0_8

