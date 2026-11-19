-- Threat: !InfrastructureShared
-- Name: ddb377ab00f1
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2)
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, false, false) == false then
  return mp.INFECTED
end
return mp.CLEAN
