-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\20d758974c3b\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if #l_0_1 > 500 then
  return mp.CLEAN
end
if #l_0_1 < 50 then
  return mp.CLEAN
end
local l_0_2 = contains
local l_0_3 = l_0_1
local l_0_4 = {}
-- DECOMPILER ERROR at PC35: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

if not l_0_2 then
  return l_0_2
end
-- DECOMPILER ERROR at PC42: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R5 in 'AssignReg'

l_0_2, l_0_4 = l_0_2(l_0_3, l_0_4), {"curl", "xattr"}
if not l_0_2 then
  l_0_2 = mp
  l_0_2 = l_0_2.CLEAN
  return l_0_2
end
l_0_2 = mp
l_0_2 = l_0_2.INFECTED
return l_0_2

