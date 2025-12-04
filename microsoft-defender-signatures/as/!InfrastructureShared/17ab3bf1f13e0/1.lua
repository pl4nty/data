-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17ab3bf1f13e0\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = "TamperAMSIPatch"
local l_0_1 = "T1562.006"
local l_0_2 = "amsi.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC14: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC15: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC17: Overwrote pending register: R6 in 'AssignReg'

local l_0_4, l_0_5, l_0_6 = ("AmsiScanBuffer")("AmsiOpenSession", "AmsiScanString")
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
if found_api_tampering(l_0_4, l_0_5, l_0_6, l_0_2, nil, l_0_3, nil, nil, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

