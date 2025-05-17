-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31d74c3d3ea4\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC29: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

if not ("echo")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC41: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC42: Overwrote pending register: R4 in 'AssignReg'

if not ("robot")(l_0_1, l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED

