-- Threat: !InfrastructureShared
-- Name: 1c0b38e80f108
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
if l_0_1 == nil or l_0_1 == false then
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
