-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bd72f5a9e71\1_luac 

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
local l_0_2 = 0
for l_0_6 in l_0_1:gmatch("\'%w:\\\'%s*;") do
  l_0_2 = l_0_2 + 1
end
if l_0_2 < 3 then
  return mp.CLEAN
end
if contains(l_0_1, "*.*") then
  return mp.INFECTED
end
return mp.CLEAN

