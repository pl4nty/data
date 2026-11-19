-- Threat: !InfrastructureShared
-- Name: c2b3f757a413
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1
l_0_1 = string.match(string.lower(l_0_0), "[%s]+\"?(%a:[^\"]+)\"?$")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
end
return mp.INFECTED
