-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8bd7ae1d7cf2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
local l_0_1 = (mp.GetParentProcInfo)(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
local l_0_3 = {}
-- DECOMPILER ERROR at PC29: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC31: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R6 in 'AssignReg'

if (".bat")(".ps1", "psxec.exe") then
  return mp.INFECTED
end
return mp.CLEAN

