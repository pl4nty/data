-- Threat: !InfrastructureShared
-- Name: 1a5b38eddbd41
-- Type: 21

local l_0_0 = this_sigattrlog[5].utf8p2
local l_0_1 = this_sigattrlog[5].utf8p1
l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_1))
if string.find(l_0_0, ":\\program ", 1, true) then
  return mp.CLEAN
end
if l_0_1 == nil or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_1)
bm.add_related_file(l_0_0)
return mp.INFECTED
