-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\67bb31250addf\0x00000094_luac 

-- params : ...
-- function num : 0
local l_0_0 = 1800000000
if l_0_0 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
if IsLegacyOrgMachine() then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC18: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = "MpNewlyCreatedHint_2h"
bm_AddRelatedFileFromCommandLine("BM", l_0_2, nil, 35, l_0_1)
return mp.INFECTED

