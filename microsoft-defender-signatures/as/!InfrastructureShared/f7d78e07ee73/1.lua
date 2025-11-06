-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f7d78e07ee73\1.luac 

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
-- DECOMPILER ERROR at PC27: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC28: Overwrote pending register: R4 in 'AssignReg'

if (".bat")(l_0_2, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN

