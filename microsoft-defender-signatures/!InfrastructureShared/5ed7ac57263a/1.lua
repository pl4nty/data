-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ed7ac57263a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
if (string.find)(l_0_2, "%.wsf\"$") ~= nil or (string.find)(l_0_2, "%.wsf$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

