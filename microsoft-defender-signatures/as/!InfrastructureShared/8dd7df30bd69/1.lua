-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8dd7df30bd69\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = {}
-- DECOMPILER ERROR at PC14: No list found for R2 , SetList fails

local l_0_3 = {}
-- DECOMPILER ERROR at PC16: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC18: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC19: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC22: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC23: Overwrote pending register: R5 in 'AssignReg'

l_0_2 = l_0_2(l_0_3, "", "")
if l_0_2 then
  l_0_2 = mp
  l_0_2 = l_0_2.INFECTED
  return l_0_2
end
l_0_2 = mp
l_0_2 = l_0_2.CLEAN
return l_0_2

