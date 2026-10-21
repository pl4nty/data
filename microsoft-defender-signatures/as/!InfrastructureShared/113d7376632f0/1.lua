-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\113d7376632f0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if not l_0_1:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
l_0_3 = (string.gsub)(l_0_3, "\\", "/")
if #l_0_3 > 255 then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "(https?://[^%s%?%)%]%\'\"}&|<>;,]+)")
if l_0_4 == nil then
  return mp.CLEAN
end
if #l_0_4 < 10 then
  return mp.CLEAN
end
local l_0_5 = {}
l_0_5.SIG_CONTEXT = "CmdHstr"
l_0_5.CONTENT_SOURCE = "Command Line"
l_0_5.FILELESS = "true"
l_0_5.CMDLINE_URL = "true"
l_0_5.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_5.BREAK_AT_FIRST_HIT_PHISH = "60"
l_0_5.BREAK_AT_FIRST_HIT_CLEAN = "60"
local l_0_6 = {}
l_0_6[1] = l_0_4
if CheckUrlReputationSimple(l_0_6, l_0_5, 60) == true then
  return mp.INFECTED
end
return mp.CLEAN

