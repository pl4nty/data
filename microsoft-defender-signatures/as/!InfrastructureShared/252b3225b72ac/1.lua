-- Threat: !InfrastructureShared
-- Name: 252b3225b72ac
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "<conditions>.*path=\"(.-)\".*</conditions>")
if l_0_1 and (string.find(l_0_1, "program files\\windows defender\\", 1, true) or string.find(l_0_1, "\\windows defender advanced threat protection", 1, true)) then
  return mp.INFECTED
end
l_0_1 = string.match(l_0_0, "<conditions>.*binaryname=\"(.-)\".*</conditions>")
if l_0_1 and isMDEBlockingPolicy(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
