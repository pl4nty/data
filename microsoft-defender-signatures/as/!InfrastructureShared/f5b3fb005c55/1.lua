-- Threat: !InfrastructureShared
-- Name: f5b3fb005c55
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
local l_0_2 = false
l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
if l_0_0 ~= nil and l_0_1 ~= nil then
  if sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, false, false) == false then
    bm.add_related_file(l_0_0)
    l_0_2 = true
  end
  if sysio.IsFileExists(l_0_1) and mp.IsKnownFriendlyFile(l_0_1, false, false) == false then
    bm.add_related_file(l_0_1)
    l_0_2 = true
  end
  if l_0_2 == true then
    add_parents()
    return mp.INFECTED
  end
end
return mp.CLEAN
