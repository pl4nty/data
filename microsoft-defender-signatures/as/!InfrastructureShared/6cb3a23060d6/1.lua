-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb3a23060d6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperETWPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "advapi32.dll"
local l_0_3 = {}
-- DECOMPILER ERROR at PC5: No list found for R3 , SetList fails

local l_0_4 = {}
l_0_4.BadInstruction = true
l_0_4.KnownBad = true
l_0_4.FunctionBase = true
local l_0_5 = 10
local l_0_6, l_0_7, l_0_8 = helper_tamperapi_setup(nil, l_0_0)
if isnull(l_0_6) or isnull(l_0_7) or isnull(l_0_8) then
  return mp.CLEAN
end
if found_api_tampering(l_0_6, l_0_7, l_0_8, l_0_2, l_0_4, l_0_3, nil, l_0_5, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

