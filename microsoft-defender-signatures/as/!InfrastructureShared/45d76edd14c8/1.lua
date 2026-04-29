-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45d76edd14c8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "https://"
local l_0_1 = ""
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_4 = (mp.GetScannedPPID)()
if l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_4))
local l_0_5 = (string.match)(l_0_1, "\\\\([%w\\%.%-]+)")
l_0_5 = l_0_0 .. l_0_5
l_0_5 = (string.gsub)(l_0_5, "\\", "/")
local l_0_6 = {}
l_0_6.SIG_CONTEXT = "CmdHstr"
l_0_6.CONTENT_SOURCE = "Command Line"
l_0_6.FILELESS = "true"
l_0_6.CMDLINE_URL = "true"
l_0_6.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_6.BREAK_AT_FIRST_HIT_PHISH = "60"
l_0_6.BREAK_AT_FIRST_HIT_CLEAN = "60"
local l_0_7 = {}
l_0_7[0] = l_0_5
if CheckUrlReputationSimple(l_0_7, l_0_6, 60) == true then
  return mp.INFECTED
end
return mp.LOWFI

