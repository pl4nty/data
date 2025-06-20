-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2fd7993a0aac\1.luac 

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
local l_0_2 = (string.gsub)(l_0_1, "[\"\'`^()+#&]", "")
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = {}
-- DECOMPILER ERROR at PC38: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC39: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R5 in 'AssignReg'

if not ("activating key snapshot")("notifying  control node", l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED

