-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb36f206fa4\0x000000dc_luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperMPOAVPatch"
local l_0_1 = "T1562.001"
local l_0_2 = "mpoav.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC5: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC6: Overwrote pending register: R4 in 'AssignReg'

local l_0_4, l_0_5, l_0_6 = ("DllGetClassObject")(nil, l_0_0)
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
if found_api_tampering(l_0_4, l_0_5, l_0_6, l_0_2, nil, l_0_3, nil, nil, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

