-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3cb32ea11ee4\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0, l_0_1 = nil, nil
l_0_0 = IsProcNameInParentProcessTree("BM", "svchost.exe")
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)((this_sigattrlog[1]).utf8p2)
if l_0_2 == nil or #l_0_2 < 10 or #l_0_2 > 256 then
  return mp.CLEAN
end
local l_0_3 = (string.match)(l_0_2, "mshta%.exe.-(https?://[^%s%?%)%]%}%\'\"&|<>;,]+)")
if l_0_3 == nil or #l_0_3 < 10 then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4.SIG_CONTEXT = "BM"
l_0_4.CONTENT_SOURCE = "CmdLine"
l_0_4.PROCESS_CONTEXT = "mshta.exe"
l_0_4.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_4.FILELESS = "true"
l_0_4.CMDLINE_URL = "true"
l_0_4.SIG_REFERENCE = "Behavior:Win32/WalletThief.A"
l_0_4.CMDLINE_MATCH = l_0_2
local l_0_5 = CheckUrlReputationSimple
local l_0_6 = {}
-- DECOMPILER ERROR at PC69: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC70: Overwrote pending register: R7 in 'AssignReg'

l_0_5 = l_0_5(l_0_6, l_0_3, 60)
if not l_0_5 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = AppendToRollingQueue
l_0_6("WalletThief_Queue", l_0_3, 1, 300, 32, 1)
l_0_6 = bm
l_0_6 = l_0_6.add_related_string
l_0_6("WtBInfectedUrl", l_0_3, bm.RelatedStringBMReport)
l_0_6 = bm
l_0_6 = l_0_6.add_threat_process
l_0_6(l_0_1)
l_0_6 = mp
l_0_6 = l_0_6.INFECTED
return l_0_6

