-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3d5d0856a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperAMSIProtect"
local l_0_1 = "T1562.002"
local l_0_2 = "amsi.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC6: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC7: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC8: Overwrote pending register: R5 in 'AssignReg'

local l_0_4, l_0_5, l_0_6 = ("AmsiOpenSession")("AmsiScanString", l_0_0)
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
local l_0_7 = found_api_tampering
local l_0_8 = l_0_4
local l_0_9 = l_0_5
local l_0_10 = l_0_6
local l_0_11 = l_0_2
local l_0_12 = {}
l_0_12.FunctionBase = true
l_0_7 = l_0_7(l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_3, nil, nil, l_0_0, l_0_1)
if l_0_7 then
  l_0_7 = mp
  l_0_7 = l_0_7.INFECTED
  return l_0_7
end
l_0_7 = mp
l_0_7 = l_0_7.CLEAN
return l_0_7

