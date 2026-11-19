-- Threat: !InfrastructureShared
-- Name: 284b3dc821440
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[6].utf8p1)
elseif this_sigattrlog[7].matched then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[7].utf8p1)
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, false, false) == false then
  bm.add_related_file(l_0_0)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
