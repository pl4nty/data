-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb37b9bb9b8\0x000000d6_luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperRPCRT4Protect"
local l_0_1 = "T1562.001"
local l_0_2 = "rpcrt4.dll"
local l_0_3 = {}
l_0_3.FunctionBase = true
local l_0_4 = {}
-- DECOMPILER ERROR at PC7: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC8: Overwrote pending register: R5 in 'AssignReg'

local l_0_5, l_0_6, l_0_7 = ("NdrClientCall3")(nil, l_0_0)
;
(bm.add_related_string)((string.format)("%s_Debug", l_0_0), (string.format)("P1: %s P2: %s", (this_sigattrlog[1]).utf8p1, (this_sigattrlog[1]).utf8p2), bm.RelatedStringBMReport)
if isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
if found_api_tampering(l_0_5, l_0_6, l_0_7, l_0_2, l_0_3, l_0_4, nil, nil, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

