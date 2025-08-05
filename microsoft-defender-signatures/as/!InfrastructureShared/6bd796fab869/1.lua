-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6bd796fab869\1.luac 

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
local l_0_2 = {}
-- DECOMPILER ERROR at PC23: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC24: Overwrote pending register: R3 in 'AssignReg'

if not ("mshta")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC36: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC37: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R5 in 'AssignReg'

if not ("invoke-webrequest")("iwr", l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED

