-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\121b3492534ee\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = "TamperETWPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "ntdll.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC16: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

local l_0_4 = "EtwEventWrite"
-- DECOMPILER ERROR at PC18: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R7 in 'AssignReg'

local l_0_5, l_0_6, l_0_7 = ("NtTraceEvent")("EtwEventWriteEx", "EtwEventWriteTransfer")
-- DECOMPILER ERROR at PC22: Overwrote pending register: R8 in 'AssignReg'

if ("EtwEventWriteFull")(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
if found_api_tampering(l_0_5, l_0_6, l_0_7, l_0_2, nil, l_0_3, nil, l_0_4, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

