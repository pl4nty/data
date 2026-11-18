-- Threat: !InfrastructureShared
-- Name: 5ab317aa3ff9
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 5 then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("%-workingdirectory%s+\"([^\"]+)\"") or l_0_0:match("%-workingdirectory%s+([^%s]+)")
if l_0_1 == nil or #l_0_1 <= 2 then
  return mp.CLEAN
end
l_0_1 = l_0_1:gsub("[\"']", "")
if string.find(l_0_1, "%", 1, true) then
  l_0_1 = MpCommon.ExpandEnvironmentVariables(l_0_1)
end
if l_0_1 == nil or #l_0_1 <= 2 then
  return mp.CLEAN
end
if string.sub(l_0_1, -1) ~= "\\" then
  l_0_1 = l_0_1 .. "\\"
end
bm.trigger_sig("ProcessHasWorkingDirectorySet", l_0_1)
return mp.INFECTED
