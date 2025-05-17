-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b9d7834952f1\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
if not StringEndsWith(l_0_1, "-nologo -inputformat text -noexit -executionpolicy unrestricted -command -") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("^(.*)\\[^\\]+$")
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = "\\\\appdata\\\\local\\\\temp\\\\[a-z0-9]{10,}$"
local l_0_6 = false
l_0_6 = (MpCommon.StringRegExpSearch)(l_0_5, l_0_4)
if l_0_6 == false then
  return mp.CLEAN
end
return mp.INFECTED

