-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\113d7376632f0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
l_0_1 = (string.gsub)(l_0_1, "\\", "/")
if #l_0_1 > 255 then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_1, "(https?://[^%s%?%)%]%\'\"}&|<>;,]+)")
if l_0_2 == nil then
  return mp.CLEAN
end
if #l_0_2 < 10 then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3.SIG_CONTEXT = "CmdHstr"
l_0_3.CONTENT_SOURCE = "Command Line"
l_0_3.FILELESS = "true"
l_0_3.CMDLINE_URL = "true"
l_0_3.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_3.BREAK_AT_FIRST_HIT_PHISH = "60"
l_0_3.BREAK_AT_FIRST_HIT_CLEAN = "60"
local l_0_4 = {}
l_0_4[1] = l_0_2
if CheckUrlReputationSimple(l_0_4, l_0_3, 60) == true then
  return mp.INFECTED
end
return mp.CLEAN

