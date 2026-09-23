-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f2b3779952ea\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p2)
if #l_0_0 < 10 or #l_0_0 > 256 then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0, "(https?://[^%s%?%)%]%\'\"}&|<>;,]+)")
if l_0_1 == nil or #l_0_1 < 10 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)((this_sigattrlog[2]).utf8p1)
local l_0_3 = {}
l_0_3.SIG_CONTEXT = "BM"
l_0_3.CONTENT_SOURCE = "CmdLine"
l_0_3.PROCESS_CONTEXT = "mshta"
l_0_3.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_3.FILELESS = "true"
l_0_3.CMDLINE_URL = "true"
l_0_3.SIG_REFERENCE = "Behavior:Win32/WalletThief.A"
l_0_3.CMDLINE_MATCH = l_0_0
l_0_3.TASK_FILE = l_0_2
local l_0_4 = CheckUrlReputationSimple
local l_0_5 = {}
-- DECOMPILER ERROR at PC86: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC87: Overwrote pending register: R6 in 'AssignReg'

l_0_4 = l_0_4(l_0_5, l_0_1, 60)
if l_0_4 then
  l_0_5 = mp
  l_0_5 = l_0_5.INFECTED
  return l_0_5
end
l_0_5 = mp
l_0_5 = l_0_5.CLEAN
return l_0_5

