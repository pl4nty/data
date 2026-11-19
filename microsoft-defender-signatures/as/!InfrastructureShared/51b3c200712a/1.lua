-- Threat: !InfrastructureShared
-- Name: 51b3c200712a
-- Type: 21

local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\ccm\\systemtemp\\", 1, true) == nil and string.find(l_0_0, "\\windows\\ccmcache\\", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
