-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb3a9f9757b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperETWPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "ntdll.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC9: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC10: Overwrote pending register: R4 in 'AssignReg'

local l_0_4 = "EtwEventWrite"
-- DECOMPILER ERROR at PC11: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC12: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC13: Overwrote pending register: R7 in 'AssignReg'

local l_0_5, l_0_6, l_0_7 = ("NtTraceEvent")("EtwEventWriteEx", "EtwEventWriteTransfer")
-- DECOMPILER ERROR at PC15: Overwrote pending register: R8 in 'AssignReg'

if ("EtwEventWriteFull")(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
if found_api_tampering(l_0_5, l_0_6, l_0_7, l_0_2, nil, l_0_3, nil, l_0_4, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

