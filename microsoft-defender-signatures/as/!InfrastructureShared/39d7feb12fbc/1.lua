-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39d7feb12fbc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC27: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

if not ("iwr")("invoke-webrequest", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC40: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC41: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R5 in 'AssignReg'

if not (" iex")("invoke-expression", l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC52: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC53: Overwrote pending register: R5 in 'AssignReg'

if not ("new")(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED

