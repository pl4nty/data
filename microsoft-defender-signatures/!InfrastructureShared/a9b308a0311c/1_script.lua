-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a9b308a0311c\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperETWPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "ntdll.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC9: No list found for R3 , SetList fails

local l_0_4 = {}
-- DECOMPILER ERROR at PC14: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = "NtTraceEvent"
-- DECOMPILER ERROR at PC15: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC18: Overwrote pending register: R8 in 'AssignReg'

local l_0_6, l_0_7, l_0_8 = ("EtwEventWriteEx")(("EtwEventWriteTransfer")[1], "EtwEventWriteFull")
if isnull(l_0_6) or isnull(l_0_7) or isnull(l_0_8) then
  return mp.CLEAN
end
if found_api_tampering(l_0_6, l_0_7, l_0_8, l_0_2, l_0_4, l_0_3, nil, l_0_5, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

