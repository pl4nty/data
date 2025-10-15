-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3fd77c553748\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetProcessCommandLine)(l_0_0)):lower()
local l_0_2 = {}
-- DECOMPILER ERROR at PC17: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC18: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R4 in 'AssignReg'

if not ("hidden")("-w h", l_0_2) then
  return mp.CLEAN
end
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

