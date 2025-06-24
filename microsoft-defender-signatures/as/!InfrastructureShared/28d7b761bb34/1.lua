-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\28d7b761bb34\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.gsub)(l_0_1, "[\"\'`^()+#&]", "")
local l_0_3 = {}
-- DECOMPILER ERROR at PC28: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC30: Overwrote pending register: R5 in 'AssignReg'

if not ("iex %$")("invoke-expression %$", l_0_3) then
  return mp.CLEAN
end
local l_0_4 = contains
local l_0_5 = l_0_2
local l_0_6 = {}
-- DECOMPILER ERROR at PC42: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

if not l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R7 in 'AssignReg'

l_0_4, l_0_6 = l_0_4(l_0_5, l_0_6), {"%[convert%]::frombase64string%(%$"}
if not l_0_4 then
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end
l_0_4 = mp
l_0_4 = l_0_4.INFECTED
return l_0_4

