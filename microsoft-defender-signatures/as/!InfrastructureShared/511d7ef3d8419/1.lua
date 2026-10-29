-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\511d7ef3d8419\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if type(l_0_1) ~= "string" then
  return mp.CLEAN
end
if ClassifyClickFixExecution(l_0_1, true) ~= "block" then
  return mp.CLEAN
end
return mp.INFECTED

