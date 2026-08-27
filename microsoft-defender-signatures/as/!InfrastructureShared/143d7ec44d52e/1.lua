-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\143d7ec44d52e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 < 20 or #l_0_1 > 512 then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
local l_0_2 = (string.gsub)(l_0_1, "%^", "")
local l_0_3 = (string.match)(l_0_2, "mshta%.exe.-(https?://[^\"\'<>%s]+)")
if l_0_3 == "" or l_0_3 == nil or #l_0_3 < 7 then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4.SIG_CONTEXT = "CMD"
l_0_4.CONTENT_SOURCE = "MSHTA"
l_0_4.PROCESS_CONTEXT = "MSHTA.EXE"
l_0_4.PARENT_CONTEXT = nil
l_0_4.FILELESS = "true"
l_0_4.CMDLINE_URL = "true"
l_0_4.BREAK_AT_FIRST_HIT_MALWARE = "60"
local l_0_5 = {}
;
(table.insert)(l_0_5, l_0_3)
if CheckUrlReputationSimple(l_0_5, l_0_4, 60) then
  return mp.INFECTED
end
return mp.CLEAN

