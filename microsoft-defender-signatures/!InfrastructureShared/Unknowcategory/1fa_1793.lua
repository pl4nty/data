-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\1fa_1793.luac 

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
if l_0_2 ~= "olk.exe" then
  return false
end
l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return false
end
l_0_1 = (string.lower)(l_0_1)
local l_0_3 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programfiles%"))
if (l_0_3 == nil or l_0_3 == "" or (string.find)(l_0_1, l_0_3 .. "\\windowsapps\\microsoft.outlookforwindows_[_%.%w]+\\olk%.exe") == nil) and (string.find)(l_0_1, "\\appdata\\local\\outlook\\olk.exe") == nil and (string.find)(l_0_1, "\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\olk.exe") == nil then
  return false
end
local l_0_4 = (ImageConfig.GetImagePath)()
if l_0_4 == nil or l_0_4 == "" then
  return false
end
l_0_4 = (MpCommon.PathToWin32Path)(l_0_4)
if l_0_4 == nil or l_0_4 == "" then
  return false
end
l_0_4 = (string.lower)(l_0_4)
if l_0_3 ~= nil and l_0_3 ~= "" then
  if (string.find)(l_0_4, l_0_3 .. "[^\\]*\\microsoft\\edgewebview\\application\\%d+%.%d+%.%d+%.%d+\\msedgewebview2%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_4, l_0_3 .. "[^\\]*\\microsoft\\edge beta\\application\\msedge%.exe") ~= nil then
    return false
  end
else
  if (string.find)(l_0_4, "\\appdata\\local\\outlook\\olk%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_4, "\\appdata\\local\\outlook\\update%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_4, "\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\olk%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_4, "\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\updateNativeHost%.exe") ~= nil then
    return false
  end
  if (string.find)(l_0_4, "\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\relaunchNativeHost%.exe") ~= nil then
    return false
  end
end
return true

