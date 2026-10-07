-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f3b30051349e\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
if #l_0_0 < 10 or #l_0_0 > 256 then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0, "start%-process mshta.exe (https?://[^%s%?%)%]%\'\"}&|<>;,]+)")
if l_0_1 == nil or #l_0_1 < 10 then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SIG_CONTEXT = "BM"
l_0_2.CONTENT_SOURCE = "CmdLine"
l_0_2.PROCESS_CONTEXT = "svchost.exe"
l_0_2.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_2.FILELESS = "true"
l_0_2.CMDLINE_URL = "true"
l_0_2.SIG_REFERENCE = "Behavior:Win32/WalletThief.A"
l_0_2.CMDLINE_MATCH = l_0_0
local l_0_3 = CheckUrlReputationSimple
local l_0_4 = {}
-- DECOMPILER ERROR at PC53: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

l_0_3 = l_0_3(l_0_4, l_0_1, 60)
if not l_0_3 then
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end
l_0_4 = set_research_data
l_0_4("WtInfectedUrl", (MpCommon.Base64Encode)(l_0_1))
l_0_4 = pcall
l_0_4(MpCommon.RollingQueueCreate, "WalletThiefQueue", 4, 60, 1)
l_0_4 = AppendToRollingQueue
l_0_4("WalletThiefQueue", "Url", l_0_1)
l_0_4 = mp
l_0_4 = l_0_4.INFECTED
return l_0_4

