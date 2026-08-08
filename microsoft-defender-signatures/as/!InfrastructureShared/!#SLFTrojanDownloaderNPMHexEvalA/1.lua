-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanDownloaderNPMHexEvalA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 51200 then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC12: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC13: Overwrote pending register: R2 in 'AssignReg'

local l_0_2 = "SCPT:NpmY_HexEval_Require"
-- DECOMPILER ERROR at PC14: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC15: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("SCPT:NpmY_HexEval_Axios")("SCPT:NpmY_HexEval_Http") do
  if (mp.get_mpattribute)(l_0_7) then
    l_0_2 = l_0_2 + 1
  end
end
if l_0_2 < 3 then
  return mp.CLEAN
end
local l_0_8 = 0
local l_0_9 = {}
-- DECOMPILER ERROR at PC37: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC38: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R6 in 'AssignReg'

for l_0_13,l_0_14 in ("SCPT:NpmY_Collect_Hostname")("SCPT:NpmY_Collect_UserInfo") do
  if (mp.get_mpattribute)(l_0_14) then
    l_0_8 = l_0_8 + 1
  end
end
if l_0_8 < 1 then
  return mp.CLEAN
end
return mp.INFECTED

