-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\155d70d613c7f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = contains
local l_0_4 = l_0_2
local l_0_5 = {}
-- DECOMPILER ERROR at PC36: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC40: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R3 in 'AssignReg'

if not l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R4 in 'AssignReg'

if not l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC56: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC59: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

l_0_5 = l_0_5(l_0_1, l_0_4)
if not l_0_5 then
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end
l_0_5 = mp
l_0_5 = l_0_5.INFECTED
return l_0_5

