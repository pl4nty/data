-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\149d71c0cc6fe\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.hstr_full_log)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = false
if (l_0_0[3]).matched or (l_0_0[4]).matched or (l_0_0[5]).matched or (l_0_0[6]).matched or (l_0_0[7]).matched or (l_0_0[8]).matched or (l_0_0[9]).matched then
  l_0_1 = true
end
if l_0_1 == false then
  return mp.CLEAN
end
local l_0_2 = false
if (l_0_0[10]).matched or (l_0_0[11]).matched or (l_0_0[12]).matched or (l_0_0[13]).matched then
  l_0_2 = true
end
if l_0_2 == false then
  return mp.CLEAN
end
local l_0_3 = (mp.GetScannedPPID)()
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
if l_0_4 == nil or #l_0_4 < 20 or #l_0_4 > 300 then
  return mp.CLEAN
end
if (string.find)(l_0_4, "%\n") ~= nil then
  return mp.CLEAN
end
l_0_4 = l_0_4:lower()
local l_0_5 = (string.gsub)(l_0_4, "%^", "")
l_0_5 = (string.gsub)(l_0_4, "%`", "")
local l_0_6 = (string.match)(l_0_5, "(https?://[^%s%?%)%]%\'\"}]+)")
if l_0_6 == "" or l_0_6 == nil or #l_0_6 < 10 then
  return mp.CLEAN
end
local l_0_7 = {}
l_0_7.SIG_CONTEXT = "CMD"
l_0_7.CONTENT_SOURCE = "CmdLine"
l_0_7.PARENT_CONTEXT = nil
l_0_7.PROCESS_CONTEXT = "CmdLine"
l_0_7.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_7.FILELESS = "true"
l_0_7.CMDLINE_URL = "true"
l_0_7.CMDLINE_MATCH = l_0_4
l_0_7.SIG_REFERENCE = "TrojanDownloader:Win32/ClickFix.MS"
local l_0_8 = CheckUrlReputationSimple
local l_0_9 = {}
-- DECOMPILER ERROR at PC145: No list found for R9 , SetList fails

-- DECOMPILER ERROR at PC146: Overwrote pending register: R10 in 'AssignReg'

l_0_8 = l_0_8(l_0_9, l_0_6, 60)
if l_0_8 then
  l_0_9 = mp
  l_0_9 = l_0_9.INFECTED
  return l_0_9
end
l_0_9 = mp
l_0_9 = l_0_9.CLEAN
return l_0_9

