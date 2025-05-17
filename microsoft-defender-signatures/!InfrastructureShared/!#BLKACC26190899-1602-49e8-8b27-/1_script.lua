-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKACC26190899-1602-49e8-8b27-\1_luac 

-- params : ...
-- function num : 0
if not (mp.IsHipsRuleEnabled)("26190899-1602-49e8-8b27-eb1d0a1ce869") then
  return mp.CLEAN
end
if peattributes.isdamaged then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if (string.lower)(l_0_0) ~= "olk.exe" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2 .. "\\" .. l_0_0)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programfiles%"))
local l_0_5 = ((string.lower)((mp.ContextualExpandEnvironmentVariables)("%userprofile%")))
local l_0_6 = nil
if l_0_5 ~= nil and l_0_5 ~= "" then
  l_0_6 = (string.match)(l_0_5, "(%a:.*\\)[^\\]+$")
end
if (l_0_4 == nil or l_0_4 == "" or (string.find)(l_0_3, l_0_4 .. "\\dyknow\\cloud\\[^\\]+\\olk.exe") ~= nil or (string.find)(l_0_3, l_0_4 .. "\\windowsapps\\microsoft.outlookforwindows_[_%.%w]+\\olk%.exe") == nil) and (l_0_6 == nil or l_0_6 == "" or (string.find)(l_0_3, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\olk.exe") ~= nil or (string.find)(l_0_3, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\olk.exe") == nil) then
  return mp.CLEAN
end
local l_0_7 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
l_0_7 = (MpCommon.PathToWin32Path)(l_0_7)
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
l_0_7 = (string.lower)(l_0_7)
if (mp.IsPathExcludedForHipsRule)(l_0_7, "26190899-1602-49e8-8b27-eb1d0a1ce869") then
  return mp.CLEAN
end
if l_0_4 ~= nil and l_0_4 ~= "" then
  if (string.find)(l_0_7, l_0_4 .. "\\dyknow\\cloud\\[^\\]+\\%a+%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_7, l_0_4 .. "[^\\]*\\microsoft\\edgewebview\\application\\%d+%.%d+%.%d+%.%d+\\msedgewebview2%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_7, l_0_4 .. "[^\\]*\\microsoft\\edge beta\\application\\msedge%.exe") ~= nil then
    return mp.CLEAN
  end
end
if l_0_6 ~= nil and l_0_6 ~= "" then
  if (string.find)(l_0_7, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\olk%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_7, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\update%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_7, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\olk%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_7, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\updateNativeHost%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_7, l_0_6 .. "[^\\]+\\appdata\\local\\outlook\\app%-%d%.%d%d%d%d%.%d%d%d%d%d%d%d\\relaunchNativeHost%.exe") ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED

