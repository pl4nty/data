-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3_490.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 < 28 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\documents", 1, true) ~= nil then
  return mp.INFECTED
end
if (string.find)(l_0_1, "\\downloads", 1, true) ~= nil then
  return mp.INFECTED
end
if (string.find)(l_0_1, "\\desktop", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

