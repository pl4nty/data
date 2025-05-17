-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\1fb_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("26190899-1602-49e8-8b27-eb1d0a1ce869") then
  return false
end
local l_0_0 = (ImageConfig.GetParentPpid)()
if l_0_0 == nil or l_0_0 == "" then
  return false
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return false
end
local l_0_2 = (string.match)(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" then
  return false
end
l_0_2 = (string.lower)(l_0_2)
if l_0_2 ~= "msedgewebview2.exe" then
  return false
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return false
end
l_0_1 = (string.lower)(l_0_1)
local l_0_3 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programfiles%"))
if (string.find)(l_0_1, l_0_3 .. "[^\\]*\\microsoft\\edgewebview\\application\\[%d%.]+\\msedgewebview2.exe") == nil then
  return false
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_4 == nil or l_0_4 == "" then
  return false
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5, l_0_6 = (string.match)(l_0_4, "%-%-type=([^%s]+).*%-%-webview%-exe%-name=([^%s]+)")
if l_0_5 == nil or l_0_5 == "" then
  return false
end
if l_0_6 == nil or l_0_6 == "" then
  return false
end
local l_0_7 = {}
l_0_7.renderer = true
l_0_7["gpu-process"] = true
l_0_7.utility = true
if l_0_7[l_0_5] ~= true then
  return false
end
local l_0_8 = {}
l_0_8["outlook.exe"] = true
l_0_8["olk.exe"] = true
if l_0_8[l_0_6] ~= true then
  return false
end
local l_0_9 = (ImageConfig.GetImagePath)()
if l_0_9 == nil or l_0_9 == "" then
  return false
end
l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
if l_0_9 == nil or l_0_9 == "" then
  return false
end
l_0_9 = (string.lower)(l_0_9)
if (string.find)(l_0_9, ".:\\windows\\system32\\werfault%.exe") ~= nil then
  return false
end
if (string.find)(l_0_9, ".:\\windows\\system32\\wermgr%.exe") ~= nil then
  return false
end
if (string.find)(l_0_9, ".:\\windows\\syswow64\\wermgr%.exe") ~= nil then
  return false
end
if (string.find)(l_0_9, ".:\\programdata\\app%-v\\[^\\]+\\[^\\]+\\root\\vfs\\programfilesx86\\microsoft\\edgewebview\\application\\[%d%.]+\\identity_helper%.exe") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\microsoft\\edgewebview\\application\\[%d%.]+\\identity_helper%.exe") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\sogouinput\\") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\sogouwbinput\\") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\tencent\\") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\microsoft office\\") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\adobe\\") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\google\\") ~= nil then
  return false
end
if (string.find)(l_0_9, l_0_3 .. "[^\\]*\\7%-zip\\") ~= nil then
  return false
end
return true

